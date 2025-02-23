class ClankyController < ApplicationController
  allow_unauthenticated_access only: %i[index show]
  
  # this actually works too, which is somewhat strange, I though that :require_authentication is a registered callback for all actions
  #  and allow_unauthenticated_access will remove the callback. If so, adding the :require_authentication seems that it would add the callback second time. But perhaps it is handled properly.
  #  I have not studied the code that much.
  # before_action :require_authentication, except: %i[index show]  
  
  # load appropriate instance variable to be used in views
  def index
    @clanky = Clanek.all
  end

  def show
    @clanek = set_clanek()
  end

  def new
    @clanek = Clanek.new
  end

  def create
    @clanek = Clanek.new(clanek_params)
    if @clanek.save
      redirect_to url_for(controller: "clanky", action: "show", id: @clanek.id) # another of the Clanek/Clanky mess-ups, clanky_path(@clanek.id) should work too
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @clanek = set_clanek()
  end

  def update
    @clanek = set_clanek()
    if @clanek.update(clanek_params)
      redirect_to url_for(controller: "clanky", action: "show", id: @clanek.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @clanek = set_clanek()
    @clanek.destroy
    redirect_to "/clanky"
  end

  private
    #in case we want to adjust setting the "active" clanek 
    def set_clanek
      Clanek.find(params[:id])
    end

    def clanek_params
      params.expect(clanek: [ :titul, :telo_clanku, :featured_image])
    end
    
end

