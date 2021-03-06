require 'rails_helper'

describe "Countries" do

  describe "index" do
    let!(:country) {create(:country)}
    it "works" do
      visit countries_path
    end

    it "displays countries" do
      visit countries_path
      expect(page).to have_content(country.name)
    end
  end

  describe "new" do

    it "creates entries", js: true do
      visit new_country_path
      fill_in "country[name]", with: "Great Britain"
      click_on "Create Country"
      expect(page).to have_content("Great Britain")
    end

    it "saves entries" do
      visit new_country_path
      fill_in "country[name]", with: "Great Britain"
      click_on "Create Country"
      expect(Country.first.name).to eq("Great Britain")
    end
  end

end
