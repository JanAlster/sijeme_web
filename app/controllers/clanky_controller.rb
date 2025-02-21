class ClankyController < ApplicationController
  before_action :require_authentication, except: %i[index show]
  
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
      redirect_to url_for(controller: "clanky", action: "show", id: @clanek.id)
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
    def set_clanek
      Clanek.find(params[:id])
    end

    def clanek_params
      params.expect(clanek: [ :titul, :telo_clanku])
    end
    
end

