
# Using a hash map of fixed size and a linked list
# Pros: Constant time lookup, inertion and deletion on average - O(1)
# Cons: Implementation slightly complicated with a hash map pointing to a linked list
#        If the hashing function is inefficient, it will degrade the lookup to O(n)

class Node
    attr_accessor :val, :next, :prev
    def initialize(val)
        @val = val
        @next = nil
        @prev = nil
    end
end


class List
    attr_accessor :head , :tail
    def initialize
        @head = nil
        @tail = nil
    end

    def insert(el)
        n = Node.new(el)

        if(@head)
          @head.next = n
          n.prev = @head
        else
          @head = n  
        end

        if(@tail)
            @tail.next = n
            n.prev = @tail
            @tail = n
        else
            @tail = n    
        end  
        n  
    end

    def delete(ptr)
        if head == ptr && tail == ptr
            @head = nil
            @tail = nil
            
        else
           ptr.prev.next = ptr.next if ptr.prev
           ptr.next.prev = ptr.prev  if ptr.next
        end
        ptr.val
    end

    def show(ptr)
     print ptr.val
     return ptr.val
    end

end

class Lru_cache
    attr_accessor :count
    attr_reader :size
    def initialize(size)
        @lru_map = Hash.new()
        @lru_list = List.new()
        @size = size
        @count = 0
    end

    def insert(el)
        ptr = @lru_list.insert(el)
        @lru_map[el.keys[0]] = ptr
        @count+=1
        if(@count > size)
            self.delete()
        end    

    end

    def delete()
        
        el = @lru_list.delete(@lru_list.head)
        @lru_map.delete(el.keys[0])
        @count -=1
    end

    def get(key)
        ptr = @lru_map[key]
        if ptr
          @lru_list.show(ptr)[key]
        end  
    end
end

l = List.new()
n = l.insert({"1"=>3})
p n
l.delete(n)
#l.show(l.head)

c = Lru_cache.new(5)
c.insert({"test01"=> [1,2,3,4]})
#c.get("test01")
c.insert({ "test02"=>{"1"=> [2]} })
#c.get("test02")
c.insert({"test03"=> 3})
#c.get("test03")
c.insert({"test04"=>nil})
#c.get("test04")
c.insert({"test05"=>"a"})
print c.get("test05")
c.insert({"test06"=>{"a"=>[1,2,3,4]}})
c.get("test01")
