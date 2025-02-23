class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  # I have tried to set pages as public by default and only protect selected ones later on, but that does not work, so mark public ones here
  allow_unauthenticated_access only: %i[uvod onas terminy kontakt podminky]
  
  # register callback that will set variable used to generate navigation bar
  before_action :set_pages  
  
  # basically just placeholders for XXX.html.erb to be used
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

  #extra route to send the message
  def posli_kontakt
    @contact = Contact.new(name: params[:name], email: params[:email], message: params[:message])
    
    # both Contact model and web form have validation so it is unlikely that things will go wrong here
    if @contact.valid?
        @contact.save
        WebFormMailer.mail_to_admin(@contact).deliver_now()
        flash[:success] = 'Vaše zpráva byla poslána! Děkujeme za Váš zájem :)'
        redirect_to kontakt_path
    else
       flash.now[:error] = 'Nemůžu poslat zprávu.'
       # todo: I am not sure how to print out what is wrong
    end
  end
  private 
  
  # these will be in navbar
  def set_pages
    @pages = {"/": "Úvod", "/onas":"O nás", "/clanky":"Novinky", "/terminy":"Termíny", "/kontakt":"Kontakt"}
  end
  
end
