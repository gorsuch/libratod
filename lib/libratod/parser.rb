module Libratod
  class Parser
    def parse(h)
      name = h['name']
      {}.tap do |data|
        if v = h['namelookup_time']
          data["#{name}.namelookup_time"] = v
        end

        if v = h['connect_time']
          data["#{name}.connect_time"] = v
        end

        if v = h['starttransfer_time']
          data["#{name}.starttransfer_time"] = v
        end

        if v = h['total_time']
          data["#{name}.total_time"] = v
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
