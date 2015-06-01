require 'spec_helper'

RSpec.describe MailService do

  before do
    email_1 = double('email', subject: 'Dev Ruby Mid 2015 - Bruce Wayne')
    email_2 = double('email', subject: 'Dev Ruby Mid 2015 - Clark Kent')
    email_3 = double('email', subject: 'Frontend Mid 2015 - Barry Allen')
    allow(Mail).to receive(:find).and_return([email_1, email_2, email_3])
  end

  describe '#with_subject' do
    subject { MailService.new.with_subject('Frontend') }
    it { expect(subject).to be_a(Array) }
    it { expect(subject.count).to eq(1) }
    it { expect(subject.first.subject).to eq('Frontend Mid 2015 - Barry Allen') }
  end
end
