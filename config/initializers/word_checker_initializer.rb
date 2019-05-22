Rails.application.config.after_initialize do
  WordChecker.new
end
