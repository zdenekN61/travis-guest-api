require 'spec_helper'
require 'rack/test'
require 'travis/guest-api/app/middleware/rewrite'

describe Travis::GuestApi::App::Middleware::Rewrite do

  include Rack::Test::Methods

  def app
    Travis::GuestApi::App.new(job_id, reporter, &callback)
  end

  let(:reporter) { double(:reporter) }
  let(:callback) { ->(x) { } }

  context "server is run without job_id" do
    let(:job_id) { nil }
    it 'rewrites job_id to environment' do
      job_id = 42
      get("/jobs/#{job_id}/uptime")
      expect(last_request.env['job_id']).to eq(job_id)
      expect(last_response.status).to eq 204
    end
  end

  context "server is run with job_id 42" do
    let(:job_id) { 42 }
    it 'responds with 422 on job_id mismatch' do
      response = get("/jobs/666/uptime")
      expect(response.status).to eq(422)
    end
  end
end