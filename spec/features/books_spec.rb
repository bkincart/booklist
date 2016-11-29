require "spec_helper" # or
# require "rails_helper"

feature "template", focus: true do

  # User Story
  # ----------
  # As a user
  # I want to add a book
  # So that I can view my favorite books later

  # Acceptance Criteria
  # -------------------
  # * I must enter a title
  # * I must enter an author
  # * I must enter a rating
  # * I must enter a URL

  context "create" do
    scenario "user creates a Book" do
      visit "/"
      click_on "Add Book"

      fill_in "Title", with: "Worm"
      fill_in "Author", with: "Wildbow"
      fill_in "Rating", with: "5"
      fill_in "URL", with: "www.parahumans.wordpress.com"

      click_on "Submit"
      expect(page).to have_content("Worm")
    end
  end

  context "read" do
    scenario "user views a book" do
      
    end
  end

  xcontext "pending specs" do
    context "update" do
      scenario "user edits a thing" do

      end
    end

    context "delete" do
      scenario "user deletes a thing" do

      end
    end
  end
end
