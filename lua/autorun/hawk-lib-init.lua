Hawk = Hawk or {}


/**
  * @function Hawk.fileType
  * @param {string} file
  * @return {string}
  */
function Hawk.fileType(file)
    return string.sub(file, 0, 2)
end


/**
  * @function Hawk.include
  * @param {string} file
  * @param {string} visible
  */
function Hawk.include(file, visible) 
  if (!visible) then
    visible = Hawk.fileType(file) 
  end


  if (visible == 'sh') then
    if (SERVER) then
      AddCSLuaFile(file)
    end

    include(file)
  elseif (visible == 'cl') then
    if (SERVER) then
      AddCSLuaFile(file)
    else 
      include(file)
    end
  else 
    include(file)
  end
end

/**
  * @function Hawk.includeFolder
  * @param {string} folder
  */
function Hawk.includeFolder(folder)
  if (!file.IsDir(folder, 'LUA')) then return end
  
  local files, dirs = file.Find(folder..'*', 'LUA')

  for _, v in pairs(files) do
    Hawk.include(folder .. '/' .. v)
  end

  for _, v in pairs(dirs) do
    Hawk.includeFolder(folder .. v .. '/')
  end
end

Hawk.includeFolder('hawk/')