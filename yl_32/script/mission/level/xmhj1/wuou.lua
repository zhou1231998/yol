-- 文件名　：
-- 创建者　：
-- 创建时间：
-- 描述：巫偶



----------------巫偶------------------
Include("\\script\\mission\\level\\room_base.lua");

XoyoGame.WuOu = Lib:NewClass(XoyoGame.BaseRoom);

local WuOu = XoyoGame.WuOu;

function WuOu:OnInitRoom()
	self.tbBlood = {};
end

function WuOu:RecordBlood(szGroup)
	if not self.tbNpcGroup[szGroup] then
		return 0;
	end
	for _, nId in pairs(self.tbNpcGroup[szGroup]) do
		local pNpc = KGameBase.GetNpcById(nId);
		local nLife = pNpc.GetCurrentLife();
		local nMaxLife = pNpc.GetMaxLife();
		if nLife and nLife > 0 then
			self.tbBlood[szGroup] = nLife / nMaxLife * 100;
			print(szGroup,self.tbBlood[szGroup]);
			break;
		end	
	end
end

function WuOu:SetNpcBlood(szGroup)
	Lib:ShowTB(self.tbBlood);
			print("szGroup",szGroup or "",self.tbBlood[szGroup]);
	--self:SetNpcLife(szGroup,tonumber(self.tbBlood["szGroup"]) or 100);
	local nPercent = self.tbBlood[szGroup];

	for _,nId in pairs(self.tbNpcGroup[szGroup]) do
		local pNpc = KGameBase.GetNpcById(nId);
		local nCurLife = nPercent * pNpc.GetMaxLife() / 100;
		if nCurLife and nCurLife > 0 then
			pNpc.SetCurrentLife(nCurLife);
			
			--print("percent",nPercent);
			--print("maxlife",pNpc.GetMaxLife());
			--print("percent",nCurLife);
		end
	end
end

function WuOu:SetNpcLife(szGroup,nPercent)
	for _,nId in pairs(self.tbNpcGroup[szGroup]) do
		local pNpc = KGameBase.GetNpcById(nId);
		local nCurLife = nPercent * pNpc.GetMaxLife() / 100;
		if nCurLife and nCurLife > 0 then
			pNpc.SetCurrentLife(nCurLife);
			
			--print("percent",nPercent);
			--print("maxlife",pNpc.GetMaxLife());
			--print("percent",nCurLife);
		end
	end
end

