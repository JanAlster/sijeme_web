class WebFormMailer < ApplicationMailer
  def mail_to_admin(contact)
    # hard-coded admin email TODO: do some setting that would be editable from the app
    #mail(to: "sijeme.praha8@gmail.com", subject: 'Zprava z webu Sijeme Praha 8')
    mail(to: "alster@post.cz", from: contact.email, subject: 'Zprava z webu Sijeme Praha 8') do |format|
       format.text { render plain: contact.message }
    end
  end
end
