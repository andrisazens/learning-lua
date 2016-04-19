--P01 (*) Find the last box of a list. Example: (my-last '(a b c d)) => d

function p01(list)
    return list[table.getn(list)]    
end

-- P02 (*) Find the last but one box of a list. Example: (my-but-last '(a b c d)) => (C D)

function p02(list)
    if table.getn(list) > 2 then
        return { list[#list -1 ], list[#list] }
    else
        return list
    end
end

-- P03 (*) Find the K'th element of a list. The first element in the list is number 1. Example: * (element-at '(a b c d e) 3) => C
function p03(list, num)
    return list[num];
end

-- P04 (*) Find the number of elements of a list. 
function  p04(list)
    return #list
end

-- P05 (*) Reverse a list.
function p05(list)
    local result = {}
        
    local i = 1
    while #result < #list do
        result[i] = list[#list - i + 1]
        i = i + 1
    end
    
    return result
end

-- P06 (*) Find out whether a list is a palindrome. A palindrome can be read forward or backward; e.g. (x a m a x).
function p06(list)
    local reversed, i, result = p05(list), 0, true    
        
    while i < #list do
        if (list[i] ~= reversed[i]) then
            result = false
            break
        end
        i = i + 1
    end 
        
    return result
end

-- P07 (**) Flatten a nested list structure. Transform a list, possibly holding lists as elements into a `flat' list by replacing each list with its elements (recursively).
-- Example: * (my-flatten '(a (b (c d) e))) (A B C D E)
function p07(list)
    local result = {}
        
    for i = 1, #list do        
        if (type(list[i]) ~= "table") then            
            result[#result + 1] = list[i]
        else
            local flatten = p07(list[i])
            for k = 1, #flatten do
                result[#result + 1] = flatten[k]
            end            
        end     
    end
    
    return result
end

-- P08 (**) Eliminate consecutive duplicates of list elements. If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.
-- Example: * (compress '(a a a a b c c a a d e e e e)) => (A B C A D E)

function p08(list)
    local result = {}

    for i = 1, #list do
        if not isInArray(result, list[i]) then
            result[#result + 1] = list[i]
        end
    end
    
    return result
end

-- P09 (**) Pack consecutive duplicates of list elements into sublists. If a list contains repeated elements they should be placed in separate sublists.
--  Example: * (pack '(a a a a b c c a a d e e e e)) => ((A A A A) (B) (C C) (A A) (D) (E E E E))

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

-- P10 (*) Run-length encoding of a list. Use the result of problem P09 to implement the so-called run-length encoding data compression method. 
--   Consecutive duplicates of elements are encoded as lists (N E) where N is the number of duplicates of the element E.
-- Example: * (encode '(a a a a b c c a a d e e e e)) => ((4 A) (1 B) (2 C) (2 A) (1 D)(4 E))

function p10(list)
    local dups, result = p09(list), {}
    for i = 1, #dups do
        local subList = {}
        subList[1] = #dups[i]
        subList[2] = dups[i][1]
        result[#result + 1] = subList
    end
    
    return result
end

function isInArray (arr, search)
    for index, value in ipairs (arr) do
        if value == search then
            return true
        end
    end

    return false
end

-- helpers --
function table_to_string(t)
    local result = {}
    for k, v in pairs(t) do
        result[#result + 1] = v
    end
    
    return table.concat(result, " ")
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

local p02result = p02({'a', 'b', 'c', 'd'}) 
setmetatable(p02result, mt)

local p05result = p05({'a', 'b', 'c', 'd', 'e'})
setmetatable(p05result, mt)

local p07result = p07({'a', {'b', { 'c', 'd'}, 'e'}})
setmetatable(p07result, mt)

local p08result = p08({'a', 'b', 'b', 'c', 'a', 'b'})
setmetatable(p08result, mt)

local p09result = p09({'a', 'a', 'a', 'b', 'b', 'a'})
setmetatable(p09result, mt)

local p10result = p10({'a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e'})
setmetatable(p10result, mt)

--print(p01({'a', 'b', 'c', 'd'}))
--print(p02result)
--print(p03({'a', 'b', 'c', 'd', 'e'}, 3))
--print(p04({'a', 'b', 'c', 'd'}))
--print(p05result)
--print(p06({'x', 'a', 'm', 'a', 'x'}))
--print(p07result)
--print(p08result)
--print(p09result)
print(p10result)

