greek_numbers = {
    ena = "one"
}

print(getmetatable(greek_numbers))

print(greek_numbers)

function table_to_string(t)
    local result = {}
    for k, v in pairs(t) do
        result[#result + 1] = k .. ": " .. v
    end
    
    return table.concat(result, "\n")
end

mt = {
    __tostring = table_to_string
}

setmetatable(greek_numbers, mt)
print(greek_numbers)