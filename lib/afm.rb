
module AFM
  class Font
    attr_reader :metadata, :char_metrics, :kern_pairs
    def initialize(filename)
      @metadata = {}
      @char_metrics = {}
      @kern_pairs = []
      File.open(filename) do |file|
        mode = :meta
        file.each_line do |line|
          case(line)
          when /^StartFontMetrics/ ; mode = :meta
          when /^StartCharMetrics/ ; mode = :char_metrics
          when /^EndCharMetrics/ ; mode = :meta
          when /^StartKernData/ ; mode = :kern_data
          when /^StartKernPairs/ ; mode = :kern_pairs
          when /^EndKernPairs/ ; mode = :kern_data
          when /^EndKernData/ ; mode = :meta
          else
            case(mode)
            when :meta
              if match = line.match(/^([\w]+) (.*)$/)
                @metadata[match[1]] = match[2]
              end
            when :char_metrics
              metrics = {}
              metrics[:charcode] = match[1].to_i if match = line.match(/C (-?\d+) *?;/)
              metrics[:wx] = match[1].to_i if match = line.match(/WX (-?\d+) *?;/)
              metrics[:name] = match[1] if match = line.match(/N ([.\w]+) *?;/)
              if match = line.match(/B (-?\d+) (-?\d+) (-?\d+) (-?\d+) *?;/)
                metrics[:boundingbox] = [match[1].to_i, match[2].to_i, match[3].to_i, match[4].to_i] 
              end
              @char_metrics[metrics.delete(:name)] = metrics if metrics[:name]
            when :kern_pairs
              if match = line.match(/^KPX ([.\w]+) ([.\w]+) (-?\d+)$/)
                @kern_pairs << [match[1], match[2], match[3].to_i]
              end
            end
          end
        end
      end
    end
  end
end