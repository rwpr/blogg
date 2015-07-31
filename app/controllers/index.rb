#display homepage

get '/' do
  # Look in app/views/index.erb
  redirect to '/posts'
end

get '/posts' do
  @posts = Post.all
  erb :index
end

post '/posts' do
  @post = Post.create(post_name: params[:post_name], post_desc: params[:post_desc])
  @posts = Post.all
  erb :index
end

post '/tags/:id' do
  @new_tag = Tag.create(tag_desc: params[:tag_name])
  @tags = Tag.all
  erb :index
end

get '/tags/new' do
  erb :create_tag
end

get '/posts/new' do
  erb :create_post
end


get '/posts/:post_id' do
  @post = Post.find(params[:post_id])
  erb :show_post
end

get "/posts/:post_id/edit" do
  @post = Post.find(params[:post_id])
  erb :edit_post
end

delete "/posts/:post_id" do
  @post = Post.find(params[:post_id])
  @post.destroy
  redirect to "/posts"
end

put "/posts/:post_id" do
  @post = Post.find(params[:post_id])
  @post.update_attributes(params[:post])
  redirect to "/posts/#{@post.id}"
end

