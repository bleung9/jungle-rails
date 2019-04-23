require 'rails_helper'

RSpec.feature "Visitor navigates to product detail page by clicking on a product on home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see the product details for item they clicked" do

    # ACT
    visit root_path

    save_screenshot 'before_clicking_product.png'

    # product = page.find('article.product:first-child')
    # page.all('Details')[0].  
    
    page.all('article.product')[0].all('a')[0].click
    page.find('.products-show')

    # DEBUG

    # VERIFY
    expect(page).to have_css '.products-show'

    save_screenshot 'product_details.png'


  end

end