class EmailsController < ApplicationController
  before_action :authenticate_user!
  def view
    @emails = Array.new
  	$client.authorization.access_token = current_user.token
  	$client.authorization.refresh_token = current_user.refresh_token
  	$client.authorization.client_id = ENV['google_client_id']
  	$client.authorization.client_secret = ENV['google_client_secret']
  	$client.authorization.refresh!
  	@service = $client.discovered_api('gmail')
  	#result = $client.execute(
    #:api_method => @service.users.threads.list,
    #:parameters => {'userId' => 'me'},
    #:headers => {'Content-Type' => 'application/json'})
    #puts
    #@output = JSON.parse(result.body)
    
  end
end
