class PunchesController < ApplicationController
  # GET /punches
  # GET /punches.xml
  def index
    @punches = Punch.find(:all, :limit => 5, :order => "ptime DESC")
    @users = User.all # for sidebare
    @punch = Punch.new # for new one
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @punches }
    end
  end

  # GET /punches/1
  # GET /punches/1.xml
  def show
    @punch = Punch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @punch }
    end
  end

  # GET /punches/new
  # GET /punches/new.xml
  def new
    @punch = Punch.new
    @users = User.all # for sidebar
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @punch }
    end
  end

  # GET /punches/1/edit
  def edit
    @punch = Punch.find(params[:id])
  end

  # POST /punches
  # POST /punches.xml
  def create
    @punch = Punch.new(params[:punch])
    ptime = Time.now # @punch.created_at
    @punch.ptime = ptime    
    user = User.find(@punch.user_id)
    if user.employed
      user.clocked_in = !user.clocked_in
      user.save
      period = Period.find(:first, :order => "ending DESC")
      if period.ending < ptime
        pending = period.ending
        period = Period.new
        period.starting = pending
        period.ending = pending.advance(:days => 14)
        period.save
      end
      @punch.period_id = period.id
    else
      flash[:notice] = "User not employed. ID: #{user.id} Name: #{user.fname}"
    end
    @punch.ptype = user.clocked_in ? 'I' : 'O'
    @punch.ip = request.remote_ip
    if @punch.save
      flash[:notice]  = "#{user.fname} clocked #{user.clocked_in ? 'in' : 'out'}"
    else
      flash[:notice] = "ERROR, punch not saved."
    end
    redirect_to(:action => 'index')
   rescue ActiveRecord::RecordNotFound
    flash[:notice] = "User not found ID: #{@punch.user_id}"
    redirect_to(:action => 'index')
  end

  # PUT /punches/1
  # PUT /punches/1.xml
  def update
    @punch = Punch.find(params[:id])

    respond_to do |format|
      if @punch.update_attributes(params[:punch])
        flash[:notice] = 'Punch was successfully updated.'
        format.html { redirect_to(@punch) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @punch.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /punches/1
  # DELETE /punches/1.xml
  def destroy
    @punch = Punch.find(params[:id])
    @punch.destroy

    respond_to do |format|
      format.html { redirect_to(punches_url) }
      format.xml  { head :ok }
    end
  end
end
