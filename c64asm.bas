100 clr:a=1:b=8:y=1:dim b$(100)
110 pc=a+b*256:gosub 700:if f=1 then goto 220
120 gosub 730
130 sa=pc:gosub 830:e=peek(pc)
140 if a$="" and (e=0 or e=172 or e=59) then goto 110
150 if a$="" then goto 4690
160 gosub 870:if in<>0 then goto 110
170 pc=sa:gosub 790
180 gosub 970:if g=0 then goto 110
190 d$=a$:gosub 1600
200 a$=d$:gosub 1010
210 goto 110
220 a=1:b=8:y=2:pd=-1
230 pc=a+b*256:gosub 700:if f=1 then goto 300
240 gosub 730:gosub 830:e=peek(pc)
250 if a$<>"" or e<>172 then goto 230
260 pc=pc+1:gosub 970:if g=0 then goto 4690
270 if pd>0 then er=7:goto 4690
280 gosub 1600:pd=k
290 goto 230
300 if pd<0 then er=8:goto 4690
310 a=1:b=8:y=3:pa=pd
320 pc=a+b*256:gosub 700:if f=1 then goto 460
330 gosub 730
340 sa=pc:gosub 830:e=peek(pc)
350 if a$="" and (e=0 or e=172 or e=59) then goto 320
360 gosub 870:if in<>0 then goto 420
370 pc=sa:gosub 790
380 gosub 970:if g=1 then goto 320
390 k=pa:gosub 1010
400 gosub 830:gosub 870
410 if in=0 then goto 4690
420 gosub 1850:gosub 1400:pa=pa+r
430 gosub 770:e=peek(pc)
440 if e<>0 and e<>59 then goto 4690
450 goto 320
460 a=1:b=8:y=4:pa=pd
470 pc=a+b*256:gosub 700:if f=1 then goto 680
480 gosub 730
490 sa=pc:gosub 830:e=peek(pc)
500 if a$="" and (e=0 or e=172 or e=59) then goto 470
510 gosub 870:if in<>0 then goto 540
520 pc=sa:gosub 790:gosub 970:if g=1 then goto 470
530 gosub 830:gosub 870:if in=0 then goto 4690
540 gosub 1850
550 on in goS 2650,2700,2750,2790,2820,2850,2880,2920,2950,2980,3010,3040,3070
560 in=in-13:if in<1 then goto 640
570 on in goS 3100,3130,3160,3190,3220,3270,3320,3370,3410,3440,3470,3520,3560
580 in=in-13:if in<1 then goto 640
590 on in goS 3590,3620,3670,3700,3750,3810,3860,3900,3930,3980,4010,4040,4070
600 in=in-13:if in<1 then goto 640
610 on in goS 4100,4140,4180,4210,4240,4290,4320,4350,4380,4430,4470,4510,4540
620 in=in-13:if in<1 then goto 640
630 on in gosub 4570,4600,4630,4660
640 poke pa,mn
650 if r=2 then poke pa+1,k
660 if r=3 then poke pa+1,k-int(k/256)*256:poke pa+2,int(k/256)
670 pa=pa+r:goto 470
680 print "end of assembly phase"
690 end
700 f=0
710 if peek(pc)=0 then if peek(pc+1)=0 then f=1
720 return
730 a=peek(pc):b=peek(pc+1)
740 c=peek(pc+2):d=peek(pc+3)
750 pc=pc+4
760 return
770 if peek(pc)=32 then pc=pc+1:goto 770
780 return
790 gosub 770:a$="":x=fre(0)
800 e=peek(pc)
810 if (e>47 and e<58) or (e>64 and e<91) then a$=a$+chr$(e):pc=pc+1:goto 800
820 return
830 gosub 770:a$=""
840 e=peek(pc)
850 if e>64 and e<91 then a$=a$+chr$(e):pc=pc+1:goto 840
860 return
870 restore
880 in=0
890 for i=1 to 56
900 read c$:if a$=c$ then in=i:i=57
910 next i
920 data adc,ad,asl,bcc,bcs,beq,bit,bmi,bne,bpl,brk,bvc,bvs,clc,cld,cli,clv
930 data cmp,cpx,cpy,dec,dex,dey,er,inc,inx,iny,jmp,jsr,lda,ldx,ldy,lsr,nop
940 data oa,pha,php,pla,plp,rol,rr,rti,rts,sbc,sec,sed,sei,sta,stx,sty,tax
950 data tay,tsx,txa,txs,tya,rien
960 return
970 gosub 770
980 g=0
990 if peek(pc)=178 then g=1:pc=pc+1
1000 return
1010 if p=0 then goto 1040
1020 w=k:gosub 1090:if k<>-1 then er=9:goto 4690
1030 k=w
1040 p=p+1:if p>100 then er=2:goto 4690
1050 b$(p)=left$(a$,6):if len(a$)>5 then goto 1070
1060 for i=1 to 6-len(a$):b$(p)=b$(p)+" ":next i
1070 b$(p)=b$(p)+chr$(k-int(k/256)*256)+chr$(int(k/256))
1080 return
1090 for i=1 to p
1100 if len(a$)<6 then for v=1 to 6-len(a$):a$=a$+" ":next v
1110 if leF(a$,6)=leF(b$(i),6) tH k=aS(mI(b$(i),7,1))+aS(mI(b$(i),8,1))*256
1120 if left$(a$,6)=left$(b$(i),6) then i=p+1:next i:goto 1150
1130 next i
1140 k=-1
1150 return
1160 gosub 770:e=peek(pc)
1170 if e=88 and k<256 then m1=4:goto 1220
1180 if e=88 and k>255 then m1=5:goto 1220
1190 if e=89 and k<256 then m1=6:goto 1220
1200 if e=89 and k>255 then m1=7:goto 1220
1210 goto 4690
1220 return
1230 gosub 770:e=peek(pc)
1240 if e=44 then goto 1270
1250 if e=41 then goto 1320
1260 goto 4690
1270 pc=pc+1:gosub 770:e=peek(pc)
1280 if e<>88 then goto 4690
1290 pc=pc+1:gosub 770:e=peek(pc)
1300 if e<>41 then goto 4690
1310 m1=8:goto 1380
1320 pc=pc+1:gosub 770:e=peek(pc)
1330 if e=0 or e=59 then m1=11:pc=pc-1:goto 1390
1340 if e<>44 then goto 4690
1350 pc=pc+1:gosub 770:e=peek(pc)
1360 if e<>89 then goto 4690
1370 m1=9
1380 if k>255 then er=6:goto 4690
1390 return
1400 if m1=0 then pb=9:r=1
1410 if m1=1 then pb=9:r=2
1420 if m1=2 then pb=5:r=2
1430 if m1=3 then pb=13:r=3
1440 if m1=4 then ph=ph+1:pb=5:r=2 
1450 if m1=5 then ph=ph+1:pb=13:r=3
1460 if m1=6 then ph=ph+1:pb=5:r=2
1470 if m1=7 then ph=ph+1:pb=9:r=3
1480 if m1=8 then pb=1:r=2
1490 if m1=9 then ph=ph+1:pb=1:r=2
1500 if m1=10 then pb=9:r=1
1510 if m1=11 then ph=ph+2:pb=13:r=3
1520 return
1530 if m1<>2 and m1<>3 then er=3:goto 4690
1540 if k-pa-1>0 then if k-pa>128 then er=4:goto 4690
1550 if k-pa-1<0 then if pa-k>127 then er=4:goto 4690
1560 if k-pa-1=>0 then k=k-pa-2:goto 1580
1570 if k-pa-1<0 then k=254+k-pa
1580 r=2
1590 return
1600 gosub 770:e=peek(pc)
1610 if e=36 then pc=pc+1:gosub 790:gosub 2400:goto 1760
1620 if e=37 then pc=pc+1:gosub 790:gosub 2530:goto 1760
1630 if (e>47 and e<58) then gosub 790:goto 1710
1640 if (e<65 or e>90) then goto 4690
1650 gosub 790:if a$="a" then er=5:goto 4690
1660 gosub 1090:if k>-1 then goto 1760
1670 if k<0 and y<>3 then er=1:goto 4690
1680 k=255
1690 if peek(pc)=0 or peek(pc)=59 then goto 1840
1700 pc=pc+1:goto 1690
1710 for i=1 to len(a$)
1720 h=asc(mid$(a$,i,1))
1730 if (h>47 and h<58) then goto 1750
1740 i=len(a$)+1:next i:goto 4690
1750 next i:k=val(a$)
1760 if l=1 then k=m+k:l=0
1770 if l=2 then k=m-k:l=0
1780 gosub 770:e=peek(pc)
1790 if e=0 or e=59 then goto 1830
1800 if e=170 then m=k:l=1:pc=pc+1:goto 1600
1810 if e=171 then m=k:l=2:pc=pc+1:goto 1600
1820 goto 4690
1830 if k<0 or k>65535 then er=6:goto 4690
1840 return
1850 m1=0:m2=0:k=-1
1860 gosub 770:e=peek(pc)
1870 if e=0 or e=59 then goto 2130
1880 if e=36 or e=37 or (e>47 and e<91) or (e>65 and e<91) then goto 1920
1890 if e=35 then goto 1970
1900 if e=40 then goto 2080
1910 goto 4690
1920 m1=3:gosub 2140
1930 if k<256 or ((in>3 and in<14) and in<>7) then m1=2
1940 if e=0 or e=59 then goto 2100
1950 if e=44 then pc=pc+1:gosub 1160:pc=pc+1:goto 2100
1960 goto 4690
1970 m1=1:pc=pc+1:gosub 770:e=peek(pc)
1980 if e<>34 then goto 2020
1990 k=peek(pc+1)
2000 pc=pc+1:if peek(pc)<>0 and peek(pc)<>59 then goto 2000
2010 goto 2130
2020 if e=179 then m2=1:pc=pc+1
2030 if e=177 then m2=2:pc=pc+1
2040 gosub 1600
2050 if m2=1 then k=k-int(k/256)*256
2060 if m2=2 then k=int(k/256)
2070 goto 2100
2080 pc=pc+1:gosub 2140
2090 gosub 1230:pc=pc+1
2100 gosub 770:e=peek(pc)
2110 if (e<>0 and e<>59) then goto 4690
2120 if k<0 or k>65535 then er=6:goto 4690
2130 return
2140 gosub 770:e=peek(pc)
2150 if e=36 then pc=pc+1:gosub 790:gosub 2400:goto 2340
2160 if e=37 then pc=pc+1:gosub 790:gosub 2530:goto 2340
2170 if e>47 and e<58 then gosub 790:goto 2290
2180 if e<65 and e>90 then got 4690
2190 gosub 790:if a$="a" and k=-1 then k=256:m1=10:goto 2390
2200 if a$="a" then er=5:goto 4690
2210 gosub 1090:if k>-1 then goto 2340
2220 if k<0 and y<>3 then er=1:goto 4690
2230 if m1=3 then k=256:e=0:goto 2390
2240 if peek(pc)=41 or peek(pc)=44 then goto 2270
2250 if peek(pc)=0 or peek(pc)=59 then goto 4690
2260 pc=pc+1:goto 2240
2270 sb=pc:gosub 1230:if m1=11 then k=256:pc=sb:goto 2390
2280 er=6:goto 4690
2290 for i=1 to len(a$)
2300 h=asc(mid$(a$,i,1))
2310 if h>47 or h<58 then goto 2330
2320 i=len(a$)+1:next i:goto 4690
2330 next i:k=val(a$)
2340 if l=1 then k=m+k:l=0
2350 if l=2 then k=m-k:l=0
2360 gosub 770:e=peek(pc)
2370 if e=170 then m=k:l=1:pc=pc+1:goto 2140
2380 if e=171 then m=k:l=2:pc=pc+1:goto 2140
2390 return
2400 if a$="" then goto 4690
2410 if len(a$)>4 then er=6:goto 4690
2420 for i=1 to len(a$)
2430 h=asc(mid$(a$,i,1))
2440 if (h>47 and h<58) or (h>64 and h<71) then goto 2460
2450 i=len(a$)+1:next i:goto 4690
2460 next i
2470 k=0
2480 for i=1 to len(a$)
2490 u=asc(mid$(a$,i,1))-48
2500 if u>9 then u=u-7
2510 k=16*k+u:next i
2520 return
2530 if a$="" then goto 4690
2540 if len(a$)>32 then er=6:goto 4690
2550 for i=1 to len(a$)
2560 h=asc(mid$(a$,i,1))
2570 if h=48 or h=49 then goto 2590
2580 i=len(a$)+1:next i:goto 4690
2590 next i
2600 k=0
2610 for i=1 to len(a$)
2620 u=val(mid$(a$,i,1))*2^(len(a$)-i)
2630 k=k+u:next i
2640 return
2650 if m1=6 then m1=7
2660 if m1=0 or m1=10 or m1=11 then er=3:goto 4690
2670 ph=6:gosub 1400
2680 mn=pb+ph*16
2690 return
2700 if m1=6 then m1=7
2710 if m1=0 or m1=10 or m1=11 then er=3:goto 4690
2720 ph=2:gosub 1400
2730 mn=pb+ph*16
2740 return
2750 if m1=1 or m1=6 or m1=7 or m1=8 or m1=9 or m1=11 then er=3:goto 4690
2760 ph=0:gosub 1400
2770 mn=pb+1+ph*16
2780 return
2790 gosub 1530
2800 mn=144
2810 return
2820 gosub 1530
2830 mn=176
2840 return
2850 gosub 1530
2860 mn=240
2870 return
2880 if m1<>2 and m1<>3 then er=3:goto 4690
2890 ph=2:gosub 1400
2900 mn=pb-1+ph*16
2910 return
2920 gosub 1530
2930 mn=48
2940 return
2950 gosub 1530
2960 mn=208
2970 return
2980 gosub 1530
2990 mn=16
3000 return
3010 if m1<>0 then er=3:goto 4690
3020 mn=0:r=1
3030 return
3040 gosub 1530
3050 mn=80
3060 return
3070 gosub 1530
3080 mn=112
3090 return
3100 if m1<>0 then er=3:goto 4690
3110 mn=24:r=1
3120 return
3130 if m1<>0 then er=3:goto 4690
3140 mn=216:r=1
3150 return
3160 if m1<>0 then er=3:goto 4690
3170 mn=88:r=1
3180 return
3190 if m1<>0 then er=3:goto 4690
3200 mn=184:r=1
3210 return
3220 if m1=6 then m1=7
3230 if m1=0 or m1=10 or m1=11 then er=3:goto 4690
3240 ph=12:gosub 1400
3250 mn=pb+ph*16
3260 return
3270 if m1<>1 and m1<>2 and m1<>3 then er=3:goto 4690
3280 if m1=1 then mn=224:r=2:goto 3310
3290 ph=14:gosub 1400
3300 mn=pb-1+ph*16
3310 return
3320 if m1<>1 and m1<>2 and m1<>3 then er=3:goto 4690
3330 if m1=1 then mn=192:r=2:goto 3360
3340 ph=12:gosub 1400
3350 mn=pb-1+ph*16
3360 return
3370 if m1<>2 and m1<>3 and m1<>4 and m1<>5 then er=3:goto 4690
3380 ph=12:gosub 1400
3390 mn=pb+1+ph*16
3400 return
3410 if m1<>0 then er=3:goto 4690
3420 mn=202:r=1
3430 return
3440 if m1<>0 then er=3:goto 4690
3450 mn=136:r=1
3460 return
3470 if m1=6 then m1=7
3480 if m1=0 or m1=10 or m1=11 then er=3:goto 4690
3490 ph=4:gosub 1400
3500 mn=pb+ph*16
3510 return
3520 if m1<>2 and m1<>3 and m1<>4 and m1<>5 then er=3:goto 4690
3530 ph=14:gosub 1400
3540 mn=pb+1+ph*16
3550 return
3560 if m1<>0 then er=3:goto 4690
3570 mn=232:r=1
3580 return
3590 if m1<>0 then er=3:goto 4690
3600 mn=200:r=1
3610 return
3620 if m1=2 then m1=3
3630 if m1<>3 and m1<>11 then er=3:goto 4690
3640 ph=4:gosub 1400
3650 mn=pb-1+ph*16
3660 return
3670 if m1<>2 and m1<>3 then er=3:goto 4690
3680 mn=32:r=3
3690 return
3700 if m1=6 then m1=7
3710 if m1=0 or m1=10 or m1=11 then er=3:goto 4690
3720 ph=10:gosub 1400
3730 mn=pb+ph*16
3740 return
3750 if m1<>1 and m1<>2 and m1<>3 and m1<>6 and m1<>7 then er=3:goto 4690
3760 if m1=1 then mn=162:r=2:goto 3800
3770 if m1=7 then mn=190:r=3:goto 3800
3780 ph=10:gosub 1400
3790 mn=pb+1+ph*16
3800 return
3810 if m1<>1 and m1<>2 and m1<>3 and m1<>4 and m1<>5 then er=3:goto 4690
3820 if m1=1 then mn=160:r=2:goto 3850
3830 ph=10:gosub 1400
3840 mn=pb-1+ph*16
3850 return
3860 if m1=1 or m1=6 or m1=7 or m1=8 or m1=9 or m1=11 then er=3:goto 4690
3870 ph=4:gosub 1400
3880 mn=pb+1+ph*16
3890 return
3900 if m1<>0 then er=3:goto 4690
3910 mn=234:r=1
3920 return
3930 if m1=6 then m1=7
3940 if m1=0 or m1=10 or m1=11 then er=3:goto 4690
3950 ph=0:gosub 1400
3960 mn=pb+ph*16
3970 return
3980 if m1<>0 then er=3:goto 4690
3990 mn=72:r=1
4000 return
4010 if m1<>0 then er=3:goto 4690
4020 mn=8:r=1
4030 return
4040 if m1<>0 then er=3:goto 4690
4050 mn=104:r=1
4060 return
4070 if m1<>0 then er=3:goto 4690
4080 mn=40:r=1
4090 return
4100 if m1=1 or m1=6 or m1=7 or m1=8 or m1=9 or m1=11 then er=3:goto 4690
4110 ph=2:gosub 1400
4120 mn=pb+1+ph*16
4130 return
4140 if m1=1 or m1=6 or m1=7 or m1=8 or m1=9 or m1=11 then er=3:goto 4690
4150 ph=6:gosub 1400
4160 mn=pb+1+ph*16
4170 return
4180 if m1<>0 then er=3:goto 4690
4190 mn=64:r=1
4200 return
4210 if m1<>0 then er=3:goto 4690
4220 mn=96:r=1
4230 return
4240 if m1=6 then m1=7
4250 if m1=0 or m1=10 or m1=11 then er=3:goto 4690
4260 ph=14:gosub 1400
4270 mn=pb+ph*16
4280 return
4290 if m1<>0 then er=3:goto 4690
4300 mn=56:r=1
4310 return
4320 if m1<>0 then er=3:goto 4690
4330 mn=248:r=1
4340 return
4350 if m1<>0 then er=3:goto 4690
4360 mn=120:r=1
4370 return
4380 if m1=6 then m1=7
4390 if m1=0 or m1=1 or m1=10 or m1=11 then er=3:goto 4690
4400 ph=8:gosub 1400
4410 mn=pb+ph*16
4420 return
4430 if m1<>2 and m1<>3 and m1<>6 then er=3:goto 4690
4440 ph=8:gosub 1400
4450 mn=pb+1+ph*16
4460 return
4470 ph=8:gosub 1400
4480 if m1<>2 and m1<>3 and m1<>4 then er=3:goto 4690
4490 mn=pb-1+ph*16
4500 return
4510 if m1<>0 then er=3:goto 4690
4520 mn=170:r=1
4530 return
4540 if m1<>0 then er=3:goto 4690
4550 mn=168:r=1
4560 return
4570 if m1<>0 then er=3:goto 4690
4580 mn=186:r=1
4590 return
4600 if m1<>0 then er=3:goto 4690
4610 mn=138:r=1
4620 return
4630 if m1<>0 then er=3:goto 4690
4640 mn=154:r=1
4650 return
4660 if m1<>0 then er=3:goto 4690
4670 mn=152:r=1
4680 return
4690 if er=0 then print "syntax error";
4700 if er=1 then print "non declared variable";
4710 if er=2 then print "out of memory";
4720 if er=3 then print "illegal addressing mode";
4730 if er=4 then print "conditional branching too far";
4740 if er=5 then print "illegal variable";
4750 if er=6 then print "illegal numeric value";
4760 if er=7 then print "implementation address already known: error";
4770 if er=8 then print "implementation address not defined";:goto 4800
4780 if er=9 then print "variable already in use";
4790 print " line";c+d*256
4800 end
