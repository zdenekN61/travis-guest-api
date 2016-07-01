require 'travis/guest-api/reporter'

module Travis
  module GuestApi
    describe Reporter do
      describe '#send_log' do
        before do
          allow(Travis.config).to receive(:max_log_size) { 1 }
        end

        let(:subject) do
          Reporter.new(
            'test_name', state_publisher, log_publisher, test_result_publisher)
        end

        let(:state_publisher) { double('state_publisher') }
        let(:log_publisher) { double('log_publisher') }
        let(:test_result_publisher) { double('test_result_publisher') }

        it 'does not shrink message if limit is not reached' do
          allow(Travis.config).to receive(:max_log_size) { 4096 }
          expect(subject).to receive(:notify).with(
            'job:test:log', id: 1, log: 'test_message', number: 1)

          subject.send_log(1, 'test_message')
        end

        it 'shrinks message if limit is reached' do
          expected_message = {
            id: 1,
            log: 'Messages exceeded limit size: 1',
            number: 1
          }

          expect(subject).to receive(:notify)
            .with('job:test:log', expected_message)

          subject.send_log(1, 'test_message')
        end

        context 'message limit reached' do
          before :each do
            allow(subject).to receive(:notify)
            subject.send_log(1, 'test_message')
          end

          it 'does not send message if limit is reached' do
            expect(subject).not_to receive(:notify)
            subject.send_log(1, 'test_message')
          end

          it 'sends message if limit is reached but it is last message' do
            expect(subject).to receive(:notify)
              .with('job:test:log', id: 1, log: '', number: 2, final: true)

            subject.send_log(1, 'test_message', true)
          end
        end
      end
    end
  end
end
