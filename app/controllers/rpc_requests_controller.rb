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
    @rpc_request = RpcRequest.find(params[:id])
  end

  # POST /rpc_requests
  # POST /rpc_requests.json
  def create
    @rpc_request = RpcRequest.new(params[:rpc_request])
    require "xmlrpc/client"

    # Make an object to represent the XML-RPC server.
    server = XMLRPC::Client.new( "rpcserver.dev", "/", 80)

    # Call the remote server and get our result
    @result = server.call("sample.sumAndDifference", params[:rpc_request][:params], params[:rpc_request][:params])

    sum = result["sum"]
    difference = result["difference"]

    logger.debug "Sum: #{sum}, Difference: #{difference}"
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
