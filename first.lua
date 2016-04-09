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
        
        return isPrime 
    end
end

function format_is_prime(num)
    local isPrime = is_prime(num)

    local primeResult = ''
    if isPrime == false then 
        primeResult = primeResult .. " not"
    end
      
    return tostring(num) .. ' is' .. primeResult .. ' prime' 
end

function first_primes(n)
    
end

--print(ends_in_3(3))
--print(ends_in_3(4))
--print(ends_in_3(53))

print(format_is_prime(1))
print(format_is_prime(2))
print(format_is_prime(3))
print(format_is_prime(4))
print(format_is_prime(5))
print(format_is_prime(10))
print(format_is_prime(23))
print(format_is_prime(25))
