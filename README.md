Cache is implemented two ways:

1. lru_cache.rb

Using an array of fixed size 
Set the cache size during initialization using

>lru_cache = LRUCache.new(<size>)

Add to the cache
>lru_cache.set({"test01" => [1,2,3,4]})
Retrieve from cache
>lru_cache.get("test01");

Pros: Simple implementation
Cons: Inefficient lookup, insertion and deletion - O(n) where n is the size of the cache


2. Using a hash map of fixed size and a linked list

Set the cache size during initialization using

>c = Lru_cache.new(<size>)

Add to the cache
>c.insert({"test01"=> [1,2,3,4]})
Retrieve from cache
>c.get("test01");

Pros: Constant time lookup, insertion and deletion on average - O(1)
Cons: Implementation slightly complicated with a hash map pointing to a linked list
       If the hashing function is inefficient, it will degrade the lookup to O(n)

To Do:
*** Test accessing same element twice, thereby making it newer in the cache
*** Test corner cases - some are done but more needed
*** Write rspec tests for sanity checks
