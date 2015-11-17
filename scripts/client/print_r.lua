local function print_r ( t ) 
        local print_r_cache={}
        local function sub_print_r(t,indent)
                if (print_r_cache[tostring(t)]) then
                        log:write(indent.."*"..tostring(t))
                else
                        print_r_cache[tostring(t)]=true
                        if (type(t)=="table") then
                                for pos,val in pairs(t) do
                                        if (type(val)=="table") then
                                                log:write(indent.."["..pos.."] => "..tostring(t).." {")
                                                sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                                                log:write(indent..string.rep(" ",string.len(pos)+6).."}")
                                        elseif (type(val)=="string") then
                                                log:write(indent.."["..pos..'] => "'..val..'"')
                                        else
                                                log:write(indent.."["..pos.."] => "..tostring(val))
                                        end
                                end
                        else
                                log:write(indent..tostring(t))
                        end
                end
        end
        if (type(t)=="table") then
                log:write(tostring(t).." {")
                sub_print_r(t,"  ")
                log:write("}")
        else
                sub_print_r(t,"  ")
        end
end
return print_r