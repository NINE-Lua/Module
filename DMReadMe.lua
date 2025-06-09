An example on how to use DynamicModule is;

local module = DynamicModule.Load({id = "Module1", max_calls = 100})
module:Bind("ProcessData", "string")
module:Bind("RenderFrame", "number")
local results = module:Execute()
print(#results) -- Outputs: 2
local metrics = module:Metrics()
print(metrics.calls_executed) -- Outputs: 2 (yet again)
module:Register("on_bind", function(binding) end)
module:Unload()
