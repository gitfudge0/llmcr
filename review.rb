require 'open3'
require 'json'

FIXED_PROMPT =
  "You're an expert in interpreting code, especially code changes made between two commits. You will be given the raw git diff to work with. Your purpose is to review the code changes and suggest improvements only if there is scope. Always begin your answer with a code quality rating and a status denoting if improvements are required. Then follow with a very short brief of the changes. Talk about what's good in the code. And end with suggested improvements. Here is the diff:\n ```"

def execute_git_diff_command
  stdout, stderr, _status = Open3.capture3("git diff HEAD")
  return stdout unless stderr.any?
  
  raise stderr
end

def main
  begin
    git_diff_output = execute_git_diff_command
    body = {
      model: "qwen2.5-coder:latest",
      prompt: "#{FIXED_PROMPT} #{git_diff_output}\n```",
      stream: false,
    }
    
    response = RestClient.post("http://localhost:11434/api/generate?", body.to_json, content_type: :json)
    data = JSON.parse(response.body)

    timestamp = Time.now.to_s.gsub(/[:.]/, "-")
    filename = File.join("code_review", "response-#{timestamp}.md")

    FileUtils.mkdir_p(File.dirname(filename))

    File.write(filename, data["response"])

    puts "Response written to #{filename}"
  rescue StandardError => e
    puts "Error: #{e.message}"
    puts e.backtrace.join("\n")
  end
end

main
