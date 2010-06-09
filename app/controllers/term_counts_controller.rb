class TermCountsController < ApplicationController
  # GET /term_counts
  # GET /term_counts.xml
  def index
    @term_counts = TermCount.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @term_counts }
    end
  end

  # GET /term_counts/1
  # GET /term_counts/1.xml
  def show
    @term_count = TermCount.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @term_count }
    end
  end

  # GET /term_counts/new
  # GET /term_counts/new.xml
  def new
    @term_count = TermCount.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @term_count }
    end
  end

  # GET /term_counts/1/edit
  def edit
    @term_count = TermCount.find(params[:id])
  end

  # POST /term_counts
  # POST /term_counts.xml
  def create
    @term_count = TermCount.new(params[:term_count])

    respond_to do |format|
      if @term_count.save
        flash[:notice] = 'TermCount was successfully created.'
        format.html { redirect_to(@term_count) }
        format.xml  { render :xml => @term_count, :status => :created, :location => @term_count }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @term_count.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /term_counts/1
  # PUT /term_counts/1.xml
  def update
    @term_count = TermCount.find(params[:id])

    respond_to do |format|
      if @term_count.update_attributes(params[:term_count])
        flash[:notice] = 'TermCount was successfully updated.'
        format.html { redirect_to(@term_count) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @term_count.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /term_counts/1
  # DELETE /term_counts/1.xml
  def destroy
    @term_count = TermCount.find(params[:id])
    @term_count.destroy

    respond_to do |format|
      format.html { redirect_to(term_counts_url) }
      format.xml  { head :ok }
    end
  end
end
