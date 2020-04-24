class ComplexNumber
    attr_accessor :real,:img
    @@countAdd = @@countMul =@@countBulkAdd=@@countBulkMul= 0
    
    
    def initialize(real,img)
        @real = real
        @img = img
    end
    
    def +(complexOne)
        r = complexOne.real+@real
        i = complexOne.img+@img
        @@countAdd+=1
        "#{r}+#{i}i" 
        
    end

    def *(complexOne)
        r =(complexOne.real*@real - complexOne.img*@img)
        i =(complexOne.real*@img + @real*complexOne.img)
        @@countMul+=1
        "#{r}+#{i}i"
       
    end

    def self.get_stats
        "adds = #{@@countAdd},mul= #{@@countMul}, bulk_add = #{@@countBulkAdd}, bulk_mul = #{@@countBulkMul}"
    end

    def self.bulk_add(arrcoms)
        com = ComplexNumber.new(0,0)
        arrcoms.each do |i|
            com.real+=i.real 
            com.img+=i.img
        end
        @@countBulkAdd+=1
        "#{com.real}+#{com.img}i"
    end

    def self.bulk_multiply(arrcoms)
        com=self.new(1,1)
        arrcoms.each do |i|
            com.real=(i.real*com.real - i.img*com.img)
            com.img=(i.img*com.real + i.real*com.img)
            
        end
        @@countBulkMul+=1
        "#{com.real}+#{com.img}i"
        
    end
    
end

c1=ComplexNumber.new(3,2)
c2=ComplexNumber.new(1,7)
c3=ComplexNumber.new(1,1)
puts c1+c2
puts c1*c2

puts ComplexNumber::bulk_add([c1,c2])
puts ComplexNumber::bulk_multiply([c1,c2])
puts ComplexNumber::get_stats