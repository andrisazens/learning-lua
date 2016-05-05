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

--print(tostring(p31(7)) .. " " tostring(p31(2)) .. " " .. tostring(p31(3)) .. " " .. tostring(p31(4)))
