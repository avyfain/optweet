class TweetsController < ApplicationController
  def index
    username = 'opternative'
    options = {:count => 100, :include_rts => true, :exclude_replies => true}
    @tweets = $client.user_timeline(username, options)[0..25]
  end
end
