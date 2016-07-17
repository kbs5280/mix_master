require 'rails_helper'

RSpec.feature "User can edit a playlist" do
  scenario "user views updated playlist on the individual playlist" do

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

    playlist_name3 = "Playlist Three - The Updated Playlist"

    visit "playlists/#{Playlist.all.first.id}"

    expect(current_path).to eq("/playlists/#{Playlist.all.first.id}")

    click_on "Edit"
    fill_in "playlist_name", with: playlist_name3
    check("song-#{song_one.id}")
    check("song-#{song_three.id}")
    click_on "Update Playlist"
    expect(page).to have_content playlist_name3

    expect(page).not_to have_content playlist_name
  end
end
