-- P21 (*) Insert an element at a given position into a list. Example: * (insert-at 'alfa '(a b c d) 2) => (A ALFA B C D)

function p21(elem, list, index)
    local result = {}
    
    for i = 1, #list do
        if index == i then
            result[#result + 1] = elem 
        end
        
        result[#result + 1] = list[i]
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

local p21result = p21('test', {'a', 'b', 'c', 'd'}, 2)
setmetatable(p21result, mt)

print(p21result)