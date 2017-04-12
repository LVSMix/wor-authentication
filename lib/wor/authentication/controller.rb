module Wor
  module Authentication
    module Controller

      def authenticate_request
        entity = find_authenticable_entity(decoded_token)
        decoded_token.validate!(entity_custom_validation_value(entity))
      end

      def decoded_token
        @decoded_token ||= Wor::Authentication::TokenManager.new(token_key).decode(authentication_token)
      end

      ##
      # Helpers intended to override in applications ApplicationController class
      ##

      # Explain in README
      def token_renew_id
        ## someone reject this line pls: ::Devise
        ::Devise.friendly_token(32)
      end

      # Explain in README
      def new_token_expiration_date
        (Time.zone.now + 2.days).to_i
      end

      # Explain in README
      def token_maximum_useful_date
        (Time.zone.now + 30.days).to_i
      end

      # Explain in README
      def entity_payload(entity)
        # default instead of exception ?
        raise Wor::Authentication::Exceptions::SubclassMustImplementError
      end

      def authentication_token
        request.headers['Authorization'].split(' ').last
      end

      # Explain in README
      def entity_custom_validation_value(entity)
        nil
      end

      # Explain in README
      def entity_custom_validation_renew_value(entity)
        entity_custom_validation_value(entity)
      end

      # Explain in README
      def entity_custom_validation_invalidate_all_value(entity)
        nil
      end

      # Explain in README
      def token_key
        raise Wor::Authentication::Exceptions::SubclassMustImplementError unless defined?(Rails)
        raise Wor::Authentication::Exceptions::NoKeyProvidedError unless Rails.application.secrets.secret_key_base.present?
        Rails.application.secrets.secret_key_base
      end

      # Explain in README
      def authenticate_entity(authenticate_params)
        raise Wor::Authentication::Exceptions::SubclassMustImplementError
      end

      # Explain in README
      def find_authenticable_entity(decoded_token)
        raise Wor::Authentication::Exceptions::SubclassMustImplementError
      end

    end
  end
end
