require_relative('../models/albums.rb')
require_relative('../models/artists.rb')

# Artist.delete_all
# Album.delete_all

artist1 = Artist.new({'name' => 'After Bovril'})
# artist1.save

artist2 = Artist.new({'name' => 'F**k Your Yankee Blue Jeans'})
# artist2.save

album1 = Album.new({'title' => 'Untitled', 'genre' => 'Slam Poetry', 'artist_id' => artist1.id})
# album1.save

album2 = Album.new({'title' => 'Berzerker', 'genre' => ' Heavy Metal', 'artist_id' => artist2.id})
# album2.save

album3 = Album.new({'title' => 'Gibberish', 'genre' => 'Acid Jazz', 'artist_id' => artist1.id})
# album3.save


 # p album1.artist

# p Album.list_by_artist(1)

# p Artist.find_artist_by_id(artist1.id)

# p Album.find_artist_by_album(3)

# p Album.find_by_artist(1)

# p Album.list_all

# p Artist.list_all

# p artist1.edit_artist

p album1.edit_album(2)
