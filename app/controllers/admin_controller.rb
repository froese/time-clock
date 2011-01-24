class AdminController < ApplicationController
  # GET /users
  # GET /users.xml
  def index
    @users = User.all
    @periods = Period.find(:all, :limit => 5, :order => "ending DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
  def report
    @period = Period.find(params[:id])
    #@punches = @period.punches
    @punches = Punch.find(:all, :conditions => ["period_id = ?",@period.id], :order => "user_id,ptime")
    #, :group => "user_id")
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
end
