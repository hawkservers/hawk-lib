Hawk.Logger = Hawk.Logger || {}

/**
  * @function Hawk.Logger.base
  * @param {string} level
  * @param {string[]} ...
  */
function Hawk.Logger.base(level, ...)
  args = {...}

  local color = Hawk.config('logger.levels.' .. level .. '.color', Color(50, 141, 168))

  local logTime = os.time()
  local time = os.date("%d/%m/%Y - %H:%M:%S ", logTime)

  MsgC(
    Color(200, 200, 200), time,
    color, Hawk.config('logger.levels.' .. level .. '.display', 'Log'),
    Color(200, 200, 200), ' - ', table.concat(args, " "), '\n'
  )
end

for k,_ in pairs(Hawk.config('logger.levels')) do
  Hawk.Logger[k] = function(...)
    Hawk.Logger.base(k, ...)
  end
end
