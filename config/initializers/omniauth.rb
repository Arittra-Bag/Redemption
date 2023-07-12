Rails.application.config.middleware.use OmniAuth::Builder do
    provider :spotify, '7ae68f0d89384801b54161ebf415013e', 'c8955c3dbc994e25bb7e6050900c72cb', scope: 'user-read-email'
end
