; feel free to modify the score graphics - just keep each digit 8 high
; and keep the conditional compilation stuff intact
 ifconst ROM2k
   ORG $F7AC
 else
   ifconst bankswitch
     if bankswitch == 8
       ORG $2F94-bscode_length
       RORG $FF94-bscode_length
     endif
     if bankswitch == 16
       ORG $4F94-bscode_length
       RORG $FF94-bscode_length
     endif
     if bankswitch == 32
       ORG $8F94-bscode_length
       RORG $FF94-bscode_length
     endif
   else
     ORG $FF9C
   endif
 endif


scoretable
	.byte %01111110
	.byte %01000010
	.byte %01000010
	.byte %01000010
	.byte %01000010
	.byte %01000010
	.byte %01000010
	.byte %01111110

	.byte %01111110
	.byte %00001000
	.byte %00001000
	.byte %00001000
	.byte %00001000
	.byte %00001000
	.byte %00001000
	.byte %00111000

	.byte %01111110
	.byte %01000000
	.byte %01000000
	.byte %01000000
	.byte %01111110
	.byte %00000010
	.byte %00000010
	.byte %01111110

	.byte %01111110
	.byte %00000010
	.byte %00000010
	.byte %00000010
	.byte %01111110
	.byte %00000010
	.byte %00000010
	.byte %01111110

	.byte %00000010
	.byte %00000010
	.byte %00000010
	.byte %00000010
	.byte %01111110
	.byte %01000010
	.byte %01000010
	.byte %01000010

	.byte %01111110
	.byte %00000010
	.byte %00000010
	.byte %00000010
	.byte %01111110
	.byte %01000000
	.byte %01000000
	.byte %01111110

	.byte %01111110
	.byte %01000010
	.byte %01000010
	.byte %01000010
	.byte %01111110
	.byte %01000000
	.byte %01000000
	.byte %01111110

	.byte %00000010
	.byte %00000010
	.byte %00000010
	.byte %00000010
	.byte %00000010
	.byte %00000010
	.byte %00000010
	.byte %00111110

	.byte %01111110
	.byte %01000010
	.byte %01000010
	.byte %01000010
	.byte %01111110
	.byte %01000010
	.byte %01000010
	.byte %01111110

	.byte %00000010
	.byte %00000010
	.byte %00000010
	.byte %00000010
	.byte %01111110
	.byte %01000010
	.byte %01000010
	.byte %01111110




 ifconst ROM2k
   ORG $F7FC
 else
   ifconst bankswitch
     if bankswitch == 8
       ORG $2FF4-bscode_length
       RORG $FFF4-bscode_length
     endif
     if bankswitch == 16
       ORG $4FF4-bscode_length
       RORG $FFF4-bscode_length
     endif
     if bankswitch == 32
       ORG $8FF4-bscode_length
       RORG $FFF4-bscode_length
     endif
   else
     ORG $FFFC
   endif
 endif
