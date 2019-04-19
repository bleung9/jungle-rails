class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
 
  def purchase_email(order:, to_display:)
    @order = order
    @to_display = to_display
    @products = @order.line_items
    email = order.email
    p @order
    p @to_display
    puts email
    p @products
    mail(to: email, subject: 'Welcome to My Awesome Site')
  end

end
