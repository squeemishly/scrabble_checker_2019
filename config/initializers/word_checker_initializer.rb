Rails.application.config.after_initialize do
  WordChecker.instance
end
