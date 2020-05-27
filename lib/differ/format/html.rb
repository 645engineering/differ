module Differ
  module Format
    module HTML
      class << self
        def format(change)
          (change.change? && as_change(change)) ||
          (change.delete? && as_delete(change)) ||
          (change.insert? && as_insert(change)) ||
          ''
        end

      private
        def as_insert(change)
          %Q{<ins style="background:#e6ffe6" class="differ">#{change.insert}</ins>}
        end

        def as_delete(change)
          %Q{<del style="background:#ffe6e6" class="differ">#{change.delete}</del>}
        end

        def as_change(change)
          as_delete(change) << as_insert(change)
        end
      end
    end
  end
end
