# Using an array of fixed size 
# Pros: Simple implementation
# Cons: Inefficient lookup and deletion - O(n) where n is the size of the cache


class LRUCache
    def initialize(size)
         @size=size
         @cache_keys=[]
         @cache_values=[]
    end

    def count
        print @cache_keys
        p
      @cache_keys.count
    end

    def set(el)
        ind = @cache_keys.index(el.keys[0])
       if  ind
            print "Before slice: ", @cache_keys
            p
            @cache_keys = @cache_keys.slice(0...ind).concat( @cache_keys.slice(ind...-1))
            p
            print "After slice: ", @cache_keys
            p
            @cache_keys << el.keys[0]
           
            @cache_values = @cache_values.slice(0...ind).concat(@cache_values.slice(ind...-1))
            @cache_values << el.values[0]
        elsif count == @size
            @cache_keys.shift
            @cache_values.shift
            @cache_keys << el.keys[0]
            @cache_values << el.values[0]
        else
            @cache_keys<< el.keys[0]
            @cache_values << el.values[0]
        end
    end

    def show
      p @cache
      nil
    end

    def get(key)
        ind = @cache_keys.index(key)
        if ind
            @cache_values[ind]
        else
            nil
        end    
    end

   

  end


  lru_cache = LRUCache.new(4);
  lru_cache.set({"test01" => [1,2,3,4]})
  lru_cache.set({"test02" => { "1"=> [2]}  })
  lru_cache.set("test03" => 3)
  lru_cache.set("test04" => 4)
  lru_cache.set("test05" => 5)
  lru_cache.set("test03" => 3)
  
  p "Count: ", lru_cache.count
  p lru_cache.get("test01");
  p lru_cache.get("test02");
  p lru_cache.get("test03");
   p lru_cache.get("test04");
  p "Count: ", lru_cache.count

