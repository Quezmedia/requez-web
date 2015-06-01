class MailService
  def initialize
    Mail.defaults do
      retriever_method :pop3, address:    'outlook.office365.com',
                              port:       995,
                              user_name:  ENV['EMAIL'],
                              password:   ENV['PASSWORD'],
                              enable_ssl: true
    end
  end

  def with_subject(subject)
    emails.select { |e| e.subject.match(subject) }
  end

  private

  def emails
    @emails ||= Mail.find(:what => :first, :count => 20, :order => :asc)
  end
end
