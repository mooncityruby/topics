def list_widgets(options={})
  credentials = options.fetch(:credentials) { :credentials_not_set }
  page_size   = options.fetch(:page_size) { 20 }
  page        = options.fetch(:page) { 1 }

  if page_size > 20
    user     = credentials.fetch(:user)
    password = credentials.fetch(:password)
    url = "https://#{user}:#{password}" +
      "@www.example.com/widgets?page=#{page}&page_size=#{page_size}"
  else
    url = "http://www.example.com/widgets" +
      "?page=#{page}&page_size=#{page_size}"
  end

  puts "Contacting #{url}..."
end

list_widgets

#list_widgets(page_size: 50, credentials: {user: 'avdi', password: 'xyzzy'})

#list_widgets(page_size: 50)


### This will be the `puts' output
