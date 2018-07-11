require "kemal"

get "/" do
  head = String.build do |head|
    head << render "src/views/stylesheet.ecr"
  end
  
  body = String.build do |body|
     body << render "src/views/hello.ecr"
     body << render "src/views/foo.ecr"
  end
  
  render "src/views/layout.ecr"
end

Kemal.run
