require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::SipList::DomainList do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should read domains" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.domains.list() }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.accounts.get('ACllllllllllllllllllllllllllllllll').sip.domains.list() }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').sip.domains.list() }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').sip.domains.list() }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should create domains" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.domains.create(:'DomainName' => 'domain_name', :'FriendlyName' => 'friendly_name', :'VoiceFallbackMethod' => "GET", :'VoiceFallbackUrl' => "https://example.com", :'VoiceMethod' => "GET", :'VoiceStatusCallbackMethod' => "GET", :'VoiceStatusCallbackUrl' => "https://example.com", :'VoiceUrl' => "https://example.com") }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.accounts.get('ACllllllllllllllllllllllllllllllll').sip.domains.create(:'DomainName' => 'domain_name', :'FriendlyName' => 'friendly_name', :'VoiceFallbackMethod' => "GET", :'VoiceFallbackUrl' => "https://example.com", :'VoiceMethod' => "GET", :'VoiceStatusCallbackMethod' => "GET", :'VoiceStatusCallbackUrl' => "https://example.com", :'VoiceUrl' => "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').sip.domains.create(:'DomainName' => 'domain_name', :'FriendlyName' => 'friendly_name', :'VoiceFallbackMethod' => "GET", :'VoiceFallbackUrl' => "https://example.com", :'VoiceMethod' => "GET", :'VoiceStatusCallbackMethod' => "GET", :'VoiceStatusCallbackUrl' => "https://example.com", :'VoiceUrl' => "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').sip.domains.create(:'DomainName' => 'domain_name', :'FriendlyName' => 'friendly_name', :'VoiceFallbackMethod' => "GET", :'VoiceFallbackUrl' => "https://example.com", :'VoiceMethod' => "GET", :'VoiceStatusCallbackMethod' => "GET", :'VoiceStatusCallbackUrl' => "https://example.com", :'VoiceUrl' => "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should fetch domains" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.domains.get('SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.accounts.get('ACllllllllllllllllllllllllllllllll').sip.domains.get('SDllllllllllllllllllllllllllllllll')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').sip.domains.get('SDkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').sip.domains.get('SDmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::SipList::DomainInstance do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should update domains" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.domains.get('SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.update(:'ApiVersion' => 'api_version', :'FriendlyName' => 'friendly_name', :'VoiceFallbackMethod' => "GET", :'VoiceFallbackUrl' => "https://example.com", :'VoiceMethod' => "GET", :'VoiceStatusCallbackMethod' => "GET", :'VoiceStatusCallbackUrl' => "https://example.com", :'VoiceUrl' => "https://example.com") }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.accounts.get('ACllllllllllllllllllllllllllllllll').sip.domains.get('SDllllllllllllllllllllllllllllllll')
      expect { resource.update(:'ApiVersion' => 'api_version', :'FriendlyName' => 'friendly_name', :'VoiceFallbackMethod' => "GET", :'VoiceFallbackUrl' => "https://example.com", :'VoiceMethod' => "GET", :'VoiceStatusCallbackMethod' => "GET", :'VoiceStatusCallbackUrl' => "https://example.com", :'VoiceUrl' => "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').sip.domains.get('SDkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.update(:'ApiVersion' => 'api_version', :'FriendlyName' => 'friendly_name', :'VoiceFallbackMethod' => "GET", :'VoiceFallbackUrl' => "https://example.com", :'VoiceMethod' => "GET", :'VoiceStatusCallbackMethod' => "GET", :'VoiceStatusCallbackUrl' => "https://example.com", :'VoiceUrl' => "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').sip.domains.get('SDmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.update(:'ApiVersion' => 'api_version', :'FriendlyName' => 'friendly_name', :'VoiceFallbackMethod' => "GET", :'VoiceFallbackUrl' => "https://example.com", :'VoiceMethod' => "GET", :'VoiceStatusCallbackMethod' => "GET", :'VoiceStatusCallbackUrl' => "https://example.com", :'VoiceUrl' => "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should delete domains" do
    it "and return 204" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.domains.get('SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.accounts.get('ACllllllllllllllllllllllllllllllll').sip.domains.get('SDllllllllllllllllllllllllllllllll')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').sip.domains.get('SDkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').sip.domains.get('SDmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  end
end