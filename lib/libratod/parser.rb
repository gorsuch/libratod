module Libratod
  class Parser
    def parse(h)
      name = h['name']
      {}.tap do |data|
        if x = h['namelookup_time']
          data["#{name}.namelookup_time"] = x
        end

        if x = h['connect_time']
          data["#{name}.connect_time"] = x
        end
        if x = h['starttransfer_time']
          data["#{name}.starttransfer_time"] = x
        end
        if x = h['total_time']
          data["#{name}.total_time"] = x
        end

        if h['http_status']
          data["#{name}.http_status.#{h['http_status']}"] = 1      
        end

        if h['curl_status']
          data["#{name}.curl_status.#{h['curl_status']}"] = 1      
        end
      end
    end
  end
end
