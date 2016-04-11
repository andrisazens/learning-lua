--P01 (*) Find the last box of a list. Example: (my-last '(a b c d))

function p01(list)
    return list[table.getn(list)]    
end

print(p01({'a', 'b', 'c', 'd'}))