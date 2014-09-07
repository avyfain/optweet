class TweetsController < ApplicationController
  def index
    username = 'opternative'
    options = {:count => 25, :include_rts => true}
    @tweets = $client.user_timeline(username, options)
  end
end
