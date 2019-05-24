# jasonrobot.cr
#
# This is the main file of the jasonrobot blogware site!

require "kemal"
require "markdown"

class Menu
  # property posts : Array(String)

  def initialize
    @posts = [] of String
  end

  def add_post(route)
    @posts << route
  end

  def render
    ECR.render("src/jasonrobot/main_menu.ecr")
  end
end

class PostCreator
  @markdown_file_paths : Array(String)

  def initialize(@posts_directory : String)
    @menu = Menu.new

    @markdown_file_paths =
      Dir
      .new(posts_directory)
      .children
      .select { |file_name| file_name.ends_with?(".md") }
      .map { |file_name| posts_directory + File::SEPARATOR + file_name }

    @markdown_file_paths.each { |mfp| @menu.add_post(mfp) }

    @markdown_file_paths.each { |file_path| define_route(file_path) }
  end

  # private def route_names


  # Given a path from the program's root, set up a route to that post.
  # The path can include slashes, but should start just with the filename, not a
  # dot or a slash or anything.
  private def define_route(post_file)
    name = File.basename(post_file, ".md")
    contents = File.new(post_file).gets_to_end
    menu_contents = @menu.render

    # I could use kemal's support for layouts here, except since the contents are
    # in markdown files and not ECR, it won't be as easy.
    get "/#{name}" do |env|
      post_contents = Markdown.to_html contents
      ECR.render("src/jasonrobot/page.ecr")
    end

    #TODO add to menu
  end

end

PostCreator.new("posts")
