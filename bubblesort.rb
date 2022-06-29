#bubblesort algorithm implemented in ruby

def bubblesort(arr) 
    sorted = true
    for i in 0..arr.length - 2 do
        if arr[i] > arr[i + 1] 
            temp = arr[i + 1]
            arr[i + 1] = arr[i]
            arr[i] = temp
            sorted = false
        end
        
    end
    if !sorted then return bubblesort(arr) end
end


arr = [5,2,8,6,4,2,3,54,6,43,234,54,86,23,421,45,345,687,0]
bubblesort(arr)
puts arr