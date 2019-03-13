require ('pry')
require_relative('./albums.rb')
require_relative('../db/sqlrunner.rb')

class Artist
  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
  end

def save
  sql = "INSERT INTO artists (name)  VALUES ($1)  RETURNING id"
  values = [@name]
  @id = SqlRunner.run(sql, values).first['id'].to_i
end

def self.list_all
  sql = "SELECT * FROM artists"
  return SqlRunner.run(sql).map{ |artist| Artist.new(artist) }
end


def self.find_artist_by_id(id)
  sql = "SELECT * FROM albums WHERE artist_id = $1"
  values = [id]
  hash = SqlRunner.run(sql, values).first
  result = Artist.new(hash)
  return result
end

end
