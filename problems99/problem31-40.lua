-- P31 (**) Determine whether a given integer number is prime. Example: * (is-prime 7)
function p31(given)
    if (given == 1) then
        return true
    end

    local i, result = 2, true       

    while i < given - 1 do
        if (given % i == 0) then
            result = false
            break
        end
        i = i + 1
    end 
    
    return result
end

-- P32 (**) Determine the greatest common divisor of two positive integer numbers.
-- Use Euclid's algorithm. Example: * (gcd 36 63) 9
function p32(first, second)
    if (first == 0) then 
        return second
    end
    
    if (second == 0) then 
        return first
    end
    
    if (first < second) then
        first, second = second, first
    end
        
    local remainder = first % second    
    if (remainder == 0) then
        return second
    else
        return p32(second, remainder)
    end
end

-- P33 (*) Determine whether two positive integer numbers are coprime. Two numbers are coprime if their greatest common divisor equals 1. 
-- Example: * (coprime 35 64) -> true
function p33(first, second)
    return p32(first, second) == 1
end

-- P34 (**) Calculate Euler's totient function phi(m).
--Euler's so-called totient function phi(m) is defined as the number of positive integers r (1 <= r < m) that are coprime to m.
--Example: m = 10: r = 1,3,7,9; thus phi(m) = 4. Note the special case: phi(1) = 1. * (totient-phi 10) => 4
function p34(input)
    local result = 1
    
    for i = 2, input do
        if p33(i, input) then
            result = result + 1
        end
    end
    
    return result
end

--print(tostring(p31(7)) .. " " tostring(p31(2)) .. " " .. tostring(p31(3)) .. " " .. tostring(p31(4)))
print("p32 = " .. tostring(p32(36, 63)))
print("p33 = " .. tostring(p33(35, 64)))
print("p34 = " .. tostring(p34(10)))

