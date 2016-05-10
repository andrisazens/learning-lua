-- P13 Weighted sum of digits
-- This program resembles more complex algorithms for calculation CRC and other checksums and also hash-functions on character strings. Besides it will provide you with one more exercise on splitting values to decimal digits. You may want to try Sum of Digits before this one.
-- Let us calculate sum of digits, as earlier, but multiplying each digit by its position (counting from the left, starting from 1). For example, given the value 1776 we calculate such weighted sum of digits (let us call it "wsd") as:
-- wsd(1776) = 1 * 1 + 7 * 2 + 7 * 3 + 6 * 4 = 60

function wsd(digit)
    local result, digit_as_list = 0, tostring(digit)
    
    for i = 1, string.len(digit_as_list) do
        local num = tonumber(string.sub(digit_as_list, i, i), 10)        
        result = result + (num * i)
    end
    
    return result
end

print(wsd(1776))