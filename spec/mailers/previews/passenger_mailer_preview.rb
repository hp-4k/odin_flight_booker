# Preview all emails at http://localhost:3000/rails/mailers/passenger_mailer
class PassengerMailerPreview < ActionMailer::Preview

  # http://master-mind-hp-4k.c9users.io/rails/mailers/passenger_mailer/thank_you_email
  def thank_you_email
    PassengerMailer.thank_you_email(Flight.first, 'Hubert', 'hubert@example.com')
  end

end
