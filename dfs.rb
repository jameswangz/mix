class Node
  
    attr_accessor :name, :children, :depth

    def initialize(name)
      @name = name
      @children = []
      @depth = 0
    end

    def append(child)
      child.depth = depth + 1 
      @children << child
    end 

    def dfs_recursively
      print 'dfs recursively: '
      visit self
      puts
    end

    def visit(node)
      print node.name
      print " "
      node.children.each do |c| 
        visit c 
      end
    end

    def dfs_stack
      dest = []
      stack = []
      stack.push self
      while !stack.empty?
        current = stack.pop
        puts "pop #{current.name}"
        dest << current
        current.children.reverse.each do |c| 
          puts "push #{c.name}"
          stack.push c 
        end
      end

      print "dfs stack: "
      dest.each do |c|
        print c.name
        print " "
      end
      puts
    end

    def bfs 
      dest = []
      queue = []
      queue.push self
      while !queue.empty?
        current = queue.shift
        puts "shift #{current.name}"
        dest << current
        current.children.each do |c| 
          puts "push #{c.name}"
          queue.push c 
        end
      end

      print "bfs: "
      previous_depth = -1 
      dest.each do |c|
        if previous_depth != c.depth
          puts
          previous_depth = c.depth
        end
        print c.name
        print " "
      end
      puts
    end
end

root = Node.new(1)
n2 = Node.new(2)
n3 = Node.new(3)
n4 = Node.new(4)
n5 = Node.new(5)
n6 = Node.new(6)
n7 = Node.new(7)
n8 = Node.new(8)
n9 = Node.new(9)
n10 = Node.new(10)
n11 = Node.new(11)
n12 = Node.new(12)

root.append n2
root.append n7
root.append n8
n2.append n3
n2.append n6
n3.append n4
n3.append n5
n8.append n9
n8.append n12
n9.append n10
n9.append n11

root.dfs_recursively
root.dfs_stack
root.bfs

