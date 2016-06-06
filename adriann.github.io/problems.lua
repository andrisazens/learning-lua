-- Write a function that returns the elements on odd positions in a list.

function odd(list)
    local result = {}
    
    for i = 1, #list do
        if (i % 2 == 1) then
            result[#result + 1] = list[i]
        end
    end
    
    return result
end

function dump(o)
   if type(o) == 'table' then
      local s = '{'
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end         
         s = s .. '['..k..']=' .. dump(v) .. ','
      end
      return s .. '}'
   else
      return tostring(o)
   end
end

mt = {
    __tostring = dump
}

local oddResult = odd({'a', 'b', 'c', 'd', 'e', 'f' })
setmetatable(oddResult, mt)

print(oddResult)