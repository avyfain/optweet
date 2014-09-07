class TweetsController < ApplicationController
  def index
    username = 'opternative'
    options = {:count => 100, :include_rts => true, :exclude_replies => true}

    if params[:kind] == 'links'
        @tweets = $client.user_timeline(username, options)
        @tweets = @tweets.select {|t| t.urls?}[(0..25)]
        
    elsif params[:kind] == 'others'
        @tweets = $client.search("to:" + username, options).take(25)

    elsif params[:kind] == 'recent'
        @tweets = $client.user_timeline(username, options)
        @tweets = @tweets.select { |t| (t.created_at >= (Date.today - 7.days))}
    else
        @tweets = $client.user_timeline(username, options)[(0..25)]
    end
  end
end
