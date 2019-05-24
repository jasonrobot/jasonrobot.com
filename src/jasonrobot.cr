require "./jasonrobot/jasonrobot.cr"

def run_site
  Kemal.run
end

def add_pages(pages : Array(String))
end

def apply_edits
end

command = ARGV[0]

case command
when "run"
  puts "running kemal!"
  run_site
when "add"
  puts "adding file #{ARGV[1..].join(", ")}"
when "update"
  puts "updating posts!"
end
