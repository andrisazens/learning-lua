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

--print(p01({'a', 'b', 'c', 'd'}))
--print(p02result)
--print(p03({'a', 'b', 'c', 'd', 'e'}, 3))
--print(p04({'a', 'b', 'c', 'd'}))

print(p05result)

