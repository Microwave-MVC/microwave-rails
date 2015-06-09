Rails.application.config.middleware.use OmniAuth::Builder do
  provider :saml,
           :assertion_consumer_service_url     => ENV['URL-CALLBACK'],
           :issuer                             => "Microwave Rails App",
           :idp_sso_target_url                 => ENV['TARGET-URL'],
           :idp_cert_fingerprint               => ENV['FINGERPRINT'],
           :name_identifier_format             => "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"
end
