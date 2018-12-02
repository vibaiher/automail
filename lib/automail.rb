require 'automail/version'

module Automail
  class Error < StandardError; end

  class << self
    def generate(custom_fields = {})
      template = get_template()
      message = inject(template, custom_fields)

      message
    end

    private

    def get_template()
      <<~TXT
        Hola {name},

        Para saber más de Devscola lo mejor es que te pases a la siguiente asamblea que será el {date} a las {time}, así puedes conocernos a todos, ver como funcionamos y podremos entender mejor que es lo que necesitas.

        Estamos en:

        La Cueva de Benimaclet
        Carrer de Francesc Martínez 2, 46020 València
        https://goo.gl/maps/HAnZfTCTBo52

        {signature}

        ##### MENSAJE ORIGINAL #####

        {original_message}
      TXT
    end

    def inject(template, custom_fields)
      fields = {
        '{name}' => custom_fields[:name],
        '{date}' => custom_fields[:date],
        '{time}' => custom_fields[:time],
        '{original_message}' => custom_fields[:original_message]
      }.compact

      template.gsub(/#{fields.keys.join('|')}/, fields)
    end
  end
end
