Reflector.controller do
  get "/:id" do
    id = CGI::unescape(params[:id])
    result = Redirect.first(:id => id)
    if result
      # Log the request to redis.
      today = Time.new
      hit_date = today.strftime("%Y-%m-%d")
      $redis.incr "reflect_hit_total:#{result.id}"
      $redis.zincrby "reflect_hit_daily_breakdown:#{result.id}", 1, hit_date
      # Then redirect.
      redirect to(result.url)
    else
      "Sorry - there's no url of that name."
    end
  end

  get "/" do
    "Nothing to see here"
  end
end