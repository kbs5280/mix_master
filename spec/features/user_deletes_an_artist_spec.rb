require 'rails_helper'

RSpec.feature "user deletes an artist" do
  scenario "they see the artists page an the artist is no longer available" do
    artist_name = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    visit artists_path
    click_on "New Artist"
    fill_in "artist_name", with: artist_name
    fill_in "artist_image_path", with: artist_image_path
    click_on "Create Artist"

    expect(page).to have_content artist_name
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")

    expect(current_path).to eq("/artists/#{Artist.all.first.id}")

    click_on "Delete"
    expect(current_path).to eq("/artists")

    expect(page).not_to have_content artist_name
  end
end
