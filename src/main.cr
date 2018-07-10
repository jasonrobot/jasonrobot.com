require "kemal"

get "/" do
  render "src/views/hello.ecr", "src/views/layout.ecr"
end

Kemal.run
