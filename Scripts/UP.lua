return(function(IIIllllIIIllI,IIIllIllIllllIIIlll,IIIllIllIllllIIIlll)local lIlIIllIlIIIIlIIl=string.char;local IllllIlIl=string.sub;local llIIlIlIIIllI=table.concat;local lllIIlIlllllIllIIIIIII=math.ldexp;local IIIlIIIIIlIlIIlIIIIllII=getfenv or function()return _ENV end;local llIlIIIl=select;local IIIllIllIllllIIIlll=unpack or table.unpack;local IIIllIllIllllIIIlll=tonumber;local IlIIIIllIllIll='\211\209\209\209\208\212\209\209\209\161\163\184\191\165\208\210\209\209\209\190\190\183\209\209\209\209\209\213\209\209\209\195\214\209\209\209\208\209\209\209\195\210\209\208\209\211\209\209\209\209\208\209\209\209\211\209\208\209\209\211\209\209\209\208\209\209\209';local IIIllIllIllllIIIlll=(bit or bit32);local IlIlIIIIllIlllIlllIIlllI=IIIllIllIllllIIIlll and IIIllIllIllllIIIlll.bxor or function(IIIllIllIllllIIIlll,lIlllIlIllIllIIIIIllII)local IlllIIlllllIlIIIlllII,IlIlIIIIllIlllIlllIIlllI,IlIIlIlIIlIIIIllll=1,0,10 while IIIllIllIllllIIIlll>0 and lIlllIlIllIllIIIIIllII>0 do local IlIIlIlIIlIIIIllll,lllIlIIlIlllIlIIIlll=IIIllIllIllllIIIlll%2,lIlllIlIllIllIIIIIllII%2 if IlIIlIlIIlIIIIllll~=lllIlIIlIlllIlIIIlll then IlIlIIIIllIlllIlllIIlllI=IlIlIIIIllIlllIlllIIlllI+IlllIIlllllIlIIIlllII end IIIllIllIllllIIIlll,lIlllIlIllIllIIIIIllII,IlllIIlllllIlIIIlllII=(IIIllIllIllllIIIlll-IlIIlIlIIlIIIIllll)/2,(lIlllIlIllIllIIIIIllII-lllIlIIlIlllIlIIIlll)/2,IlllIIlllllIlIIIlllII*2 end if IIIllIllIllllIIIlll<lIlllIlIllIllIIIIIllII then IIIllIllIllllIIIlll=lIlllIlIllIllIIIIIllII end while IIIllIllIllllIIIlll>0 do local lIlllIlIllIllIIIIIllII=IIIllIllIllllIIIlll%2 if lIlllIlIllIllIIIIIllII>0 then IlIlIIIIllIlllIlllIIlllI=IlIlIIIIllIlllIlllIIlllI+IlllIIlllllIlIIIlllII end IIIllIllIllllIIIlll,IlllIIlllllIlIIIlllII=(IIIllIllIllllIIIlll-lIlllIlIllIllIIIIIllII)/2,IlllIIlllllIlIIIlllII*2 end return IlIlIIIIllIlllIlllIIlllI end local function lIlllIlIllIllIIIIIllII(IlllIIlllllIlIIIlllII,IIIllIllIllllIIIlll,lIlllIlIllIllIIIIIllII)if lIlllIlIllIllIIIIIllII then local IIIllIllIllllIIIlll=(IlllIIlllllIlIIIlllII/2^(IIIllIllIllllIIIlll-1))%2^((lIlllIlIllIllIIIIIllII-1)-(IIIllIllIllllIIIlll-1)+1);return IIIllIllIllllIIIlll-IIIllIllIllllIIIlll%1;else local IIIllIllIllllIIIlll=2^(IIIllIllIllllIIIlll-1);return(IlllIIlllllIlIIIlllII%(IIIllIllIllllIIIlll+IIIllIllIllllIIIlll)>=IIIllIllIllllIIIlll)and 1 or 0;end;end;local IIIllIllIllllIIIlll=1;local function IlllIIlllllIlIIIlllII()local lllIlIIlIlllIlIIIlll,IlIIlIlIIlIIIIllll,lIlllIlIllIllIIIIIllII,IlllIIlllllIlIIIlllII=IIIllllIIIllI(IlIIIIllIllIll,IIIllIllIllllIIIlll,IIIllIllIllllIIIlll+3);lllIlIIlIlllIlIIIlll=IlIlIIIIllIlllIlllIIlllI(lllIlIIlIlllIlIIIlll,209)IlIIlIlIIlIIIIllll=IlIlIIIIllIlllIlllIIlllI(IlIIlIlIIlIIIIllll,209)lIlllIlIllIllIIIIIllII=IlIlIIIIllIlllIlllIIlllI(lIlllIlIllIllIIIIIllII,209)IlllIIlllllIlIIIlllII=IlIlIIIIllIlllIlllIIlllI(IlllIIlllllIlIIIlllII,209)IIIllIllIllllIIIlll=IIIllIllIllllIIIlll+4;return(IlllIIlllllIlIIIlllII*16777216)+(lIlllIlIllIllIIIIIllII*65536)+(IlIIlIlIIlIIIIllll*256)+lllIlIIlIlllIlIIIlll;end;local function lllIlIIlIlllIlIIIlll()local IlllIIlllllIlIIIlllII=IlIlIIIIllIlllIlllIIlllI(IIIllllIIIllI(IlIIIIllIllIll,IIIllIllIllllIIIlll,IIIllIllIllllIIIlll),209);IIIllIllIllllIIIlll=IIIllIllIllllIIIlll+1;return IlllIIlllllIlIIIlllII;end;local function IlIIlIlIIlIIIIllll()local IlllIIlllllIlIIIlllII,lIlllIlIllIllIIIIIllII=IIIllllIIIllI(IlIIIIllIllIll,IIIllIllIllllIIIlll,IIIllIllIllllIIIlll+2);IlllIIlllllIlIIIlllII=IlIlIIIIllIlllIlllIIlllI(IlllIIlllllIlIIIlllII,209)lIlllIlIllIllIIIIIllII=IlIlIIIIllIlllIlllIIlllI(lIlllIlIllIllIIIIIllII,209)IIIllIllIllllIIIlll=IIIllIllIllllIIIlll+2;return(lIlllIlIllIllIIIIIllII*256)+IlllIIlllllIlIIIlllII;end;local function IllllIlI()local IIIllIllIllllIIIlll=IlllIIlllllIlIIIlllII();local IlllIIlllllIlIIIlllII=IlllIIlllllIlIIIlllII();local IlIIlIlIIlIIIIllll=1;local IlIlIIIIllIlllIlllIIlllI=(lIlllIlIllIllIIIIIllII(IlllIIlllllIlIIIlllII,1,20)*(2^32))+IIIllIllIllllIIIlll;local IIIllIllIllllIIIlll=lIlllIlIllIllIIIIIllII(IlllIIlllllIlIIIlllII,21,31);local IlllIIlllllIlIIIlllII=((-1)^lIlllIlIllIllIIIIIllII(IlllIIlllllIlIIIlllII,32));if(IIIllIllIllllIIIlll==0)then if(IlIlIIIIllIlllIlllIIlllI==0)then return IlllIIlllllIlIIIlllII*0;else IIIllIllIllllIIIlll=1;IlIIlIlIIlIIIIllll=0;end;elseif(IIIllIllIllllIIIlll==2047)then return(IlIlIIIIllIlllIlllIIlllI==0)and(IlllIIlllllIlIIIlllII*(1/0))or(IlllIIlllllIlIIIlllII*(0/0));end;return lllIIlIlllllIllIIIIIII(IlllIIlllllIlIIIlllII,IIIllIllIllllIIIlll-1023)*(IlIIlIlIIlIIIIllll+(IlIlIIIIllIlllIlllIIlllI/(2^52)));end;local lllIIlIlllllIllIIIIIII=IlllIIlllllIlIIIlllII;local function lIIllIIlllIllIIll(IlllIIlllllIlIIIlllII)local lIlllIlIllIllIIIIIllII;if(not IlllIIlllllIlIIIlllII)then IlllIIlllllIlIIIlllII=lllIIlIlllllIllIIIIIII();if(IlllIIlllllIlIIIlllII==0)then return'';end;end;lIlllIlIllIllIIIIIllII=IllllIlIl(IlIIIIllIllIll,IIIllIllIllllIIIlll,IIIllIllIllllIIIlll+IlllIIlllllIlIIIlllII-1);IIIllIllIllllIIIlll=IIIllIllIllllIIIlll+IlllIIlllllIlIIIlllII;local IlllIIlllllIlIIIlllII={}for IIIllIllIllllIIIlll=1,#lIlllIlIllIllIIIIIllII do IlllIIlllllIlIIIlllII[IIIllIllIllllIIIlll]=lIlIIllIlIIIIlIIl(IlIlIIIIllIlllIlllIIlllI(IIIllllIIIllI(IllllIlIl(lIlllIlIllIllIIIIIllII,IIIllIllIllllIIIlll,IIIllIllIllllIIIlll)),209))end return llIIlIlIIIllI(IlllIIlllllIlIIIlllII);end;local IIIllIllIllllIIIlll=IlllIIlllllIlIIIlllII;local function lIlIIllIlIIIIlIIl(...)return{...},llIlIIIl('#',...)end local function IllllIlIl()local IlIIIIllIllIll={};local IlIlIIIIllIlllIlllIIlllI={};local IIIllIllIllllIIIlll={};local lllIIlIlllllIllIIIIIII={[#{{457;159;752;950};{144;763;867;627};}]=IlIlIIIIllIlllIlllIIlllI,[#{{423;836;533;848};"1 + 1 = 111";"1 + 1 = 111";}]=nil,[#{"1 + 1 = 111";{612;741;483;192};{414;789;262;600};{661;3;380;485};}]=IIIllIllIllllIIIlll,[#{{92;245;741;260};}]=IlIIIIllIllIll,};local IIIllIllIllllIIIlll=IlllIIlllllIlIIIlllII()local IIIllllIIIllI={}for lIlllIlIllIllIIIIIllII=1,IIIllIllIllllIIIlll do local IlllIIlllllIlIIIlllII=lllIlIIlIlllIlIIIlll();local IIIllIllIllllIIIlll;if(IlllIIlllllIlIIIlllII==3)then IIIllIllIllllIIIlll=(lllIlIIlIlllIlIIIlll()~=0);elseif(IlllIIlllllIlIIIlllII==0)then IIIllIllIllllIIIlll=IllllIlI();elseif(IlllIIlllllIlIIIlllII==1)then IIIllIllIllllIIIlll=lIIllIIlllIllIIll();end;IIIllllIIIllI[lIlllIlIllIllIIIIIllII]=IIIllIllIllllIIIlll;end;lllIIlIlllllIllIIIIIII[3]=lllIlIIlIlllIlIIIlll();for IIIllIllIllllIIIlll=1,IlllIIlllllIlIIIlllII()do IlIlIIIIllIlllIlllIIlllI[IIIllIllIllllIIIlll-1]=IllllIlIl();end;for IllllIlIl=1,IlllIIlllllIlIIIlllII()do local IIIllIllIllllIIIlll=lllIlIIlIlllIlIIIlll();if(lIlllIlIllIllIIIIIllII(IIIllIllIllllIIIlll,1,1)==0)then local IlIlIIIIllIlllIlllIIlllI=lIlllIlIllIllIIIIIllII(IIIllIllIllllIIIlll,2,3);local lllIlIIlIlllIlIIIlll=lIlllIlIllIllIIIIIllII(IIIllIllIllllIIIlll,4,6);local IIIllIllIllllIIIlll={IlIIlIlIIlIIIIllll(),IlIIlIlIIlIIIIllll(),nil,nil};if(IlIlIIIIllIlllIlllIIlllI==0)then IIIllIllIllllIIIlll[#("ysn")]=IlIIlIlIIlIIIIllll();IIIllIllIllllIIIlll[#("sMBB")]=IlIIlIlIIlIIIIllll();elseif(IlIlIIIIllIlllIlllIIlllI==1)then IIIllIllIllllIIIlll[#("35p")]=IlllIIlllllIlIIIlllII();elseif(IlIlIIIIllIlllIlllIIlllI==2)then IIIllIllIllllIIIlll[#("syz")]=IlllIIlllllIlIIIlllII()-(2^16)elseif(IlIlIIIIllIlllIlllIIlllI==3)then IIIllIllIllllIIIlll[#("oBt")]=IlllIIlllllIlIIIlllII()-(2^16)IIIllIllIllllIIIlll[#("zEQu")]=IlIIlIlIIlIIIIllll();end;if(lIlllIlIllIllIIIIIllII(lllIlIIlIlllIlIIIlll,1,1)==1)then IIIllIllIllllIIIlll[#("4C")]=IIIllllIIIllI[IIIllIllIllllIIIlll[#("Dv")]]end if(lIlllIlIllIllIIIIIllII(lllIlIIlIlllIlIIIlll,2,2)==1)then IIIllIllIllllIIIlll[#("LyO")]=IIIllllIIIllI[IIIllIllIllllIIIlll[#{"1 + 1 = 111";{31;416;773;645};"1 + 1 = 111";}]]end if(lIlllIlIllIllIIIIIllII(lllIlIIlIlllIlIIIlll,3,3)==1)then IIIllIllIllllIIIlll[#("aJRl")]=IIIllllIIIllI[IIIllIllIllllIIIlll[#{"1 + 1 = 111";{373;613;240;126};"1 + 1 = 111";"1 + 1 = 111";}]]end IlIIIIllIllIll[IllllIlIl]=IIIllIllIllllIIIlll;end end;return lllIIlIlllllIllIIIIIII;end;local function lllIIlIlllllIllIIIIIII(IIIllIllIllllIIIlll,IlllIIlllllIlIIIlllII,IlIIlIlIIlIIIIllll)IIIllIllIllllIIIlll=(IIIllIllIllllIIIlll==true and IllllIlIl())or IIIllIllIllllIIIlll;return(function(...)local IlIIIIllIllIll=IIIllIllIllllIIIlll[1];local lIlllIlIllIllIIIIIllII=IIIllIllIllllIIIlll[3];local IIIllIllIllllIIIlll=IIIllIllIllllIIIlll[2];local IIIllIllIllllIIIlll=lIlIIllIlIIIIlIIl local IlIlIIIIllIlllIlllIIlllI=1;local IIIllIllIllllIIIlll=-1;local IllllIlIl={};local IIIllllIIIllI={...};local lllIlIIlIlllIlIIIlll=llIlIIIl('#',...)-1;local IIIllIllIllllIIIlll={};local IlllIIlllllIlIIIlllII={};for IIIllIllIllllIIIlll=0,lllIlIIlIlllIlIIIlll do if(IIIllIllIllllIIIlll>=lIlllIlIllIllIIIIIllII)then IllllIlIl[IIIllIllIllllIIIlll-lIlllIlIllIllIIIIIllII]=IIIllllIIIllI[IIIllIllIllllIIIlll+1];else IlllIIlllllIlIIIlllII[IIIllIllIllllIIIlll]=IIIllllIIIllI[IIIllIllIllllIIIlll+#{"1 + 1 = 111";}];end;end;local IIIllIllIllllIIIlll=lllIlIIlIlllIlIIIlll-lIlllIlIllIllIIIIIllII+1 local IIIllIllIllllIIIlll;local lIlllIlIllIllIIIIIllII;while true do IIIllIllIllllIIIlll=IlIIIIllIllIll[IlIlIIIIllIlllIlllIIlllI];lIlllIlIllIllIIIIIllII=IIIllIllIllllIIIlll[#("6")];if lIlllIlIllIllIIIIIllII<=#("FYC")then if lIlllIlIllIllIIIIIllII<=#("8")then if lIlllIlIllIllIIIIIllII==#{}then IlllIIlllllIlIIIlllII[IIIllIllIllllIIIlll[#("xu")]]=IlIIlIlIIlIIIIllll[IIIllIllIllllIIIlll[#("YH6")]];else local IIIllIllIllllIIIlll=IIIllIllIllllIIIlll[#("Ib")]IlllIIlllllIlIIIlllII[IIIllIllIllllIIIlll](IlllIIlllllIlIIIlllII[IIIllIllIllllIIIlll+1])end;elseif lIlllIlIllIllIIIIIllII>#("p3")then IlllIIlllllIlIIIlllII[IIIllIllIllllIIIlll[#("YT")]]=IIIllIllIllllIIIlll[#("9uI")];else do return end;end;elseif lIlllIlIllIllIIIIIllII<=#("s03QC")then if lIlllIlIllIllIIIIIllII>#("SpMv")then local IIIllIllIllllIIIlll=IIIllIllIllllIIIlll[#("Tg")]IlllIIlllllIlIIIlllII[IIIllIllIllllIIIlll](IlllIIlllllIlIIIlllII[IIIllIllIllllIIIlll+1])else do return end;end;elseif lIlllIlIllIllIIIIIllII==#("lLdqd0")then IlllIIlllllIlIIIlllII[IIIllIllIllllIIIlll[#("gL")]]=IIIllIllIllllIIIlll[#("mqe")];else IlllIIlllllIlIIIlllII[IIIllIllIllllIIIlll[#("vp")]]=IlIIlIlIIlIIIIllll[IIIllIllIllllIIIlll[#{"1 + 1 = 111";{380;57;690;113};"1 + 1 = 111";}]];end;IlIlIIIIllIlllIlllIIlllI=IlIlIIIIllIlllIlllIIlllI+1;end;end);end;return lllIIlIlllllIllIIIIIII(true,{},IIIlIIIIIlIlIIlIIIIllII())();end)(string.byte,table.insert,setmetatable);