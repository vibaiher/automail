require 'automail/version'

module Automail
  class Error < StandardError; end

  def self.generate()
    <<~TXT
      Hola {name},

      Para saber más de Devscola lo mejor es que te pases a la siguiente asamblea que será el {date} a las {time}, así puedes conocernos a todos, ver como funcionamos y podremos entender mejor que es lo que necesitas.

      Estamos en:

      La Cueva de Benimaclet
      Carrer de Francesc Martínez 2, 46020 València
      https://goo.gl/maps/HAnZfTCTBo52

      ##### MENSAJE ORIGINAL #####

      {original_message}
    TXT
  end
end
