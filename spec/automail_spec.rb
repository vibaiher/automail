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
end
