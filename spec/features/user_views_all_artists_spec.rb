require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "they see a page with all the artists" do
    artist_name = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist_name2 = "Bob Dylan"
    artist_image_path2 = "http://assets.hightimes.com/bob-dylan-smokes-pot.jpg"

    visit artists_path
    click_on "New Artist"
    fill_in "artist_name", with: artist_name
    fill_in "artist_image_path", with: artist_image_path
    click_on "Create Artist"

    expect(page).to have_content artist_name
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")

    visit artists_path
    click_on "New Artist"
    fill_in "artist_name", with: artist_name2
    fill_in "artist_image_path", with: artist_image_path2
    click_on "Create Artist"

    expect(page).to have_content artist_name2
    expect(page).to have_css("img[src=\"#{artist_image_path2}\"]")

    visit artists_path
    expect(page).to have_content artist_name
    expect(page).to have_content artist_name2
  end
end
