class GamesController < ApplicationController
  # GET /games
  # GET /games.json
  def index
    @games = current_user.games

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = current_user.games.find(params[:id])

	if @game.completed_at.nil?
		redirect_to edit_game_path(@game) and return
	end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/new
  # GET /games/new.json
  def new
    @game = current_user.games.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game = current_user.games.find(params[:id])

	if !(@game.completed_at.nil?)
		redirect_to game_path(@game) and return
	end
  end

  # POST /games
  # POST /games.json
  def create
	@game = Game.generate(current_user)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render json: @game, status: :created, location: @game }
      else
        format.html { render action: "new" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.json
  def update
    @game = current_user.games.find(params[:id])

	(0..8).each do |x|
		(0..8).each do |y|
			str = x.to_s + "_" + y.to_s
			if !params[str].blank?
				@game.state.set(x, y, params[str])
			end
		end
	end

	if @game.completed?
		@game.completed_at = Time.now
	end

    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game = current_user.games.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end
end
