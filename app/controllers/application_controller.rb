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

  private 
  
  # these will be in navbar
  def set_pages
    @pages = {"/": "Úvod", "/onas":"O nás", "/clanky":"Novinky", "/terminy":"Termíny", "/kontakt":"Kontakt"}
  end
  
end
