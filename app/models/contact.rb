class Contact < MailForm::Base
    attribute :name, :validate => true
    attribute :email
    attribute :message, :validate => true
    attribute :filter, :captcha => true

    def headers 
        {
            :subjects => "Contact Form",
            :to => "careers@devbbq.com",
            :from => %("#{name}" <#{email}>)
        }
    end
end