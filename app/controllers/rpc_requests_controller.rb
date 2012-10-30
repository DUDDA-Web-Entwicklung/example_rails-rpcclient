class RpcRequestsController < ApplicationController
  # GET /rpc_requests
  # GET /rpc_requests.json
  def index
    @rpc_requests = RpcRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @rpc_requests }
    end
  end

  # GET /rpc_requests/1
  # GET /rpc_requests/1.json
  def show
    @rpc_request = RpcRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @rpc_request }
    end
  end

  # GET /rpc_requests/new
  # GET /rpc_requests/new.json
  def new
    @rpc_request = RpcRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @rpc_request }
    end
  end

  # GET /rpc_requests/1/edit
  def edit
    option = Option.new(:name => "host", :value => "rpcserver.dev"})
    option.save!
    option2 = Option.new(:name => "host", :value => "rpcserver.herokuapp.com"})
    option2.save!
    option3 = Option.new(:name => "host", :value => "localhost:8080"})
    option3.save!
    option3 = Option.new(:name => "default-host", :value => "rpcserver.dev"})
    option3.save!
    @rpc_request = RpcRequest.find(params[:id])
  end

  # POST /rpc_requests
  # POST /rpc_requests.json
  def create
    @rpc_request = RpcRequest.new(params[:rpc_request])
    @option = Option.find(params[:rpc_request][:option_id]) if params[:rpc_request][:option_id]
    @option = Option.where(:name => "default-host").first
    require "xmlrpc/client"

    # Make an object to represent the XML-RPC server.
    #server = XMLRPC::Client.new( "rpcserver.dev", "/", 80)
    server = XMLRPC::Client.new( @option.value, "/", 80)

    p = params[:rpc_request][:params].split "\n"
    # Call the remote server and get our result
    @result = server.call(params[:rpc_request][:methodName], p[0].trim, p[1].trim)
    respond_to do |format|
      if @rpc_request.save
        format.html { redirect_to @rpc_request, :notice => 'Rpc request was successfully created.' }
        format.json { render :json => @rpc_request, :status => :created, :location => @rpc_request }
      else
        format.html { render :action => "new" }
        format.json { render :json => @rpc_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rpc_requests/1
  # PUT /rpc_requests/1.json
  def update
    @rpc_request = RpcRequest.find(params[:id])

    respond_to do |format|
      if @rpc_request.update_attributes(params[:rpc_request])
        format.html { redirect_to @rpc_request, :notice => 'Rpc request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @rpc_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rpc_requests/1
  # DELETE /rpc_requests/1.json
  def destroy
    @rpc_request = RpcRequest.find(params[:id])
    @rpc_request.destroy

    respond_to do |format|
      format.html { redirect_to rpc_requests_url }
      format.json { head :no_content }
    end
  end
end
