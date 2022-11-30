    set kernel DPC+
    set tv ntsc
 goto _bank2 bank2


   vblank
   goto DrawStarField bank2


   bank 2
   temp1=temp1


_bank2

init
   dim _sc2 = score+1
   dim _sc3 = score+2

 score = 000000
 pfclear
   scorecolors:
   $3E
   $3E
   $3C
   $3C
   $3A
   $3A
   $38
   $38
end

/*
   pfcolors:
   $0E
   $0E
   $0C
   $0C
   $0A
   $0A
   $08
   $08
   $0E
   $0E
   $0C
   $0C
   $0A
   $0A
   $08
   $08
   $0E
   $0E
   $0C
   $0C
   $0A
   $0A
   $08
   $08
end

*/

/*
 playfield: 
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX ;10
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX ;20
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX ;30
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX ;40
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX ;50
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX ;60
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX ;70
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX ;80
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX ;88
end
*/

 const   PFCOLSLOW = #<(PFCOLS) 
 const   PFCOLSHI = #(>PFCOLS) & $0F

 const   BKCOLSLOW = #<(BKCOLS) 
 const   BKCOLSHI = #(>BKCOLS) & $0F

 for var0 = 0 to 87 step 1
  DF0LOW = BKCOLSLOW + var0
  DF0HI = BKCOLSHI
  DF0PUSH =  $00
 next
   ;***************************************************************
   ;
   ;  88 rows that are 2 scanlines high.
   ;
   DF6FRACINC = 255 : DF4FRACINC = 255
   DF0FRACINC = 128 : DF1FRACINC = 128 : DF2FRACINC = 128 : DF3FRACINC = 128
 asm
 LDA DF6FRACDATA ; bgcolor priming read (first value will be read twice)
 LDA DF4FRACDATA ; pfcolor priming read (first value will be read twice)
end

   ;***************************************************************
   ;
   ;  Displays the screen.
   ;
   drawscreen
 
 dim linePos1 = a.g : dim linePosArray = a
 a=0:g=0

 dim linePos2 = b.h
 b=0:h=0

 dim linePos3 = c.i
 c=0:i=0

 dim linePos4 = d.j
 d=0:j=0

 ;dim linepos5 = e.k
 ;e=0:k=0

 ;dim linepos6 = f.l
 ;f=0:l=0

 ;dim speedup = m.n
 ;speedup = 0.025

 dim timer = m
 timer = 0

 dim timerLength = e
 timerLength = 1

 dim nextRand = n
 nextRand = 0

 ;opqrst
 ;uvwxyz

  dim speedup1 = o.u
  dim speedup2 = p.v
  dim speedup3 = q.w
  dim speedup4 = r.x
  ;dim speedup5 = s.y
  ;dim speedup6 = t.z
  speedup1 = 0.0
  speedup2 = 0.0
  speedup3 = 0.0
  speedup4 = 0.0
  ;speedup5 = 0.0
  ;speedup6 = 0.0

  
 def rightBit=var0{0}
 def leftBit=var0{1}
 def flipBit=var0{2}
 def resetRestrainer=var0{3}
 def gameOverBit=var0{4}
 def overlapped=var0{5}
 var0 = 0


  dim hole1x = var1
  dim hole2x = var2
  dim hole3x = var3
  dim hole4x = var4

 ;dim temp88 = var1.var2
 ;dim temp88_2 = var3.var4

   ;***************************************************************
   ;
   ;  88 rows that are 2 scanlines high.
   ;
   DF6FRACINC = 255 : DF4FRACINC = 255
   DF0FRACINC = 128 : DF1FRACINC = 128 : DF2FRACINC = 128 : DF3FRACINC = 128
 asm
 ;LDA DF6FRACDATA ; bgcolor priming read (first value will be read twice)
 ;LDA DF4FRACDATA ; pfcolor priming read (first value will be read twice)
end

   ;***************************************************************
   ;
   ;  Displays the screen.
   ;
   drawscreen

   missile0height = 80
   missile0x = 79 ;80
   COLUM0 = $08
   ;NUSIZ0 = $02

   missile1height = 4
   ;COLUM1 = $0e
   dim m1x = missile1x.f
   m1x = 80.0
   ;missile1x = 80
   missile1y = 149

   NUSIZ2 = $03 
  _NUSIZ1 = $10 : NUSIZ3 = $10 : NUSIZ4 = $10 : NUSIZ5 = $10 : NUSIZ6 = $10 : NUSIZ7 = $10 : NUSIZ8 = $10 : NUSIZ9 = $10 






  DF0LOW = PFCOLSLOW + 87 ; line row
  DF0HI = PFCOLSHI
  DF0PUSH = $0e ; color blue

 ; DF0LOW = BKCOLSLOW + 88 ; line row
 ; DF0HI = BKCOLSHI
 ; DF0PUSH = $04 ; color blue

;PYRAMID

   player0:
   %00000000
   %00010000
   %00111000
   %01111100
   %11101110
end
/*
   player0color:
   $80
   $80
   $80
   $80
   $80
   $80
end
*/
   player0color:
   $82
   $84
   $86
   $88
   $8a
   $8c
end

 player0y = 83
 player0x = 101


;PYRAMID

/*
   player2color:
   $82
   $82
   $82
   $82
   $82
   $82
   $82
   $82
end
*/
   player2color:
   $84
   $84
   $84
   $86
   $86
   $8a
   $8a
   $8c
end

 player2y = 80






 nextRand = (rand&31)

 for var1 = 0 to 59
 gosub reUsed
 next 

 ;countdown init
   player1color:
   $0e
   $0e
   $0e
   $0e
   $0e
   $0e
   $0e
   $0e
end
 player1y = 120
 player1x = 76
 player1height = 8
 dim displayNumber = var3 : var3 = 3
 var1 = 0 : var2 = 0

 ballx = 90
 bally = 0
 ballheight = 0
 CTRLPF = 11

countdownLoop
  for temp5 = 1 to 40 step 1
  DF0LOW = PFCOLSLOW + temp5
  DF0HI = PFCOLSHI
  DF0PUSH =  $0e
 next

 if displayNumber = 2 then ballx = ballx - 2 : bally = bally + 2 : ballheight = 2
 if bally > 80 then ballheight = 0

   temp5 = displayNumber * 8
 asm
	lda #<(playerpointers+0)
	sta DF0LOW
	lda #(>(playerpointers+0)) & $0F
	sta DF0HI

   clc
	LDA #<_scoretable2
   adc temp5
	STA DF0WRITE
	LDA #((>_scoretable2) & $0f) | (((>_scoretable2) / 2) & $70)
   STA DF0WRITE
end
 gosub reUsed
 var1 = var1 + 1
 if var1 = 60 then var1 = 0 : displayNumber = displayNumber - 1
 if displayNumber <> 0 then goto countdownLoop

   for temp5 = 0 to 31
   pfpixel temp5 87 on
   next

 ; orion init
  for temp5 = 0 to 40 step 1
  DF0LOW = PFCOLSLOW + temp5
  DF0HI = PFCOLSHI
  DF0PUSH =  $00
 next
 var1 = 0 : var2 = 0
;HOLE middle size
   player1:
   %111111
   %111111
   %111111
   %111111
   %111111
end
   player1color:
   $00
   $00
   $00
   $00
   $00
end
 player1y = 135
 player1x = 100
introLoop

 var1 = var1 + 1
 if var1 = 8 then var1 = 0 : var2 = var2 + 1

   ballheight = 4
   bally = starY[var2]
   ballx = starX[var2]
   CTRLPF = $01


   ;missile1height = 4
   ;COLUM1 = $0e
   ;missile1x = 80
   ;missile1y = 14



 temp5 = starColor[var1]
 DF0LOW = PFCOLSLOW + 34 ; blinking orions belt
 DF0HI = PFCOLSHI
 DF0PUSH = temp5 ; color white
 DF0PUSH = temp5 ; color white
 DF0PUSH = temp5 ; color white
 DF0PUSH = temp5 ; color white

 gosub reUsed


 ;goto introLoop
 if var2 <> 4 then goto introLoop


   ballheight = 6
   ;bally = 0
   ballx = 80
   CTRLPF = $31


   COLUM1 = $0e
_main


 if joy0right && !leftBit then rightBit = 1
 if joy0left && !rightBit then leftBit = 1

 if joy0fire then rightBit = 0 : leftBit = 0

 if !rightBit then skipRight
 m1x = m1x + 1.5
 if missile1x >= 158 then rightBit = 0 : missile1x = 158
skipRight

 if !leftBit then skipLeft
 m1x = m1x - 1.5
 if missile1x <= 2 then leftBit = 0 : missile1x = 2
skipLeft



 




 timer = timer + 1
 if timer <> timerLength  then goto skipNewLine ;||  ;38 fastest
 timer = 0 ;reset timer

 for var5 = 0 to 3 step 1
    ;temp1 = a[var5]
    ;if temp1 <> 0 then notFreeNext ; look for free spot in array (y pos 0)
     if linePosArray[var5] <> 0 then notFreeNext ; look for free spot in array (y pos 0)
     linePosArray[var5] = 45 : hole1x[var5] = nextRand : temp5 = hole1x[var5] : goto found ;exit loop when found
notFreeNext
 next
 goto skipNewLine
found
 ;timerLength = 68
 nextRand = (rand&31)
 ;if temp5 < nextRand then if (nextRand - temp5) > 16 then timerLength = 88
 ;if nextRand < temp5 then if (temp5 - nextRand) > 16 then timerLength = 88


 if temp5 <= nextRand then temp2 = (nextRand - temp5) : timerLength = timerLengthTable[temp2]
 if nextRand < temp5 then temp2 = (temp5 - nextRand) : timerLength = timerLengthTable[temp2]
skipNewLine






 if linePos1 = 0 then goto skipLine1
 DF0LOW = BKCOLSLOW + linePos1
 DF0HI = BKCOLSHI
 DF0PUSH =  $00 ;color line black, incase line moves this frame
 if linePos1 > 67 then DF0PUSH =  $00 ;two lines if this far down
 pfpixel hole1x linePos1 off ;turn off pfpixel hole, incase line moves this frame

 linePos1 = linePos1 + speedup1 ;move line
 speedup1 = speedup1 + 0.00390625 ;speed up for 3d effect
 if linePos1 >= 87 then linePos1 = 0.0 : speedup1 = 0.0 : bally = 0 ;line off screen, reset

 if linePos1 > 54 && linePos1 <= 67 then player1y = (linePos1 - 1) * 2 : player1x = (hole1x * 4) + 13 else pfpixel hole1x linePos1 on
 ;p1 is middle size hole, no need to move small hole (pfpixel) any longer
  
 DF0LOW = BKCOLSLOW + linePos1
 DF0HI = BKCOLSHI
 temp5 = linePos1 - 44 ;index for line color table
 DF0PUSH = _color[temp5] ;color blue
 if linePos1 > 67 then DF0PUSH =  _color[temp5] : ballx = (hole1x * 4) + 15 : bally = (linePos1 - 2) * 2 ;two lines and big hole (ball) if this far down
 ;pfpixel hole1x linePos1 on
skipLine1




 if linePos2 = 0 then goto skipLine2
 DF0LOW = BKCOLSLOW + linePos2
 DF0HI = BKCOLSHI
 DF0PUSH =  $00
 if linePos2 > 67 then DF0PUSH =  $00
 pfpixel hole2x linePos2 off

 linePos2 = linePos2 + speedup2
 speedup2 = speedup2 + 0.00390625
 if linePos2 >= 87 then linePos2 = 0.0 : speedup2 = 0.0 : bally = 0

 if linePos2 > 54 && linePos2 <= 67 then player1y = (linePos2 - 1) * 2 : player1x = (hole2x * 4) + 13 else pfpixel hole2x linePos2 on
  
 DF0LOW = BKCOLSLOW + linePos2
 DF0HI = BKCOLSHI
 temp5 = linePos2 - 44
 DF0PUSH = _color[temp5]
 if linePos2 > 67 then DF0PUSH =  _color[temp5] : ballx = (hole2x * 4) + 15 : bally = (linePos2 - 2) * 2
 ;pfpixel hole2x linePos2 on
skipLine2



 
 if linePos3 = 0 then goto skipLine3
 DF0LOW = BKCOLSLOW + linePos3
 DF0HI = BKCOLSHI
 DF0PUSH =  $00
 if linePos3 > 67 then DF0PUSH =  $00
 pfpixel hole3x linePos3 off

 linePos3 = linePos3 + speedup3
 speedup3 = speedup3 + 0.00390625
 if linePos3 >= 87 then linePos3 = 0.0 : speedup3 = 0.0

 if linePos3 > 54 && linePos3 <= 67 then player1y = (linePos3 - 1) * 2 : player1x = (hole3x * 4) + 13 else pfpixel hole3x linePos3 on
  
 DF0LOW = BKCOLSLOW + linePos3
 DF0HI = BKCOLSHI
 temp5 = linePos3 - 44
 DF0PUSH = _color[temp5]
 if linePos3 > 67 then DF0PUSH =  _color[temp5]: ballx = (hole3x * 4) + 15 : bally = (linePos3 - 2) * 2
 ;pfpixel hole3x linePos3 on
skipLine3




 if linePos4 = 0 then goto skipLine4
 DF0LOW = BKCOLSLOW + linePos4
 DF0HI = BKCOLSHI
 DF0PUSH =  $00
 if linePos4 > 67 then DF0PUSH =  $00
 pfpixel hole4x linePos4 off

 linePos4 = linePos4 + speedup4
 speedup4 = speedup4 + 0.00390625
 if linePos4 >= 87 then linePos4 = 0.0 : speedup4 = 0.0

 if linePos4 > 54 && linePos4 <= 67 then player1y = (linePos4 - 1) * 2 : player1x = (hole4x * 4) + 13 else pfpixel hole4x linePos4 on
  
 DF0LOW = BKCOLSLOW + linePos4
 DF0HI = BKCOLSHI
 temp5 = linePos4 - 44
 DF0PUSH = _color[temp5]
 if linePos4 > 67 then DF0PUSH =  _color[temp5] : ballx = (hole4x * 4) + 15 : bally = (linePos4 - 2) * 2
 ;pfpixel hole4x linePos4 on
skipLine4




/*
 DF0LOW = BKCOLSLOW + 44 ; line row, blue horizon
 DF0HI = BKCOLSHI
 DF0PUSH = $80 ; color blue

 DF0LOW = BKCOLSLOW + 87 ; line row, white bottom line
 ;DF0HI = BKCOLSHI
 DF0PUSH = $0e ; color white

 ;DF0LOW = BKCOLSLOW + 1; line row, white bottom line
 ;DF0HI = BKCOLSHI
 ;DF0PUSH = $0e ; color white
*/

 ;line collision check
 for temp5 = 0 to 3 step 1
     temp1 = linePosArray[temp5]
     temp2 = temp1 * 2
     temp3 = 0
     if (missile1y + 4) >= temp2 && missile1y <= (temp2 + 2) then overlapped = 1 : goto collisionCheck else temp3 = 1
 next

 if overlapped && temp3 then score = score + 1 : overlapped = 0 ;if overlapped and no longer overlapping you passed
back


/*
   ; DISPLAYS ROWNUMBER IN THE SCORE 
   temp4 = z + 1

   _sc2 = _sc2 & 240 : _sc3 = 0
   if temp4 >= 50 then _sc3 = _sc3 + 80 : temp4 = temp4 - 50
   if temp4 >= 30 then _sc3 = _sc3 + 48 : temp4 = temp4 - 30
   if temp4 >= 20 then _sc3 = _sc3 + 32 : temp4 = temp4 - 20
   if temp4 >= 10 then _sc3 = _sc3 + 16 : temp4 = temp4 - 10
   _sc3 = _sc3 | temp4
*/

gameOverLoop

 gosub reUsed


 if switchreset then resetRestrainer = 1 else if resetRestrainer then goto init
 if gameOverBit then goto gameOverLoop

 goto _main





collisionCheck
 if missile1x < ballx || (missile1x + 2) > (ballx + 8) then gameOverBit = 1
 goto back

DrawStarField
 HMM0=$70
 ;HMBL=$70 ; Set up Missile 0 to move to draw the Starfield
           ; If you want the ball to move instead, use HMBL instead
           ; of HMM0.
 return otherbank

 data starX
 113, 128, 143, 0
end

 data starY
 66, 64, 62, 0
end

 data starColor
 $02, 
 $04, 
 $06, 
 $08,
 $0a,
 $08,
 $06,
 $04,
 $02
end

 data timerLengthTable
 38
 38
 48
 48
 48
 48
 48
 48
 48
 48
 48 ;
 68
 68
 68
 68
 68
 68
 68
 68
 68
 68
 68 ;
 88
 88
 88
 88
 88
 88
 88
 88
 98
 98
end

   data _color
   $80, $80, $80, $80, $80, $80
   $82, $82, $82, $82, $82, $82
   $84, $84, $84, $84, $84, $84
   $86, $86, $86, $86, $86, $86
   $88, $88, $88, $88, $88
   $8a, $8a, $8a, $8a, $8a
   $8c, $8c, $8c, $8c, $8c
   $8e, $8e, $8e, $8e, $8e
end
/*
   data _color
   $80, $80, $80, $80, $80, $80, $80, $80, $80
   $82, $82, $82, $82, $82, $82, $82, $82
   $84, $84, $84, $84, $84, $84, $84
   $86, $86, $86, $86, $86, $86
   $88, $88, $88, $88, $88
   $8a, $8a, $8a, $8a
   $8c, $8c, $8c
   $8e, $8e
end


   data _color
   $80, $80
   $82, $82, $82
   $84, $84, $84, $84
   $86, $86, $86, $86, $86
   $88, $88, $88, $88, $88, $88
   $8a, $8a, $8a, $8a, $8a, $8a, $8a
   $8c, $8c, $8c, $8c, $8c, $8c, $8c, $8c
   $8e, $8e, $8e, $8e, $8e, $8e, $8e, $8e, $8e
end
*/
reUsed
 DF0LOW = BKCOLSLOW + 44 ; line row, blue horizon
 DF0HI = BKCOLSHI
 DF0PUSH = $80 ; color blue

 DF0LOW = BKCOLSLOW + 87 ; line row, white bottom line
 ;DF0HI = BKCOLSHI
 DF0PUSH = $0e ; color white

 flipBit = !flipBit

 if flipBit then __1
   player2:
   %00000000
   %10000000
   %01000000
   %11100000
   %00010000
   %11111000
   %01000100
   %01111110
end
 player2x = 113
 goto __2

__1
   player2:
   %00000001
   %00000010
   %00000100
   %00001111
   %00010001
   %00111111
   %01000100
   %11111100
end
 player2x = 105
__2
 NUSIZ0 = $04
   ;***************************************************************
   ;
   ;  88 rows that are 2 scanlines high.
   ;
   DF6FRACINC = 255 : DF4FRACINC = 255
   DF0FRACINC = 128 : DF1FRACINC = 128 : DF2FRACINC = 128 : DF3FRACINC = 128
 asm
 ;LDA DF6FRACDATA ; bgcolor priming read (first value will be read twice)
 ;LDA DF4FRACDATA ; pfcolor priming read (first value will be read twice)

 ;LDA DF0FRACDATA
 ;LDA DF1FRACDATA
 ;LDA DF0FRACDATA
 ;LDA DF1FRACDATA
end

   ;***************************************************************
   ;
   ;  Displays the screen.
   ;
   drawscreen
   return thisbank

   bank 3
   temp1=temp1

   bank 4
   temp1=temp1

   bank 5
   temp1=temp1

   bank 6
   temp1=temp1

   bank 7
   temp1=temp1

 asm
 align 256
end
 data _scoretable2
	%01111110
	%01000010
	%01000010
	%01000010
	%01000010
	%01000010
	%01000010
	%01111110

	%00111000
	%00001000
	%00001000
	%00001000
	%00001000
	%00001000
	%00001000
	%01111110

	%01111110
	%00000010
	%00000010
	%01111110
	%01000000
	%01000000
	%01000000
	%01111110

	%01111110
	%00000010
	%00000010
	%01111110
	%00000010
	%00000010
	%00000010
	%01111110
end




