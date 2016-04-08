function square(x)
 return x * x
end

function ends_in_3(num)
    local lastDigit = tonumber(string.sub(tostring(num), -1), 10)
    return lastDigit == 3
end

function is_prime(num)
    if num < 1 then
        return false
    else
        local i, isPrime = 2, true
        while i < num - 1 and isPrime == true do            
            if (num % i == 0) then            
                isPrime = false
                break
            end
            i = i + 1            
        end
        
        local primeResult = ''
        if isPrime == false then 
            primeResult = primeResult .. " not"
        end
        
        return tostring(num) .. ' is' .. primeResult .. ' prime' 
    end
end

--print(ends_in_3(3))
--print(ends_in_3(4))
--print(ends_in_3(53))

print(is_prime(1))
print(is_prime(2))
print(is_prime(3))
print(is_prime(4))
print(is_prime(5))
print(is_prime(10))
print(is_prime(23))
print(is_prime(25))
