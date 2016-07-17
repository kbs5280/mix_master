require 'rails_helper'

RSpec.feature "User views all playlists" do
  scenario "user sees a list of all playlists" do
    song_one, song_two, song_three = create_list(:song, 3)

    playlist_name = "Playlist One"

    visit playlists_path
    click_on "New Playlist"
    fill_in "playlist_name", with: playlist_name
    check("song-#{song_one.id}")
    check("song-#{song_three.id}")

    click_on "Create Playlist"

    song_one, song_two, song_three = create_list(:song, 3)

    playlist_name2 = "Playlist Two"

    visit playlists_path
    click_on "New Playlist"
    fill_in "playlist_name", with: playlist_name2
    check("song-#{song_one.id}")
    check("song-#{song_three.id}")

    click_on "Create Playlist"

    visit '/playlists'

    expect(page).to have_content playlist_name
    expect(page).to have_content playlist_name2
  end
end
