class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  # cannot un-register require_authentication globally, since session controller unregisters it too later on 
  #allow_unauthenticated_access except: %i[]  # this also does not work, it will not set session for SessionController.destroy path
  # I really only can allow access specifically for the pages here
  allow_unauthenticated_access only: %i[uvod onas terminy kontakt podminky]
  
  before_action :set_pages  # I do not know how to add this to a "class attribute"
  helper_method :current_page
  
  
  def uvod
  end
  
  def onas
  end
  
  def terminy
  end
  
  def kontakt
  end

  def podminky
  end

  def posli_kontakt
    # puts params
    # {"authenticity_token" => "DE8vOyQrLSIyEn4uEBK653PkcalMkqznJbxcOKZ7kEkiijikPk1UH0Gr5hLvnMmBk80Z74BC4rRvSwtkjDSHjA", "name" => "ddd", "email" => "alster@post.cz", "message" => "fff", "commit" => "Odeslat zprávu", "controller" => "application", "action" => "posli_kontakt"}
    # does not have view, so no rendering 
    
    @contact = Contact.new(name: params[:name], email: params[:email], message: params[:message])
    WebFormMailer.mail_to_admin(@contact).deliver_now()
    #WebFormMailer.send(Contact.new(params.slice(:name, :email, :message)))  # ForbiddenAttributes error (still cannot figure that one out)
    
    """
    @contact = Contact.new(contact_params)

    if @contact.valid?
      # Here you would typically send the email (not implemented in this simple form)
      # Example: ContactMailer.send_contact(@contact).deliver_now
      flash[:success] = 'Your message has been sent successfully!'
      redirect_to new_contact_path
    else
      flash.now[:error] = 'Please fix the errors below.'
      render :new
    end
    """
  end
  private 
  
  # these will be in navbar
  def set_pages
    @pages = {"/": "Úvod", "/onas":"O nás", "/clanky":"Novinky", "/terminy":"Termíny", "/kontakt":"Kontakt"}
  end
  
end
