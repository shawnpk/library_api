class Rack::Attack
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  Rack::Attack.throttle('req/ip', limit: 5, period: 1.second) do |req|
    req.ip
  end

  Rack::Attack.throttled_response = lambda do |env|
    [ 503, {}, ['Server Errorn']]
  end
end
