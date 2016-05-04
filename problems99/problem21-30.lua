--P26 (**) Generate the combinations of K distinct objects chosen from the N elements of a list
--In how many ways can a committee of 3 be chosen from a group of 12 people? We all know that there are C(12,3) = 220 possibilities (C(N,K) 
-- denotes the well-known binomial coefficients). For pure mathematicians, this result may be great. But we want to really generate all the possibilities in a list.
-- Example: * (combination 3 '(a b c d e f)) => ((A B C) (A B D) (A B E) ... )
function p26(combinationCnt, list)
    local result, iter = {}, combinationCnt
    
    -- while iter < #list do
    --     for i = 
    -- end
    
    return result
end

-- P25 (*) Generate a random permutation of the elements of a list.
-- Example: * (rnd-permu '(a b c d e f)) => (B A D C E F)
function p25(list)    
    return p23(list, #list)
end

-- P24 (*) Lotto: Draw N different random numbers from the set 1..M. The selected numbers shall be returned in a list.
-- Example: * (lotto-select 6 49) => (23 1 17 33 21 37)
function p24(count, maxNumber)
    return p23(p22(1, maxNumber), count)
end

--P23 (**) Extract a given number of randomly selected elements from a list.
-- The selected items shall be returned in a list. Example: * (rnd-select '(a b c d e f g h) 3) => (E D A)
function p23(list, count)
    local result, usedIndexes = {}, {}
        
    math.randomseed(os.time())        
    while #result < count do
        
        local nextRand = math.random(1, #list)
        if not isInArray(usedIndexes, nextRand) then
            result[#result + 1] = list[nextRand]
            usedIndexes[#usedIndexes + 1] = nextRand
        end
    end    
    
    return result
end

-- P22 (*) Create a list containing all integers within a given range. If first argument is smaller than second, produce a list in decreasing order.
-- Example: * (range 4 9) => (4 5 6 7 8 9)

function p22(from, to)
    local result, increment = {}, 1
    
    if from > to then        
        increment = -1;    
    end
    
    for i = from, to, increment do
        result[#result + 1] = i
    end
    
    return result
end

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

function isInArray (arr, search)
    for index, value in ipairs (arr) do
        if value == search then
            return true
        end
    end

    return false
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

--local p22result = p22(4, 7)
local p22result = p22(7, 4)
setmetatable(p22result, mt)

local p23result = p23({'a', 'b', 'c', 'd', 'e', 'f'}, 2)
setmetatable(p23result, mt)

local p24result = p24(4, 20)
setmetatable(p24result, mt)

local p25result = p25({'a', 'b', 'c', 'd', 'e', 'f'})
setmetatable(p25result, mt)

--print(p21result)
--print(p22result)
--print(p23result)
--print(p24result)

print(p25result)