class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :posts

  validates :email, uniqueness: true

  before_validation :lowercase_email
  #after_create :send_sms
  after_create :send_confirmation_email

  def lowercase_email
    puts "trying to lowercase the email address..."
    self.email = self.email.downcase
    puts "done..."
  end

  # def send_sms
  #   $twilio.account.messages.create(
  #     :from => '',
  #     :to => self.phone_number,
  #     :body => 'Hey there!'
  #   )
  # end

  def send_confirmation_email
    sleep(10)
    self.confirmation_token = SecureRandom.hex(16)
    self.save
    UserMailer.confirmation_email(self).deliver
  end
  handle_asynchronously :send_confirmation_email

  def activate!
    #activation logic    
  end

end
