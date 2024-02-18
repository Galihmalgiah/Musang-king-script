function zzz()
Position = GetLocal().isleft
if Position then
return 32
else
return 48
end
end

if getLocal().isleft then
return break(x-1,y)
else
return break(x+1,y)
end