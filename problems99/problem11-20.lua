-- P19 (**) Rotate a list N places to the left. Examples: * (rotate '(a b c d e f g h) 3) => (D E F G H A B C), * (rotate '(a b c d e f g h) -2) => (G H A B C D E F)
function p19(list, index)
    local result = {}
    
    if (index > 0) then   
        for i = index + 1, #list do
            result[#result + 1] = list[i]
        end
        for i = 1, index do
            result[#result + 1] = list[i]
        end
    else
        for i = #list + index, #list do
            result[#result + 1] = list[i]
        end
        for i = 1, -index do
            result[#result + 1] = list[i]
        end
    end
    
    return result
end

-- P18 (**) Extract a slice from a list. Given two indices, I and K, the slice is the list containing the elements between
-- the I'th and K'th element of the original list (both limits included). Start counting the elements with 1.
-- Example: * (slice '(a b c d e f g h i k) 3 7) => (C D E F G)

function p18(list, startIndex, endIndex)
    local result = {}
    
    for i = 1, #list do
        if i >= startIndex and i <= endIndex then
            result[#result + 1] = list[i]
        end
    end
    
    return result
end

-- P17 (*) Split a list into two parts; the length of the first part is given. Do not use any predefined predicates.
--  Example: * (split '(a b c d e f g h i k) 3) => ((A B C) (D E F G H I K))

function p17(list, splitIndex)
    local result = {{}, {}}
    
    for i = 1, #list do        
        if i <= splitIndex then
            result[1][#result[1] + 1] = list[i]
        else
            result[2][#result[2] + 1] = list[i]
        end
    end
        
    return result
end

-- P16 (**) Drop every N'th element from a list. Example: * (drop '(a b c d e f g h i k) 3) => (A B D E G H K)

function p16(list, dropEveryIndex)
    local result = {}
    
    for i = 1, #list do
        if i % dropEveryIndex ~= 0 then
            result[#result + 1] = list[i]
        end
    end
    
    return result
end

-- P15 (**) Replicate the elements of a list a given number of times. Example: * (repli '(a b c) 3) => (A A A B B B C C C)

function p15(list, timesToDupli)
    local result = {}
            
    for i = 1, #list do        
        for j = 1, timesToDupli do
            result[#result + 1] = list[i] 
        end            
    end            
    
    return result
end

-- P14 (*) Duplicate the elements of a list. Example: * (dupli '(a b c c d)) => (A A B B C C C C D D)

function p14(list)
    local result = {}
    for i = 1, #list do
        for j = 1, 2 do
            result[#result + 1] = list[i]
        end        
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

local p15result = p15({'a', 'b'}, 3)
setmetatable(p15result, mt)

local p16result = p16({'a', 'b', 'c', 'd', 'd'}, 2)
setmetatable(p16result, mt)

local p17result = p17({'a', 'b', 'c', 'd', 'e'}, 3)
setmetatable(p17result, mt)

local p18result = p18({'a', 'b', 'c', 'd', 'e'}, 2, 4)
setmetatable(p18result, mt)

--local p19result = p19({'a', 'b', 'c', 'd', 'e'}, 2)
local p19result = p19({'a', 'b', 'c', 'd', 'e'}, -2)
setmetatable(p19result, mt)

--print(p11result)
--print(p12result)
--print(p14result)
--print(p15result)
--print(p17result)
--print(p18result)

print(p19result)