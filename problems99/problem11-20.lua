-- P14 (*) Duplicate the elements of a list. Example: * (dupli '(a b c c d)) => (A A B B C C C C D D)

function p14(list)
    local result = {}
    for i = 1, #list do
        result[#result + 1] = list[i]
        result[#result + 1] = list[i]
    end
    
    return result
end

-- P12 (**) Decode a run-length encoded list. Given a run-length code list generated as specified in problem P11. Construct its uncompressed version.
function p12(list)
    local result = {}
    
    for i = 1, #list do
        local subListLen = #list[i]
        if subListLen == 1 then
            result[#result + 1] = list[i][1]
        else
            local charCount = list[i][1]
            local char = list[i][2]
            
            for j = 1, charCount do
                result[#result + 1] = char
            end
        end
    end
        
    return result
end

-- P11 (*) Modified run-length encoding. Modify the result of problem P10 in such a way that if an element has no duplicates 
--   it is simply copied into the result list. Only elements with duplicates are transferred as (N E) lists.
-- Example: * (encode-modified '(a a a a b c c a a d e e e e)) => ((4 A) B (2 C) (2 A) D (4 E))

-- TODO: copy from problem1.lua
function p09(list)
    local result, prev, subCount = {}, nil, 1
    
    for i = 1, #list do
        local current = list[i]
        
        if current ~= prev then            
            result[#result + 1] = { }
            subCount = 1
        end
        
        result[#result][subCount] = current
        subCount = subCount + 1   
        prev = current            
    end
        
    return result
end

function p11(list)
    local dups, result = p09(list), {}
    for i = 1, #dups do
        local duplicatesLen, firstElem = #dups[i], dups[i][1]         
    
        if (duplicatesLen == 1) then
            result[#result + 1] = firstElem 
        else
            local subList = {}
            subList[1] = duplicatesLen
            subList[2] = firstElem
            result[#result + 1] = subList
        end           
    end
    
    return result
end

-- TODO: remove trailing comma
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

local p11result = p11({'a', 'a', 'a', 'b', 'c', 'c' })
setmetatable(p11result, mt)

local p12result = p12({{3, 'a'}, {'b'}, {2,'c'}})
setmetatable(p12result, mt)

local p14result = p14({'a', 'b', 'c', 'c'})
setmetatable(p14result, mt)

--print(p11result)
--print(p12result)
print(p14result)
