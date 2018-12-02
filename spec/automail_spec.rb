RSpec.describe Automail do
  describe 'as a gem' do
    it 'has a version number' do
      expect(Automail::VERSION).not_to be nil
    end
  end

  describe 'as a command line tool' do
    it 'is executable' do
      expected_output = Automail::VERSION

      output = `ruby ./exe/automail`

      expect(output).to include(expected_output)
    end
  end

  describe 'as an automatic mailer tool' do
    it 'has a base template mail' do
      email = Automail.generate()

      expect(email).to eq(
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
      )
    end
  end
end
