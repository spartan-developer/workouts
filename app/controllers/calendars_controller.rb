class CalendarsController < ApplicationController
  helper LaterDude::CalendarHelper 
  # GET /calendars
  # GET /calendars.json
  def index
    @calendars = Calendar.all
    @year = Time.now.year
    @month = Time.now.month

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @calendars }
    end
  end

  # GET /calendars/1
  # GET /calendars/1.json
  def show
    @calendar = Calendar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @calendar }
    end
  end

  # GET /calendars/new
  # GET /calendars/new.json
  def new
    @calendar = Calendar.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @calendar }
    end
  end

  # GET /calendars/1/edit
  def edit
    @calendar = Calendar.find(params[:id])
  end

  # POST /calendars
  # POST /calendars.json
  def create
    @calendar = Calendar.new(params[:calendar])

    respond_to do |format|
      if @calendar.save
        format.html { redirect_to @calendar, notice: 'Calendar was successfully created.' }
        format.json { render json: @calendar, status: :created, location: @calendar }
      else
        format.html { render action: "new" }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /calendars/1
  # PUT /calendars/1.json
  def update
    @calendar = Calendar.find(params[:id])

    respond_to do |format|
      if @calendar.update_attributes(params[:calendar])
        format.html { redirect_to @calendar, notice: 'Calendar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendars/1
  # DELETE /calendars/1.json
  def destroy
    @calendar = Calendar.find(params[:id])
    @calendar.destroy

    respond_to do |format|
      format.html { redirect_to calendars_url }
      format.json { head :no_content }
    end
  end


  # PREV / calendars/1
  # PREV /calendars/1.json
  def prev_month
    @calendars = Calendar.all

    year = params[:year]
    month = params[:month]
    p_month = Time.new(year, month)-1.month

    @year = p_month.year
    @month = p_month.month

    respond_to do |format|
      format.html { render "index" }
      #format.json { render json: @calendars }
    end    
  end 

  # NEXT / calendars/1
  # NEXT /calendars/1.json
  def next_month
    @calendars = Calendar.all

    year = params[:year]
    month = params[:month]
    n_month = Time.new(year, month)+1.month

    @year = n_month.year
    @month = n_month.month

    respond_to do |format|
      format.html { render "index" }
      #format.json { render json: @calendars }
    end    
  end

end

