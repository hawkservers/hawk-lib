local hawkConfig = {
    ['logger'] = { 
        ['levels'] = {
            ["trace"] = {
                ["display"] = "Trace",
                ["color"] = Color(150, 50, 217),
                ["stores"] = false,
                ["timestamps"] = true,
                ["devOnly"] = true,
            },
            ["debug"] = {
                ["display"] = "Debug",
                ["color"] = Color(24,255,255),
                ["stores"] = false,
                ["timestamps"] = true,
                ["devOnly"] = true,
            },
            ["info"] = {
                ["display"] = "Info",
                ["color"] = Color(67, 160, 71),
                ["stores"] = true,
                ["timestamps"] = true,
            },
            ["warn"] = {
                ["display"] = "Warn",
                ["color"] = Color(253, 216, 53),
                ["stores"] = true,
                ["timestamps"] = true,
            },
            ["error"] = {
                ["display"] = "Error",
                ["color"] = Color(229, 57, 53),
                ["stores"] = true,
                ["timestamps"] = true,
            },
            ["fatal"] = {
                ["display"] = "Fatal",
                ["color"] = Color(183, 28, 28),
                ["stores"] = true,
                ["timestamps"] = true,
            }
        }
    }
}

/**
  * @function Hawk.config
  * @param {string} config
  * @param {any} default
  * @return {any}
  */
function Hawk.config(config, default)
    if (config == '*') then
        return hawkConfig
    end

    config = string.Split(config, '.')
    local response = hawkConfig

    for k, v in pairs(config) do
        if (!response[v]) then
            return default
        end

        if (k == #config) then
            return response[v]
        end

        response = response[v]
    end
end

function Hawk.setConfig(config)
    if (!istable(config)) then
        Hawk.Logger.error('CONFIG', 'Config must be a table')
        return
    end

    table.Merge(hawkConfig, config)
end
