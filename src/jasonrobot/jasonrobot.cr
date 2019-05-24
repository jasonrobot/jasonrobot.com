# jasonrobot.cr
#
# This is the main file of the jasonrobot blogware site!

require "kemal"
require "markdown"

def define_route(post_file)
  name = File.basename(post_file, ".md")
  contents = File.new(post_file).gets_to_end

  get "/#{name}" do |env|
    post_contents = Markdown.to_html contents
    ECR.render("src/jasonrobot/page.ecr")
  end

  #TODO add to menu
end

def define_routes(posts_directory : String)
  Dir
    .new(posts_directory)
    .children
    .select { |file_name| file_name.ends_with?(".md") }
    .map { |file_name| posts_directory + File::SEPARATOR + file_name }
    .each { |file_path| define_route(file_path) }
end

define_routes("posts")
