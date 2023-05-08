require "openai"

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :chat ]

  def chat
    client = OpenAI::Client.new(api_key: "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")


    @response = client.completions(
      engine: "davinci", # or another model available to you
      prompt: "Hello, how are you?",
      temperature: 0.7,
      max_tokens: 50,
      top_p: 1,
      frequency_penalty: 0,
      presence_penalty: 0,
      stop: "\n"
    )
  end
end
