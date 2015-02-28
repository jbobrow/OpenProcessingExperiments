
require("libs.Utils")
require("libs.Deadly")

------------------------[[Config]]-------------------------
                        sleep = 100                 --increase sleep - > increase performance
                xx = client.screenSize.x/300    --x coordinate
                yy = client.screenSize.y/1.375  --y coordinate
                toggleKey = string.byte("Z")
------------------------------------------------------------

PreKill = 0 text = {} real = {} hero = {} global = {}
start = false activated = false activatedD = false clear = false


F14 = drawMgr:CreateFont("F14","Calibri",14,500)
rect = drawMgr:CreateRect(xx-1,yy-1,26,26,0xFF0D0D90,true)
rect.visible = false
icon = drawMgr:CreateRect(xx,yy,24,24,0x000000ff)
icon.visible = false
dmgCalc = drawMgr:CreateText(xx, yy-18, 0xFF0D0D90,"Dmg",F14)
dmgCalc.visible = false
for a = 1, 5 do
global[a] = drawMgr:CreateRect(0,yy-5,18,18,0x000000FF)
global[a].visible = false
end

function Tick(tick)

        if not client.connected or client.loading or client.console or not entityList:GetMyHero() then start = false return end     
    
        me = entityList:GetMyHero()

        mename = me.name
        
        if not list[mename] then return end
                
        Skill = me:FindSpell(list[mename].Spell)

        if not list[mename].Range then
        range = Skill.castRange
        else range = list[mename].Range
        end

        if me:FindItem("item_ultimate_scepter") and list[mename].DmgA then
        Dmg = list[mename].DmgA
        else Dmg = list[mename].Dmg
        end

        start = true real = {}
        
        if activated then rect.color = 0xFFFFFF90
            if mename == "npc_dota_hero_windrunner" and Skill.channelTime ~= 0 and client.gameTime > Skill.channelTime + .59 then me:Move(me.position) end
            if Skill.level > 0 and me.alive and not me:IsChanneling() and SleepCheck() then
                local enemies = entityList:FindEntities({type=LuaEntity.TYPE_HERO,visible=true,alive = true,illusion = false})
                for i, v in ipairs(enemies) do
                    if v.team ~= me.team and GetDistance2D(me,v) < range and v.health > 0 and CanDie(v) and NotDieFromSpell(Skill,v) and not v:DoesHaveModifier("modifier_nyx_assassin_spiked_carapace") then
                        if not list[mename].Cast and mename ~= "npc_dota_hero_life_stealer" and mename ~= "npc_dota_hero_furion" and mename ~= "npc_dota_hero_zuus" then
                            if v.health + 1 < v:DamageTaken(Dmg[Skill.level], list[mename].Type, me) - Pipe(v) and NotDieFromBM(v,Skill) then
                                if list[mename].Time == nil then
                                    local target = list[mename].Target
                                    if target == "target" then
                                        me:SafeCastAbility(Skill,v)
                                        Sleep(100)
                                    elseif target == "area" then
                                        me:SafeCastAbility(Skill,v.position)
                                        Sleep(100)
                                    elseif target == "nontarget" then
                                        me:SafeCastAbility(Skill)
                                        Sleep(100)
                                    end
                                elseif list[mename].Time == 1 then table.insert(real,v)
                                    if real[1] then
                                        local first = real[1]
                                        if first.activity == 422 and first:CanMove() then
                                            if RangePred(Skill,first,list[mename].Speed,list[mename].CastTime) == true then
                                            me:SafeCastAbility(Skill,Vector(first.position.x + first.movespeed * (GetDistance2D(first,me)/(list[mename].Speed * math.sqrt(1 - math.pow(first.movespeed/list[mename].Speed,2))) + list[mename].CastTime) * math.cos(first.rotR), first.position.y + first.movespeed * (GetDistance2D(first,me)/(list[mename].Speed * math.sqrt(1 - math.pow(first.movespeed/list[mename].Speed,2))) + list[mename].CastTime) * math.sin(first.rotR), first.position.z)) Sleep(100)
                                            end                                         
                                        else
                                            me:SafeCastAbility(Skill,Vector(first.position.x + first.movespeed * 0.05 * math.cos(first.rotR), first.position.y + first.movespeed* 0.05 * math.sin(first.rotR), first.position.z)) Sleep(100)
                                        end                                         
                                    end
                                end
                            end
                        elseif mename == "npc_dota_hero_doom_bringer" then
                                local DmgM = math.floor((v:GetProperty("CDOTA_BaseNPC","m_iCurrentLevel") == 25 or v:GetProperty("CDOTA_BaseNPC","m_iCurrentLevel") % list[mename].Doom[Skill.level].levelMultiplier == 0) and (v.maxHealth * 0.20 + list[mename].Doom[Skill.level].dmg)    or  (list[mename].Doom[Skill.level].dmg))
                                if v.health + 1 < v:DamageTaken(DmgM, list[mename].Type, me) - Pipe(v) and NotDieFromBM(v,Skill) then
                                me:SafeCastAbility(Skill,v)
                                Sleep(100)
                                end
                        elseif mename == "npc_dota_hero_nyx_assassin" then      
                                local DmgM = Dmg[Skill.level] * v.intellectTotal
                                if v.health + 1 < v:ManaBurnDamageTaken(DmgM,1,list[mename].Type,me) - Pipe(v) and NotDieFromBM(v,Skill) then
                                me:SafeCastAbility(Skill,v)
                                Sleep(100)
                                end
                        elseif mename == "npc_dota_hero_mirana" then
                                if GetDistance2D(v,me) < 200 then DmgM = Dmg[Skill.level]*1.75 else DmgM = Dmg[Skill.level] end
                                if v.health + 1 < v:DamageTaken(DmgM, list[mename].Type, me) - Pipe(v) and NotDieFromBM(v,Skill) then
                                me:SafeCastAbility(Skill)
                                Sleep(100)
                                end
                        elseif mename == "npc_dota_hero_elder_titan" then
                                if me:GetAbility(3).level ~= 0 and not v:FindModifier("modifier_elder_titan_natural_order") then local DmgS = list[mename].DmgM DmgM = DmgS[me:GetAbility(3).level]*Dmg[Skill.level] else DmgM = Dmg[Skill.level] end
                                if v.health + 1 < v:DamageTaken(DmgM, list[mename].Type, me) - Pipe(v) and NotDieFromBM(v,Skill) then
                                me:SafeCastAbility(Skill,v.position)
                                Sleep(100)
                                end
                        elseif mename == "npc_dota_hero_necrolyte" then
                                local DmgM = (v.maxHealth - v.health) * Dmg[Skill.level]
                                if v.health + 1 < v:DamageTaken(DmgM, list[mename].Type, me) - Pipe(v) and NotDieFromBM(v,Skill) then
                                me:SafeCastAbility(Skill,v)
                                Sleep(100)
                                end
                        elseif mename == "npc_dota_hero_antimage" then
                                local DmgM = (v.maxMana - v.mana) * Dmg[Skill.level]
                                if v.health + 1 < v:DamageTaken(DmgM, list[mename].Type, me) - Pipe(v) and NotDieFromBM(v,Skill) then
                                me:SafeCastAbility(Skill,v)
                                Sleep(100)
                                end
                        elseif mename == "npc_dota_hero_morphling" then local as = me.agilityTotal/me.strengthTotal
                                if as > 1.5 then DmgM = 0.5*Skill.level elseif as < 0.5 then DmgM = 0.25 elseif (as >= 0.5 and as <= 1.5) then DmgM = 0.25+((as-0.5)*(0.5*Skill.level-0.25)) end
                                if v.health + 1 < v:DamageTaken((DmgM)*me.agilityTotal + Dmg[Skill.level], list[mename].Type, me) - Pipe(v) and NotDieFromBM(v,Skill) then
                                me:SafeCastAbility(Skill,v)
                                Sleep(100)
                                end
                        elseif mename == "npc_dota_hero_obsidian_destroyer" then local DmgM = 0
                                if me.intellectTotal > v.intellectTotal then DmgM = (me.intellectTotal - v.intellectTotal)*Dmg[Skill.level] end
                                if v.health + 1 < v:DamageTaken(DmgM, list[mename].Type, me) - Pipe(v) and NotDieFromBM(v,Skill) then
                                me:SafeCastAbility(Skill,v.position)
                                Sleep(100)
                                end
                        elseif mename == "npc_dota_hero_visage" then
                                local DmgM = 20 + (ModifierStacks("modifier_visage_soul_assumption",me) * 65)
                                if v.health + 1 < v:DamageTaken(DmgM, list[mename].Type, me) - Pipe(v) and NotDieFromBM(v,Skill) then
                                me:SafeCastAbility(Skill,v)
                                Sleep(100)
                                end
                        elseif mename == "npc_dota_hero_shadow_demon" then local DmgS = list[mename].DmgM local Mod = ModifierStacks("modifier_shadow_demon_shadow_poison",v)                               
                                if Mod ~= 0 and Mod < 6 then DmgM = (DmgS[ModifierStacks("modifier_shadow_demon_shadow_poison",v)]) * Dmg[Skill.level] elseif Mod > 5 then DmgM = ((Dmg[Skill.level]*16) + ((Mod-5)*50)) end
                                if DmgM ~= nil then                                 
                                    if v.health + 1 < v:DamageTaken(DmgM, list[mename].Type, me) - Pipe(v) and NotDieFromBM(v,Skill) then
                                    me:SafeCastAbility(me:GetAbility(4))
                                    Sleep(100)
                                    end
                                end
                        elseif mename == "npc_dota_hero_alchemist" then                             
                                if Elapsed("modifier_alchemist_unstable_concoction",me) < 4.6 then bomb = Elapsed("modifier_alchemist_unstable_concoction",me) else bomb = 4.6 end MMTT = list[mename].Mod local DmgM = (bomb * MMTT[Skill.level])
                                if v.health + 1 < v:DamageTaken(DmgM, list[mename].Type, me) then
                                me:CastAbility(me:GetAbility(2),v)
                                Sleep(100)
                                end
                        elseif mename == "npc_dota_hero_nevermore" then
                                if v.health + 1 < v:DamageTaken(Dmg[Skill.level], list[mename].Type, me) - Pipe(v) and NotDieFromBM(v,Skill) then
                                    if GetDistance2D(v,me) < 350 then
                                        entityList:GetMyPlayer():Attack(v)
                                        me:SafeCastAbility(me:GetAbility(1))
                                        Sleep(100)
                                    elseif GetDistance2D(v,me) < 550 and GetDistance2D(v,me) > 350 then
                                        entityList:GetMyPlayer():Attack(v)
                                        me:SafeCastAbility(me:GetAbility(2))
                                        Sleep(100)
                                    elseif GetDistance2D(v,me) < 800 and GetDistance2D(v,me) > 550 then
                                        entityList:GetMyPlayer():Attack(v)
                                        me:SafeCastAbility(me:GetAbility(3))
                                        Sleep(100)
                                    end
                                end
                        elseif mename == "npc_dota_hero_zuus" or mename == "npc_dota_hero_furion" then
                            if v.health + 1 < v:DamageTaken(Dmg[Skill.level], list[mename].Type, me) - Pipe(v) and NotDieFromBM(v,Skill) then
                                table.insert(real,v)
                                for k,l in ipairs(real) do
                                    if k == PreKill then
                                        if list[mename].Target == "target" then
                                            me:SafeCastAbility(Skill,l)
                                            PreKill = 0 Sleep(100)
                                        elseif list[mename].Target == "area" then
                                            me:SafeCastAbility(Skill,l.position)
                                            PreKill = 0 Sleep(100)
                                        elseif list[mename].Target == "nontarget" then
                                            me:SafeCastAbility(Skill)
                                            PreKill = 0 Sleep(100)
                                        end
                                    end
                                end
                            end                     
                        elseif mename == "npc_dota_hero_invoker" then local DmgM = Dmg[me:GetAbility(3).level]
                            if v.health + 1 < v:DamageTaken(DmgM, list[mename].Type, me) and NotDieFromBM(v,Skill) then
                                table.insert(real,v)
                                for k,l in ipairs(real) do                          
                                    
                                    if k == PreKill then                                        
                                        if real[k].activity == 422 and real[k]:CanMove() then
                                        me:SafeCastAbility(Skill,Vector(l.position.x + l.movespeed * 1.75 * math.cos(l.rotR), l.position.y + l.movespeed* 1.75 * math.sin(l.rotR), l.position.z))
                                        PreKill = 0 Sleep(100)
                                        else
                                        me:SafeCastAbility(Skill,Vector(l.position.x + l.movespeed * 0.05 * math.cos(l.rotR), l.position.y + l.movespeed* 0.05 * math.sin(l.rotR), l.position.z))                                       
                                        PreKill = 0 Sleep(100)
                                        end
                                    end
                                    
                                end
                            end                     
                        end

                    end
                end
            end 
        else
            rect.color = 0xFF0D0D90
        end
end

function Frame(tick)
    
    if not client.connected or client.loading or client.console or not entityList:GetMyHero() or not list[mename] then return end
        
    dmgCalc.visible = true
    rect.visible = true
    icon.visible = true
    icon.textureId = drawMgr:GetTextureId("NyanUI/spellicons/"..list[mename].Spell) 
    
    if activatedD then dmgCalc.color = 0xFFFFFF90 clear = true
        if start == true and Skill.level > 0 then 
            local enemi = entityList:FindEntities({type=LuaEntity.TYPE_HERO,illusion=false})
            for i, v in ipairs(enemi) do
                if v.team ~= me.team then               
                test = v.position
                test.z = test.z + v.healthbarOffset
                local OnScreen, pos = client:ScreenPosition(test)
                
                if not hero[v.handle] then hero[v.handle] = {}          
                    hero[v.handle].txt = drawMgr:CreateText(pos.x + 20, pos.y - 45, 0xFFFFFFFF, "",F14) hero[v.handle].txt.visible = false
                end
                
                    if OnScreen and v.visible and v.alive and v.health > 0 then
                        if not list[mename].Cast then                           
                            hero[v.handle].txt.visible = true
                            hero[v.handle].txt.x = pos.x + 20
                            hero[v.handle].txt.y = pos.y - 45
                            if SleepCheck(v.handle) then hero[v.handle].txt.text = " "..math.floor(v.health - v:DamageTaken(Dmg[Skill.level], list[mename].Type, me)) Sleep(sleep,v.handle) end
                        elseif mename == "npc_dota_hero_doom_bringer" then                          
                            hero[v.handle].txt.visible = true
                            hero[v.handle].txt.x = pos.x + 20
                            hero[v.handle].txt.y = pos.y - 45
                            if SleepCheck(v.handle) then local DmgM = math.floor((v:GetProperty("CDOTA_BaseNPC","m_iCurrentLevel") == 25 or v:GetProperty("CDOTA_BaseNPC","m_iCurrentLevel") % list[mename].Doom[Skill.level].levelMultiplier == 0) and (v.maxHealth * 0.20 + list[mename].Doom[Skill.level].dmg)   or  (list[mename].Doom[Skill.level].dmg))
                            hero[v.handle].txt.text = " "..math.floor(v.health - v:DamageTaken(DmgM, list[mename].Type, me)) Sleep(sleep,v.handle) end
                        elseif mename == "npc_dota_hero_necrolyte" then                         
                            hero[v.handle].txt.visible = true
                            hero[v.handle].txt.x = pos.x + 20
                            hero[v.handle].txt.y = pos.y - 45
                            if SleepCheck(v.handle) then local DmgM = (v.maxHealth - v.health) * Dmg[Skill.level]
                            hero[v.handle].txt.text = " "..math.floor(v.health - v:DamageTaken(DmgM, list[mename].Type, me)) Sleep(sleep,v.handle) end                          
                        elseif mename == "npc_dota_hero_antimage" then                          
                            hero[v.handle].txt.visible = true
                            hero[v.handle].txt.x = pos.x + 20
                            hero[v.handle].txt.y = pos.y - 45
                            if SleepCheck(v.handle) then local DmgM = (v.maxMana - v.mana) * Dmg[Skill.level]
                            hero[v.handle].txt.text = " "..math.floor(v.health - v:DamageTaken(DmgM, list[mename].Type, me)) Sleep(sleep,v.handle) end                          
                        elseif mename == "npc_dota_hero_invoker" then                           
                            hero[v.handle].txt.visible = true
                            hero[v.handle].txt.x = pos.x + 20
                            hero[v.handle].txt.y = pos.y - 45
                            if SleepCheck(v.handle) then local DmgM = Dmg[me:GetAbility(3).level]
                            hero[v.handle].txt.text = " "..math.floor(v.health - v:DamageTaken(DmgM, list[mename].Type, me)) Sleep(sleep,v.handle) end                          
                        elseif mename == "npc_dota_hero_morphling" then                 
                            hero[v.handle].txt.visible = true
                            hero[v.handle].txt.x = pos.x + 20
                            hero[v.handle].txt.y = pos.y - 45
                            if SleepCheck(v.handle) then local as = me.agilityTotal/me.strengthTotal
                            if as > 1.5 then DmgM = 0.5*Skill.level elseif as < 0.5 then DmgM = 0.25 elseif (as >= 0.5 and as <= 1.5) then DmgM = 0.25+((as-0.5)*(0.5*Skill.level-0.25)) end
                            hero[v.handle].txt.text = " "..math.floor(v.health - v:DamageTaken((DmgM)*me.agilityTotal + Dmg[Skill.level], list[mename].Type, me)) Sleep(sleep,v.handle) end                     
                        elseif mename == "npc_dota_hero_visage" then                            
                            hero[v.handle].txt.visible = true
                            hero[v.handle].txt.x = pos.x + 20
                            hero[v.handle].txt.y = pos.y - 45
                            if SleepCheck(v.handle) then local DmgM = 20 + (ModifierStacks("modifier_visage_soul_assumption",me) * 65)
                            hero[v.handle].txt.text = " "..math.floor(v.health - v:DamageTaken(DmgM, list[mename].Type, me))  Sleep(sleep,v.handle) end                         
                        elseif mename == "npc_dota_hero_alchemist" then 
                            hero[v.handle].txt.visible = true
                            hero[v.handle].txt.x = pos.x + 20
                            hero[v.handle].txt.y = pos.y - 45
                            if SleepCheck(v.handle) then local MMTT = list[mename].Mod
                            if Elapsed("modifier_alchemist_unstable_concoction",me) < 4.6 then bomb = Elapsed("modifier_alchemist_unstable_concoction",me) else bomb = 4.6 end MMTT = list[mename].Mod DmgM = (bomb * MMTT[Skill.level])
                            hero[v.handle].txt.text = " "..math.floor(v.health - v:DamageTaken(DmgM, list[mename].Type, me))  Sleep(sleep,v.handle) end                         
                        elseif mename == "npc_dota_hero_mirana" then                            
                            hero[v.handle].txt.visible = true
                            hero[v.handle].txt.x = pos.x + 20
                            hero[v.handle].txt.y = pos.y - 45
                            if SleepCheck(v.handle) then if GetDistance2D(v,me) < 200 then DmgM = Dmg[Skill.level]*1.75 else DmgM = Dmg[Skill.level] end
                            hero[v.handle].txt.text = " "..math.floor(v.health - v:DamageTaken(DmgM, list[mename].Type, me))  Sleep(sleep,v.handle) end                         
                        elseif mename == "npc_dota_hero_obsidian_destroyer" then                            
                            hero[v.handle].txt.visible = true
                            hero[v.handle].txt.x = pos.x + 20
                            hero[v.handle].txt.y = pos.y - 45
                            if SleepCheck(v.handle) then local DmgM = 0 if me.intellectTotal > v.intellectTotal then DmgM = (me.intellectTotal - v.intellectTotal)*Dmg[Skill.level] end
                            hero[v.handle].txt.text = " "..math.floor(v.health - v:DamageTaken(DmgM, list[mename].Type, me))  Sleep(sleep,v.handle) end                         
                        elseif mename == "npc_dota_hero_elder_titan" then                           
                            hero[v.handle].txt.visible = true
                            hero[v.handle].txt.x = pos.x + 20
                            hero[v.handle].txt.y = pos.y - 45
                            if SleepCheck(v.handle) then if me:GetAbility(3).level ~= 0 and not v:FindModifier("modifier_elder_titan_natural_order") then DmgS = list[mename].DmgM DmgM = DmgS[me:GetAbility(3).level]*Dmg[Skill.level] else DmgM = Dmg[Skill.level] end
                            hero[v.handle].txt.text = " "..math.floor(v.health - v:DamageTaken(DmgM, list[mename].Type, me))  Sleep(sleep,v.handle) end                         
                        elseif mename == "npc_dota_hero_shadow_demon" then                  
                            hero[v.handle].txt.visible = true
                            hero[v.handle].txt.x = pos.x + 20
                            hero[v.handle].txt.y = pos.y - 45
                            if SleepCheck(v.handle) then local DmgS = list[mename].DmgM local Mod = ModifierStacks("modifier_shadow_demon_shadow_poison",v)
                            if Mod ~= 0 and Mod < 6 then DmgM = (DmgS[ModifierStacks("modifier_shadow_demon_shadow_poison",v)]) * Dmg[Skill.level] elseif Mod > 5 then DmgM = ((Dmg[Skill.level]*16) + ((Mod-5)*50)) end
                            if DmgM ~= nil then
                            hero[v.handle].txt.text = " "..math.floor(v.health - v:DamageTaken(DmgM, list[mename].Type, me))  Sleep(sleep,v.handle) end end                         
                        elseif mename == "npc_dota_hero_nyx_assassin" then 
                            hero[v.handle].txt.visible = true
                            hero[v.handle].txt.x = pos.x + 20
                            hero[v.handle].txt.y = pos.y - 45
                            if SleepCheck(v.handle) then local DmgM = Dmg[Skill.level] * v.intellectTotal
                            hero[v.handle].txt.text = " "..math.floor(v.health -  v:ManaBurnDamageTaken(DmgM,1,DAMAGE_MAGC,me))   Sleep(sleep,v.handle) end                                     
                        end
                    else        
                        hero[v.handle].txt.visible = false
                    end
                end             
            end

            if mename == "npc_dota_hero_invoker" or mename == "npc_dota_hero_furion" or mename == "npc_dota_hero_zuus" then
                for a = 1, 5 do
                    if real[a] ~= nil then
                    global[a].visible = true
                    global[a].x = xx+5+a*25                 
                    global[a].textureId = drawMgr:GetTextureId("NyanUI/miniheroes/"..real[a].name:gsub("npc_dota_hero_",""))
                    else
                    global[a].visible = false
                    end
                end
            end
        end
        
    else dmgCalc.color = 0xFF0D0D90
        if clear then
            local vrag = entityList:FindEntities({type=LuaEntity.TYPE_HERO,illusion=false})
            for i, v in ipairs(vrag) do
                if hero[v.handle] then
                    hero[v.handle].txt.visible = false
                end
            end
            for a = 1,5 do
                global[a].visible = false
            end
            clear = false
        end
    end

end

function Key(msg,code)

    if not start or not list[mename] then return end
    
        if IsKeyDown(toggleKey) then
            activated = not activated
        end
    
        if IsMouseOnButton(xx,yy,24,24) then
            if msg == LBUTTON_DOWN then
                activated = (not activated)
            end
        end
        
        if IsMouseOnButton(xx,yy-18,24,24) then
            if msg == LBUTTON_DOWN then
                activatedD = (not activatedD)
            end
        end

        if activated then
            if mename == "npc_dota_hero_invoker" or mename == "npc_dota_hero_furion" or mename == "npc_dota_hero_zuus" then
                for k = 1, 5 do
                    if IsMouseOnButton(xx+5+k*25,yy-5,18,18) then
                        if msg == LBUTTON_DOWN then PreKill = k
                        else PreKill = 0
                        end
                    end
                end
            end
        end

end

function IsMouseOnButton(x,y,h,w)
    local mx = client.mouseScreenPosition.x
    local my = client.mouseScreenPosition.y
    return mx > x and mx <= x + w and my > y and my <= y + h
end

function RangePred(spell,t,speed,cast)
    if GetDistance2D(me,Vector(t.position.x + t.movespeed * (GetDistance2D(t,me)/(speed * math.sqrt(1 - math.pow(t.movespeed/speed,2))) + cast) * math.cos(t.rotR), t.position.y + t.movespeed * (GetDistance2D(t,me)/(speed * math.sqrt(1 - math.pow(t.movespeed/speed,2))) + cast) * math.sin(t.rotR), t.position.z)) < spell.castRange then return true end return false
end

function CanDie(target)
    if target:CanReincarnate() then
        return false
    end
    if mename ~= "axe" and target:DoesHaveModifier("modifier_dazzle_shallow_grave") then
        return false
    end
    return true
end

function NotDieFromSpell(spell,target)
    local za = {1,1.25,1.5,1.75}
    local az = {100,150,200,250}
    if not me:IsMagicDmgImmune() then
        if target.name == "npc_dota_hero_pugna" then
            if me:DoesHaveModifier("modifier_pugna_nether_ward_aura") then
                if me.health < me:DamageTaken(spell.manacost*(za[target:GetAbility(3).level]), DAMAGE_MAGC, target) then
                    return false
                end
            end
        elseif target.name == "npc_dota_hero_silencer" then
            if me:DoesHaveModifier("modifier_silencer_last_word") then
                if me.health < me:DamageTaken(az[target:GetAbility(3).level], DAMAGE_MAGC, target) then
                return false
                end
            end
        end
    end
    return true
end

function NotDieFromBM(target,spell)
    if not me:IsMagicDmgImmune() and target:DoesHaveModifier("modifier_item_blade_mail_reflect") and me.health < target:DamageTaken(list[mename].Dmg[spell.level], list[mename].Type, me) then
        return false
    end
    return true
end

function Pipe(target)
    if target:DoesHaveModifier("modifier_item_pipe_barrier") and list[mename].Type == DAMAGE_MAGC then
        return 400
    end
    return 0
end

function ModifierStacks(name,target)
    local modifier = target.modifiers
    if modifier then
        for i,v in ipairs(modifier) do
            if v.name == name then
                return v.stacks
            end
        end
    end
    return 0
end

function Elapsed(name,target)
    local modifier = target.modifiers
    if modifier then
        for i,v in ipairs(modifier) do
            if v.name == name then
                return v.elapsedTime            
            end
        end
    end 
    return 0
end

function GameClose()
    rect.visible = false
    icon.visible = false
    dmgCalc.visible = false
    for a = 1,5 do
        global[a].visible = false
    end
    hero = {}
    real = {}
    collectgarbage("collect")   
end
 
script:RegisterEvent(EVENT_CLOSE,GameClose)
script:RegisterEvent(EVENT_TICK,Tick)
script:RegisterEvent(EVENT_FRAME,Frame)
script:RegisterEvent(EVENT_KEY,Key)
