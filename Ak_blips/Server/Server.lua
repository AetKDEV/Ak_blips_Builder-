RegisterServerEvent('ak-blipsCreator:GetBlips')
AddEventHandler('ak-blipsCreator:GetBlips', function (remove)
    local src = source
    RefreshBlips(src, remove)
end)

RegisterServerEvent('ak-blipsCreator:SaveBlips')
AddEventHandler('ak-blipsCreator:SaveBlips', function (x,y,z,sprite,color,name, isuniversal)
    local src = source
    local iden = GetIdentifier(src, Config.Identifier)
 
    if isuniversal == 'yes' then 
        Query(Config.Db, 'execute',
        "INSERT INTO ak-blips (`identifier`, `x`, `y`, `z`, `sprite`, `color`, `name`, `universal`) VALUES (@id, @x, @y, @z, @sprite, @color, @name, 1)",
        {['@id'] = 'Admin Blip', ['@x'] = x, ['@y'] = y, ['@z'] = z, ['@sprite'] = sprite, ['@color'] = color, ['@name'] = name})
    else
        Query(Config.Db, 'execute',
        "INSERT INTO ak-blips (`identifier`, `x`, `y`, `z`, `sprite`, `color`, `name`, `universal`) VALUES (@id, @x, @y, @z, @sprite, @color, @name, 0)",
        {['@id'] = iden, ['@x'] = x, ['@y'] = y, ['@z'] = z, ['@sprite'] = sprite, ['@color'] = color, ['@name'] = name})
    end
    
end)



RegisterServerEvent('ak-blipsCreator:GetBlipsToDelete')
AddEventHandler('ak-blipsCreator:GetBlipsToDelete', function (admin)
    local src = source
    local iden = GetIdentifier(src, Config.Identifier)
    GetBlipsToDelete(src, admin)
end)

RegisterServerEvent('ak-blipsCreator:DeleteBlipPersonal')
AddEventHandler('ak-blipsCreator:DeleteBlipPersonal', function (blipid)
    Query(Config.Db, 'execute',
        "DELETE FROM ak-blips WHERE blipid = @id",
        {['@id'] = blipid})
end)

RegisterCommand('blipcreator', function (source)
    local src = source
    if CheckIsAdmin(src) then 
        TriggerClientEvent('ak-blipsCreator:OpenUI', src, true)
    else
        TriggerClientEvent('ak-blipsCreator:OpenUI', src, false)
    end
end)


RegisterServerEvent('ak-blipsCreator:UniversalBlipsRefresh')
AddEventHandler('ak-blipsCreator:UniversalBlipsRefresh', function (info, remove)
    TriggerClientEvent('ak-blipsCreator:MakeBlip', -1, info)
end)