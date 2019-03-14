require ('pry')
require_relative('./artists.rb')
require_relative('../db/sqlrunner.rb')

class Album

  attr_accessor :id, :title, :genre, :artist_id

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i
  end

def save()
  sql = "INSERT INTO albums (title, genre, artist_id)
        VALUES ($1, $2, $3)
        RETURNING id"
  values = [@title, @genre, @artist_id]
  @id = SqlRunner.run(sql, values).first['id'].to_i
end

def self.list_all
  sql = "SELECT * FROM albums"
  return SqlRunner.run(sql).map{ |album| Album.new(album)}
end

def self.list_by_artist(id)
  sql = "SELECT * FROM albums WHERE artist_id = $1"
  value = [id]
  return SqlRunner.run(sql, value).map{ |album| Album.new(album) }
end


def artist
  sql = "SELECT * FROM artists WHERE id = $1"
  values = [@artist_id]
  result = SqlRunner.run(sql, values).first
  return Artist.new(result)
end


def find_album_by_id(id)
  sql = "SELECT * FROM albums WHERE artist_id = $1"
  values = [id]
  return SqlRunner.run(sql, values).map{ |album| Album.new(album)}
end

def edit_album(album_id)
    sql = "UPDATE albums SET title = $1, genre = $2
    WHERE id = $3"
    values = [@name, @genre, album_id]
    SqlRunner.run(sql, values)
  end

end
