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

-- helpers --
function table_to_string(t)
    local result = {}
    for k, v in pairs(t) do
        result[#result + 1] = v
    end
    
    return table.concat(result, " ")
end

mt = {
    __tostring = table_to_string
}

local p02result = p02({'a', 'b', 'c', 'd'}) 
setmetatable(p02result, mt)

local p05result = p05({'a', 'b', 'c', 'd', 'e'})
setmetatable(p05result, mt)

local p07result = p07({'a', {'b', { 'c', 'd'}, 'e'}})
setmetatable(p07result, mt)

--print(p01({'a', 'b', 'c', 'd'}))
--print(p02result)
--print(p03({'a', 'b', 'c', 'd', 'e'}, 3))
--print(p04({'a', 'b', 'c', 'd'}))
--print(p05result)
--print(p06({'x', 'a', 'm', 'a', 'x'}))

print(p07result)

