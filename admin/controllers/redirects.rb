Admin.controllers :redirects do

  get :index do
    @redirects = Redirect.all
    render 'redirects/index'
  end

  get :new do
    @redirect = Redirect.new
    render 'redirects/new'
  end
  
  get :show, :with => :id do
    @redirect = Redirect.get(params[:id])
    req = Rack::Request.new(env)
    host = req.host
    @logged_url = 'http://' + host + '/' + @redirect.id.to_s
    @google_url = 'https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl=' + CGI::escape(@logged_url) + '&choe=UTF-8'
    render 'redirects/show'
  end

  post :create do
    @redirect = Redirect.new(params[:redirect])
    if @redirect.save
      flash[:notice] = 'Redirect was successfully created.'
      redirect url(:redirects, :edit, :id => @redirect.id)
    else
      render 'redirects/new'
    end
  end

  get :edit, :with => :id do
    @redirect = Redirect.get(params[:id])
    render 'redirects/edit'
  end

  put :update, :with => :id do
    @redirect = Redirect.get(params[:id])
    if @redirect.update(params[:redirect])
      flash[:notice] = 'Redirect was successfully updated.'
      redirect url(:redirects, :edit, :id => @redirect.id)
    else
      render 'redirects/edit'
    end
  end

  delete :destroy, :with => :id do
    redirect = Redirect.get(params[:id])
    if redirect.destroy
      flash[:notice] = 'Redirect was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Redirect!'
    end
    redirect url(:redirects, :index)
  end
end
