require "kemal"

get "/" do
  render "src/views/hello.ecr"
end

Kemal.run
