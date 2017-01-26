require 'committee'
require 'sinatra'
require 'stripe'
require 'test/unit'
require 'mocha/setup'
require 'stringio'
require 'shoulda/context'
require 'webmock/test_unit'

require File.expand_path('../api_stub_helpers', __FILE__)
require File.expand_path('../test_data', __FILE__)

class Test::Unit::TestCase
  include APIStubHelpers
  include Stripe::TestData
  include Mocha

  setup do
    Stripe.api_key = "foo"

    # Stub the Stripe API with a default stub. Note that this method can be
    # called again in test bodies in order to override responses on particular
    # endpoints.
    stub_api

    stub_connect
  end

  teardown do
    Stripe.api_key = nil
  end
end
