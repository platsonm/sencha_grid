class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    #@users = User.all
    @users = User.all(:select => "id, email, first, last")
    respond_to do |format|
      format.json { render json: @users }
    end
    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.json { render json: @users }
    #end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id], params[:id])

    respond_to do |format|
      #format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      #format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:data][:id])
    respond_to do |format|
      #format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:data])

    respond_to do |format|
      if @user.save
        format.json { render json: @user }
      else
        redirect_to @user
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:data][:id])

    if @user.update_attributes(params[:data])
      redirect_to @user
      #format.json { render json: @users }
      #format.html { redirect_to @user, notice: 'User was successfully updated.' }
      #format.json { head :no_content }
    else
      #format.html { render action: "edit" }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:data][:id])
    @user.destroy
    redirect_to @user
  end
end
