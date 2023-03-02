 ;╔════════════════════════════════════════════════════════════════════════════════════════════════╗ 
 ;║   Jacks or Better v1.35                                                                        ║
 ;║   by Steve Engelhardt, August 2022                                                             ║
 ;║   7800Basic Version used to compile: 7800basic v0.19 Dec 31 2021 20:34:07                      ║
 ;╚════════════════════════════════════════════════════════════════════════════════════════════════╝ 

 displaymode 320A
 set tv ntsc
 set basepath card_gfx
 set screenheight 224
 set zoneheight 8
 set romsize 48k

 dim menubarx=a                : dim menubary=b                  : dim menumoveup=c                   : dim menumovedown=d
 dim debounce=i                : dim menu=j                      : dim RandomSeed=k                   : dim RandomSeed2=l
 dim c1temp2nd=var1            : dim c1temp5th=var62             : dim c2temp5th=var63                : dim c3temp5th=var64
 dim c4temp5th=var65           : dim c5temp5th=var66             : dim card1_value=var80              : dim card2_value=var81
 dim card3_value=var82         : dim card4_value=var83           : dim card5_value=var84              : dim tempscorezLo=var90
 dim C1X=var91                 : dim C2X=var92                   : dim C3X=var93                      : dim C4X=var94
 dim C5X=var95                 : dim coinOption=var52            : dim suit=var54                     : dim value=var55
 dim flush=var56               : dim firstcardsuit=var57         : dim check510=var58                 : dim facepair=var59
 dim consecutive=var60         : dim c1value=var1                : dim c2value=var2                   : dim c3value=var3
 dim c4value=var4              : dim c5value=var5                : dim c1suit=var6                    : dim c2suit=var7
 dim c3suit=var8               : dim c4suit=var9                 : dim c5suit=var10                   : dim c1valuecheck=var11
 dim c2valuecheck=var12        : dim c3valuecheck=var13          : dim c4valuecheck=var14             : dim c5valuecheck=var15
 dim c1valuecheck2=var16       : dim c2valuecheck2=var17         : dim c3valuecheck2=var18            : dim c4valuecheck2=var19
 dim c5valuecheck2=var20       : dim check5=var21                : dim check10=var22                  : dim checkSuits=var23
 dim checkDoubles=var24        : dim checkDiff5=var25            : dim checkAce=var26                 : dim c1LastValue=var27
 dim c2LastValue=var28         : dim c3LastValue=var29           : dim c4LastValue=var30              : dim c5LastValue=var31
 dim c2temp2nd=var32           : dim c3temp2nd=var33             : dim c4temp2nd=var34                : dim c5temp2nd=var35
 dim c1temp3rd=var36           : dim c2temp3rd=var37             : dim c3temp3rd=var38                : dim c4temp3rd=var39
 dim c5temp3rd=var40           : dim c1temp4th=var41             : dim c2temp4th=var42                : dim c3temp4th=var43
 dim card1Color=var44          : dim card2Color=var45            : dim card3Color=var46               : dim card4Color=var47
 dim card5Color=var48          : dim select_x=var49              : dim select_y=var50                 : dim select2_y=var51
 dim betColor1=var53           : dim betColor2=var96             : dim betColor3=var97                : dim betColor4=var98
 dim betColorTable1=var99      : dim betColorTable2=var85        : dim betColorTable3=var86           : dim betColorTable4=var87
 dim bet=var88                 : dim c4temp4th=var61             : dim c5temp4th=var62                : dim jacksorbetter=var66
 dim twopair=var67             : dim threeofakind=var68          : dim pair=var69                     : dim straight=var70
 dim fullhouse=var71           : dim fourofakind=var72           : dim straightflush=var73            : dim royalflush=var74
 dim card1hold=m               : dim card2hold=n                 : dim card3hold=o                    : dim card4hold=p
 dim card5hold=q               : dim mathFlag=v                  : dim handCount=w                    : dim tempCreditsLo=x
 dim tempCreditsMed=y          : dim tempCreditsHi=z             : dim handComplete=f                 : dim bankFlag=g
 dim winner=h                  : dim NOTUSED=$2700               : dim pause_counter=$2701            : dim newhand=$2702
 dim gameover=$2703            : dim winFlag=$2704               : dim loseFlag=$2705                 : dim frame_counter=$2706
 dim Xselect=$2707             : dim Yselect=$2708               : dim Yselect2=$2709                 : dim select_cardColor1=$270A
 dim select_cardColor2=$270B   : dim select_cardColor3=$270C     : dim select_cardColor4=$270D        : dim select_cardColor5=$270E
 dim select_color1=$2710       : dim select_color2=$2711         : dim select_color3=$2712            : dim select_color4=$2713
 dim ballXpos=$2714            : dim ballYpos=$2715              : dim Yselect3=$2716                 : dim loser=$2717
 dim Xselect2=$2718            : dim Yselect4=$2719              : dim Yselect5=$271A                 : dim frame_counter2=$271B
 dim movedebounceup=$2726      : dim movedebouncedown=$2727      : dim displayFlag=$2760              : dim tempFlag=$2761
 dim tempCheck=$2762           : dim statsFlag=$2763             : dim textY1=$2764                   : dim textY2=$2765
 dim textY3=$2766              : dim textY4=$2767                : dim textY5=$2768                   : dim textY6=$2769
 dim textY7=$276A              : dim textY8=$276B                : dim textY9=$276C                   : dim buttonbetcolor=$276D
 dim buttondrawcolor=$276E     : dim buttonnewhandcolor=$276F    : dim c1temp=$2756                   : dim c2temp=$2757
 dim c3temp=$2758              : dim c4temp=$2759                : dim c5temp=$275A                   : dim backColor1=$275B
 dim backColor2=$275C          : dim backColor3=$275D            : dim backColor4=$275E               : dim backColor5=$275F
 dim backColor6=$272A          : dim backColor7=$272B            : dim backColor8=$272C               : dim backColor9=$272D
 dim backColor10=$272E         : dim backChoice=$272F            : dim backSelect=$270F
 dim timer=$271C               ;Timer Counter
 dim timer2=$271F              ;Timer Counter
 dim timerFlag=$271D           ;Enables or Disables Timer Bar Graphic
 dim timerX=$271E              ;X Value of visual timer indicator graphic
 dim timer_color1=$2720        ;Cycles menu colors for chosen time value
 dim timer_color2=$2721        ;Cycles menu colors for chosen time value
 dim timer_color3=$2722        ;Cycles menu colors for chosen time value
 dim timer_color4=$2723        ;Cycles menu colors for chosen time value
 dim timerOption=$2724         ;Sets Specific Time Chosen from main menu
 dim timerFlash=$2725          ;Flash timer counter when time is nearly expired
 dim scorec=$2750   ; ** score1 (Credits)         ; also uses $2751 and $2752       
 dim creditsHi=scorec:dim creditsMed=scorec+1:dim creditsLo=scorec+2
 dim scoreb=$2753   ; ** score2 (Coins)           ; also uses $2754 and $2755
 dim coinsHi=scoreb  :dim coinsMed=scoreb+1  :dim coinsLo=scoreb+2
 dim scored=$2728   ; winCount = scored           ; also uses $2729 and $2730
 dim winCountHi=scored  :dim winCountMed=scored+1  :dim winCountLo=scored+2
 dim scoree=$2731   ; lossCount = scoree          ; also uses $2732 and $2733
 dim lossCountHi=scoree :dim lossCountMed=scoree+1 :dim lossCountLo=scoree+2
 dim scoref=$2734   ; twopairCount = scoref       ; also uses $2735 and $2736
 dim twopairCountHi=scoref:dim twopairCountMed=scoref+1:dim twopairCountLo=scoref+2
 dim score2=$2737   ; jacksorbetterCount = score2 ; also uses $2738 and $2739
 dim jacksorbetterCountHi=score2:dim jacksorbetterCountMed=score2+1:dim jacksorbetterCountLo=score2+2
 dim score3=$273A   ; threeofakindCount = score3  ; also uses $273B and $273C
 dim threeofakindCountHi=score3:dim threeofakindCountMed=score3+1:dim threeofakindCountLo=score3+2
 dim score4=$273D   ; straightCount = score4      ; also uses $273E and $273F
 dim straightCountHi=score4:dim straightCountMed=score4+1:dim straightCountLo=score4+2
 dim score5=$2740   ; flushCount = score5         ; also uses $2741 and $2742
 dim flushCountHi=score5:dim flushCountMed=score5+1:dim flushCountLo=score5+2
 dim score6=$2743   ; also uses $2744 and $2745
 dim fullhouseCountHi=score6:dim fullhouseCountMed=score6+1: dim fullhouseCountLo=score6+2
 dim score7=$2746   ; also uses $2747 and $2748
 dim fourofakindCountHi=score7:dim fourofakindCountMed=score7+1:dim fourofakindCountLo=score7+2
 dim score8=$274A   ; also uses $274B and $274C
 dim straightflushCountHi=score8:dim straightflushCountMed=score8+1:dim straightflushCountLo=score8+2
 dim score9=$274D   ; also uses $274E and $274F
 dim royalflushCountHi=score9:dim royalflushCountMed=score9+1:dim royalflushCountLo=score9+2

 incgraphic atascii.png 320A 
 incgraphic scoredigits_8_wide.png 320A 0 1 2 
 incgraphic leftline.png 320A 0 1 2
 incgraphic leftline2.png 320A 0 1 2
 incgraphic ball.png 320A 0 1 2

 ; Title Screen Graphics | Top of AA Card backs
 incbanner title_jacksorbetter2.png 320A 0 1 2
 incgraphic cardback_a.png 320A 0 1 2
 incgraphic cardback_b.png 320A 0 1 2
 incbanner text_jacksorbetter5.png 320A 0 1 2

 ; Menu selector sprite
 incgraphic select_top.png 320A 0 1 2
 incgraphic select_bottom.png 320A 0 1 2

 ; Bet and Draw Buttons
 incgraphic button_draw.png 320A 0 1 2
 incgraphic button_bet.png 320A 0 1 2
 incgraphic button_1.png 320A 0 1 2
 incgraphic button_2.png 320A 0 1 2
 incgraphic button_3.png 320A 0 1 2
 incgraphic button_4.png 320A 0 1 2
 incgraphic button_newhand.png 320A 0 1 2
 incgraphic button_coins.png 320A 0 1 2
 incgraphic button_coins2.png 320A 0 1 2
 incgraphic button_credits.png 320A 0 1 2
 incgraphic button_credits2.png 320A 0 1 2

 ; Card Suit Graphics
 incgraphic cardbar_hearts_top.png 320A 0 1 2
 incgraphic cardbar_hearts_bottom.png 320A 0 1 2
 incgraphic cardbar_diamonds_top.png 320A 0 1 2
 incgraphic cardbar_diamonds_bottom.png 320A 0 1 2
 incgraphic cardbar_clubs_top.png 320A 0 1 2
 incgraphic cardbar_clubs_bottom.png 320A 0 1 2
 incgraphic cardbar_spades_top.png 320A 0 1 2
 incgraphic cardbar_spades_bottom.png 320A 0 1 2

 ; Blank Card Backs
 incgraphic card_top.png 320A 0 1 2
 incgraphic card_middle.png 320A 0 1 2
 incgraphic card_bottom.png 320A 0 1 2
 incgraphic cardbar_back_top.png 320A 0 1 2
 incgraphic cardbar_back.png 320A 0 1 2
 incgraphic cardbar_back_bottom.png 320A 0 1 2

 ; Card Numbers
 incgraphic cardbar_2_top.png 320A 0 1 2
 incgraphic cardbar_2_bottom.png 320A 0 1 2
 incgraphic cardbar_3_top.png 320A 0 1 2
 incgraphic cardbar_3_bottom.png 320A 0 1 2
 incgraphic cardbar_4_top.png 320A 0 1 2
 incgraphic cardbar_4_bottom.png 320A 0 1 2
 incgraphic cardbar_5_top.png 320A 0 1 2
 incgraphic cardbar_5_bottom.png 320A 0 1 2
 incgraphic cardbar_6_top.png 320A 0 1 2
 incgraphic cardbar_6_bottom.png 320A 0 1 2
 incgraphic cardbar_7_top.png 320A 0 1 2
 incgraphic cardbar_7_bottom.png 320A 0 1 2
 incgraphic cardbar_8_top.png 320A 0 1 2
 incgraphic cardbar_8_bottom.png 320A 0 1 2
 incgraphic cardbar_9_top.png 320A 0 1 2
 incgraphic cardbar_9_bottom.png 320A 0 1 2
 incgraphic cardbar_10_top.png 320A 0 1 2
 incgraphic cardbar_10_bottom.png 320A 0 1 2
 incgraphic cardbar_J_top.png 320A 0 1 2
 incgraphic cardbar_J_bottom.png 320A 0 1 2
 incgraphic cardbar_Q_top.png 320A 0 1 2
 incgraphic cardbar_Q_bottom.png 320A 0 1 2
 incgraphic cardbar_K_top.png 320A 0 1 2
 incgraphic cardbar_K_bottom.png 320A 0 1 2
 incgraphic cardbar_A_top.png 320A 0 1 2
 incgraphic cardbar_A_bottom.png 320A 0 1 2

 ; AA Logo Graphic
 incgraphic aa_left_1b.png 320A 0 1 2 
 incgraphic aa_left_2b.png 320A 0 1 2 
 incgraphic aa_left_3b.png 320A 0 1 2 
 incgraphic aa_left_4b.png 320A 0 1 2 
 incgraphic aa_right_1.png 320A 0 1 2 
 incgraphic aa_right_2.png 320A 0 1 2 
 incgraphic aa_right_3.png 320A 0 1 2 
 incgraphic aa_right_4.png 320A 0 1 2 

 incgraphic coin160.png 320A 0 1 2
 incgraphic coin400.png 320A 0 1 2
 incgraphic coin800.png 320A 0 1 2
 incgraphic coinMax.png 320A 0 1 2

 ; Timer Bar
 incgraphic bar_left_end.png 320A 0 1 2
 incgraphic bar_right_end.png 320A 0 1 2 
 incgraphic bar_middle_64.png 320A 0 1 2
 incgraphic bar_middle_24.png 320A 0 1 2
 incgraphic settimeroff.png 320A 0 1 2
 incgraphic settimer2.png 320A 0 1 2
 incgraphic settimer4.png 320A 0 1 2
 incgraphic settimer6.png 320A 0 1 2

 ; AA Logo Card Backs
 incgraphic button_time.png 320A 0 1 2
 incgraphic cardback_c.png 320A 0 1 2
 incgraphic cardback_d.png 320A 0 1 2

 characterset atascii
 alphachars ASCII
 clearscreen
 drawscreen

 menubarx=4
 menubary=24
 debounce=0

 select_color1=1
 select_color2=0
 select_color3=0
 select_color4=0
 select_cardColor1=5
 select_cardColor2=5
 select_cardColor3=5
 select_cardColor4=5
 select_cardColor5=5
 ballXpos=32
 ballYpos=192
 coinOption=1
 timer_color1=1
 timer_color2=0
 timer_color3=0
 timer_color4=0
 timerOption=1

 P4C2=$84: rem Blue 
 P5C2=$36: rem Orange
 P6C2=$86: rem Lighter Blue  
 P7C2=$0A: rem Bright White

AALogoLoop
 drawwait
 clearscreen
 gosub AALogoDraw
 frame_counter=frame_counter+1
 plotchars   'Presents...' 6 56 13
 plotchars    'A Game By' 7 58 16
 plotchars 'Steve Engelhardt' 7 45 17
 plotchars      '+ 2022' 7 64 18
 BACKGRND=$A0
 if frame_counter>180 || joy0fire then playsfx sfx_newhand :goto AALogoExit
 drawscreen
 goto AALogoLoop
AALogoExit

 P0C2=$06 ; Grey
 P1C2=$DF ; Yellow
 P2C2=$CA ; Green
 P3C2=$62 ; Purple
 P4C2=$FA ; BRIGHT YELLOW: title logo color
 P5C2=$0C ; Bright White
 P6C2=$46 ; Red
 P7C2=$28 ; Yellow

 ; ----------------------------------------------menu screen-----------------------------------------------------------------
main 

 drawwait
 clearscreen
 RandomSeed=RandomSeed+1
 if RandomSeed>252 then RandomSeed=rand
 RandomSeed2=RandomSeed2+1
 if RandomSeed2>252 then RandomSeed2=rand

 ; The "Jacks or Better Poker" Title Screen Banner
 plotbanner title_jacksorbetter2 4 32 0

 if ballYpos=208 && joy0fire then rand=RandomSeed:rand16=RandomSeed2:debounce=2

 ; Joystick Debounce Routines
 if !joy0fire && debounce=2 then debounce=1
 if joy0right then debounce=4
 if !joy0right && debounce=4 then debounce=5
 if joy0left then debounce=6
 if !joy0left && debounce=6 then debounce=7
 if joy0up then movedebounceup=8
 if !joy0up && movedebounceup=8 then movedebounceup=9
 if joy0down then movedebouncedown=2
 if !joy0down && movedebouncedown=2 then movedebouncedown=3

 ; Menu selector "Ball" Sprite
 plotsprite ball 7 ballXpos ballYpos

 if timerOption=1 then plotchars ' Coins' 2 32 24 :timer_color1=1:timer_color2=0:timer_color3=0:timer_color4=0:timerFlag=$00
 if timerOption>1 then plotchars ' No Coins' 2 26 24:select_color1=0:select_color2=0:select_color3=0:select_color4=0  

 if ballYpos=200 && timerOption=1 && select_color1=0 && select_color2=0 && select_color3=0 && select_color4=0 then coinOption=1:select_color1=1

 plotchars ' Timer' 2 32 25
 plotchars ' Start Game' 2 56 26   

 plotsprite coin160 select_color1 64 192
 plotsprite coin400 select_color2 80 192
 plotsprite coin800 select_color3 96 192
 plotsprite coinMax select_color4 112 192
 
 plotsprite settimeroff timer_color1 66 200
 plotsprite settimer2 timer_color2 82 200
 plotsprite settimer4 timer_color3 98 200
 plotsprite settimer6 timer_color4 114 200
 
 plotchars '"########################!' 2 28  23
 plotchars '(' 2 28 24 :  plotchars ')' 2 128 24 ; Coin Select:  ballYpos = 192
 plotchars '(' 2 28 25 :  plotchars ')' 2 128 25 ; Timer Select: ballYpos = 200
 plotchars '(' 2 28 25 :  plotchars ')' 2 128 26 ; Start Game:   ballYpos = 208          
 plotchars '&::::::::::::::::::::::::%' 2 28  27 
 plotsprite leftline 2 25 208


 if ballYpos=192 && debounce=5 then gosub playmenuselect: debounce=0:coinOption=coinOption+1
 if ballYpos=192 && debounce=7 then gosub playmenuselect:debounce=0:coinOption=coinOption-1
 if ballYpos=192 && coinOption>4 then coinOption=4
 if ballYpos=192 && coinOption<1 then coinOption=1

 if ballYpos=200 && debounce=5 then gosub playmenuselect:debounce=0:timerOption=timerOption+1
 if ballYpos=200 && debounce=7 then gosub playmenuselect:debounce=0:timerOption=timerOption-1
 if ballYpos=200 && timerOption>4 then timerOption=4
 if ballYpos=200 && timerOption<1 then timerOption=1

 if joy0up && ballYpos=192 then gosub playmenumove:movedebounceup=0:ballXpos=32:ballYpos=192
 if movedebounceup=9 && ballYpos=200 && timerOption=1 then gosub playmenumove:movedebounceup=0:ballXpos=32:ballYpos=192:coinOption=1
 if movedebounceup=9 && ballYpos=208 then gosub playmenumove:movedebounceup=0:ballXpos=32:ballYpos=200

 if movedebouncedown=3 && ballYpos=192 then gosub playmenumove: movedebouncedown=0:ballXpos=32:ballYpos=200
 if movedebouncedown=3 && ballYpos=200 then gosub playmenumove: movedebouncedown=0:ballXpos=56:ballYpos=208
 if joy0down && ballYpos=208 then gosub playmenumove: movedebouncedown=0:ballXpos=56:ballYpos=208

 if coinOption=1 && ballYpos=192 then select_color1=1:select_color2=0:select_color3=0:select_color4=0
 if coinOption=2 && ballYpos=192 then select_color1=0:select_color2=1:select_color3=0:select_color4=0
 if coinOption=3 && ballYpos=192 then select_color1=0:select_color2=0:select_color3=1:select_color4=0
 if coinOption=4 && ballYpos=192 then select_color1=0:select_color2=0:select_color3=0:select_color4=1

 if timerOption=1 && ballYpos=200 then timer_color1=1:timer_color2=0:timer_color3=0:timer_color4=0:timerFlag=$00
 if timerOption=2 && ballYpos=200 then timer_color1=0:timer_color2=1:timer_color3=0:timer_color4=0:timerFlag=$01
 if timerOption=3 && ballYpos=200 then timer_color1=0:timer_color2=0:timer_color3=1:timer_color4=0:timerFlag=$01
 if timerOption=4 && ballYpos=200 then timer_color1=0:timer_color2=0:timer_color3=0:timer_color4=1:timerFlag=$01

 if ballYpos=208 && debounce=1 then debounce=2 : playsfx sfx_cavalry: goto poker 

initial_deck
  plotsprite card_top    5 8 100          : plotsprite cardbar_back_top 5 38 108    : plotsprite card_top    5 68 114           : plotsprite cardbar_back_top 5 98 108    : plotsprite card_top   5 128 100
  plotsprite cardbar_A_top 5 8 108        : plotsprite cardbar_back 5 38 116        : plotsprite cardbar_8_top 5 68 122         : plotsprite cardbar_back 5 98 116        : plotsprite cardbar_K_top 5 128 108
  plotsprite cardbar_A_bottom 5 8 116     : plotsprite cardback_a 5 38 124        : plotsprite cardbar_8_bottom 5 68 130      : plotsprite cardback_a 5 98 124        : plotsprite cardbar_K_bottom 5 128 116
  plotsprite card_middle 5 8 124          : plotsprite cardback_b 5 38 132        : plotsprite card_middle 5 68 138           : plotsprite cardback_b 5 98 132        : plotsprite card_middle 5 128 124
  plotsprite cardbar_clubs_top 5 8 132    : plotsprite cardback_c 5 38 140        : plotsprite cardbar_spades_top 5 68 146    : plotsprite cardback_c 5 98 140        : plotsprite cardbar_clubs_top 5 128 132
  plotsprite cardbar_clubs_bottom 5 8 140 : plotsprite cardback_d 5 38 148        : plotsprite cardbar_spades_bottom 5 68 154 : plotsprite cardback_d 5 98 148        : plotsprite cardbar_clubs_bottom 5 128 140
  plotsprite card_middle 5 8 148          : plotsprite cardbar_back 5 38 156        : plotsprite card_middle 5 68 162           : plotsprite cardbar_back 5 98 156        : plotsprite card_middle 5 128 148
  ;plotsprite card_middle 5 8 158          : plotsprite cardbar_back 5 38 164        : plotsprite card_middle 5 68 168           : plotsprite cardbar_back 5 98 164        : plotsprite card_middle 5 128 158
  plotsprite card_bottom 5 8 156          : plotsprite cardbar_back_bottom 5 38 164 : plotsprite card_bottom 5 68 170          : plotsprite cardbar_back_bottom 5 98 164 : plotsprite card_bottom 5 128 156
 BACKGRND=$D0
 drawscreen
 goto main 
 ; --------------------------------end menu screen-------------------------------------------------------------------------------

poker
 ; Displays "Shuffling" on the screen breifly
 ; It's not really shuffling cards, but it gets around a slight screen graphics glitch when switching from the menu to the main game.
 clearscreen
 drawwait
 pause_counter=pause_counter+1
 plotchars 'Shuffling...' 4 58 0
 if pause_counter>42 then goto init
 drawscreen
 goto poker

 ; --------------------------------initialize variables--------------------------------------------------------------------------
init

 P0C2=$D8: rem Aqua        ; Poker Hand Text for Payouts
 P1C2=$0A: rem Dark Grey   ; Paylines that are not highlighted
 P2C2=$C8: rem Blue        ; Logo and Box 8A
 P3C2=$1A: rem Yellow      ; Selector Box, highlighted payouts
 P4C2=$2A: rem Green       ; Bottom Buttons
 P5C2=$0E: rem Light Gray  ; Greyed out buttons     
 P6C2=$F6: rem Orange      ; Credits and Coin Text Color  BUTTONS AT THE BOTTOM
 P7C2=$46: rem Red         ; Drop Text and Loser Text Colors, Red Card Backs
 ;Background=$D0

 C1X=16
 C2X=46
 C3X=76
 C4X=106
 C5X=136

 card1_value=$00
 card2_value=$00
 card3_value=$00
 card4_value=$00
 card5_value=$00

 c1suit=29:c2suit=30:c3suit=40:c4suit=50:c5suit=60

 gosub resetcardvariables
 straight=$99

 card1Color=5
 card2Color=5
 card3Color=5
 card4Color=5
 card5Color=5

 betColor1=3
 betColor2=1
 betColor3=1
 betColor4=1

 betColorTable1=3
 betColorTable2=1
 betColorTable3=1
 betColorTable4=1

 select_x=8
 select_y=208
 select2_y=select_y+4

 card1hold=0
 card2hold=0
 card3hold=0
 card4hold=0
 card5hold=0

 creditsHi=$00
 creditsMed=$00
 creditsLo=$00

 ;set initial number of coins you have
 if timerOption>1 then coinsMed=$99:coinsLo=$99:goto skipCoinChecks  ; Max coins if you have a timer set.
 if coinOption=1 then coinsMed=$01:coinsLo=$60
 if coinOption=2 then coinsMed=$04:coinsLo=$00
 if coinOption=3 then coinsMed=$08:coinsLo=$00
 if coinOption=4 then coinsMed=$99:coinsLo=$99
skipCoinChecks

 handCount=$00
 handComplete=$00
 bankFlag=0
 bet=$01
 newhand=$00
 gameover=$00
 frame_counter=$00
 frame_counter2=$00
 pause_counter=$00
 timer=$32
 timer2=$19
 statsFlag=$00
 mathFlag=$00

 textY1=3
 textY2=4
 textY3=5
 textY4=6
 textY5=7
 textY6=8
 textY7=9
 textY8=10
 textY9=11

 winCountHi=$00:winCountMed=$00:winCountLo=$00
 lossCountHi=$00:lossCountMed=$00:lossCountLo=$00
 twopairCountHi=$00:twopairCountMed=$00:twopairCountLo=$00
 jacksorbetterCountHi=$00:jacksorbetterCountMed=$00:jacksorbetterCountLo=$00
 threeofakindCountHi=$00:threeofakindCountMed=$00:threeofakindCountLo=$00
 straightCountHi=$00:straightCountMed=$00:straightCountLo=$00
 flushCountHi=$00:flushCountMed=$00:flushCountLo=$00
 fullhouseCountHi=$00:fullhouseCountMed=$00:fullhouseCountLo=$00
 fourofakindCountHi=$00:fourofakindCountMed=$00:fourofakindCountLo=$00
 straightflushCountHi=$00:straightflushCountMed=$00:straightflushCountLo=$00
 royalflushCountHi=$00:royalflushCountMed=$00:royalflushCountLo=$00

 ;winCount = scored
 ;lossCount = scoree
 ;twopairCount = scoref
 ;jacksorbetterCount = score2
 ;threeofakindCount = score3
 ;straightCount = score4
 ;flushCount = score5
 ;fullhouseCount = score6
 ;fourofakindCount = score7
 ;straightflushCount = score8
 ;royalflushCount = score9

 goto poker_loop

 ; -----------------------------end initialize--------------------------------------------------------------------------------


 ; -----------------STATS/GAME OVER----------------------------
 ; Stats screen is updated when you press the Deal button!
 ; Same for game over, the only stats updated all the time are coins and credits, all others when you press Deal.
 ;
 ; changed conditions for couting total hands won and individual hands won, test that they add up and work as expected v51
stats
  textY1=8
  textY2=9
  textY3=10
  textY4=11
  textY5=12
  textY6=13
  textY7=14
  textY8=15
  textY9=16
  drawwait
  clearscreen
  BACKGRND=$10
  plotbanner text_jacksorbetter5 2 44 11
  plotchars '::::::::::' 2 9 3
  plotchars '::::::::::' 2 110 3
  gosub displaywinners

  plotchars 'Winning Hands' 2 6 7
  if gameover=$00 then plotchars 'Statistics' 3 59 5 else plotchars 'Game Over' 3 62 5
  plotchars 'Totals' 2 6 18
  plotchars 'Hands Won'  0 8 19 : plotvalue scoredigits_8_wide 5 winCountMed  2 52 19 : plotvalue scoredigits_8_wide 5 winCountLo  2 60 19  ;score d
  plotchars 'Hands Lost' 0 8 20 : plotvalue scoredigits_8_wide 5 lossCountMed 2 52 20 : plotvalue scoredigits_8_wide 5 lossCountLo 2 60 20  ;score e

  plotchars 'Score' 2 6 22
  plotchars 'Coins'   0 8 23
   if timerFlag=$00 then plotvalue scoredigits_8_wide 5 scoreb 6 42 23
   if timerOption=2 then plotchars '2 Min Timer' 3 42 23
   if timerOption=3 then plotchars '5 Min Timer' 3 42 23
   if timerOption=4 then plotchars '9 Min Timer' 3 42 23
  plotchars 'Credits' 0 8 24 : plotvalue scoredigits_8_wide 5 scorec 6 42 24
  plotchars ':::::::Press Fire to Exit:::::::' 2 16 26

 plotvalue scoredigits_8_wide 5 royalflushCountLo     2 88 8                                                                  ;score 9 - Royal Flush Hand Counter
 plotvalue scoredigits_8_wide 5 straightflushCountMed 2 80 9  : plotvalue scoredigits_8_wide 5 straightflushCountLo 2 88 9    ;score 4 - Straight Flush Hand Counter
 plotvalue scoredigits_8_wide 5 fourofakindCountMed   2 80 10 : plotvalue scoredigits_8_wide 5 fourofakindCountLo   2 88 10   ;score 7 - Four of a Kind Hand Counter
 plotvalue scoredigits_8_wide 5 fullhouseCountMed     2 80 11 : plotvalue scoredigits_8_wide 5 fullhouseCountLo     2 88 11   ;score 6 - Full House Hand Counter
 plotvalue scoredigits_8_wide 5 flushCountMed         2 80 12 : plotvalue scoredigits_8_wide 5 flushCountLo         2 88 12   ;score 5 - Flush Hand Counter
 plotvalue scoredigits_8_wide 5 straightCountMed      2 80 13 : plotvalue scoredigits_8_wide 5 straightCountLo      2 88 13   ;score 4 - Straight Hand Counter
 plotvalue scoredigits_8_wide 5 threeofakindCountMed  2 80 14 : plotvalue scoredigits_8_wide 5 threeofakindCountLo  2 88 14   ;score 3 - Three of a Kind Hand Counter
 plotvalue scoredigits_8_wide 5 twopairCountMed       2 80 15 : plotvalue scoredigits_8_wide 5 twopairCountLo       2 88 15   ;score F - Two Pair Hand Counter
 plotvalue scoredigits_8_wide 5 score2 6 72 16                                                                                ;score 2 - Jacks or Better Hand Counter $2738 and $2739

 if joy0fire then debounce=2
 if !joy0fire && debounce=2 then debounce=1
 if gameover=$00 && debounce=1 then statsFlag=$00:BACKGRND=$D0:goto statsreturn
 if gameover=$01 && debounce=1 then goto poker

 drawscreen
 goto stats

statsreturn
 ;Move the logo back
 textY1=3
 textY2=4
 textY3=5
 textY4=6
 textY5=7
 textY6=8
 textY7=9
 textY8=10
 textY9=11
 clearscreen
 return

 ; -----------------STATS/GAME OVER LOOP ENDS----------------------------

dropsound
 playsfx sfx_menuselect 5
 return

playmenuselect
 playsfx sfx_menuselect
 return

playmenumove
 playsfx sfx_menumove
 return

playdraw
 playsfx sfx_draw
 return

 ;---------------------------------MAIN LOOP----------------------------------------------------------------------------------

poker_loop

 mutesfx 0
 if RandomSeed>0 then rand=RandomSeed
 drawwait
 clearscreen
 BACKGRND=$D0  ; Dark Green Background
 if joy0fire0 && select_y<>182 then statsFlag=$01:debounce=99:gosub stats ; Jump to Stats screen with Right fire, if you're not on drop/hold line.

 ;Timer
 timerFlash=timerFlash+1
 if timerFlash>7 then timerFlash=0
 if gameover=$01 then timerX=129:goto skipTimeCounter
 if timerFlag=$00 then goto skipTimer
 timer=timer+$01
 ;Timer Testing
 ; 33.5 Seconds   if timer>$01 then timer=$00:timer2=timer2+$01
 ; 53.8 Seconds   if timer>$02 then timer=$00:timer2=timer2+$01
 ; 1:05           if timer>$03 then timer=$00:timer2=timer2+$01 - 1 Minute Timer
 ; 1:25           if timer>$04 then timer=$00:timer2=timer2+$01
 ; 1:42           if timer>$05 then timer=$00:timer2=timer2+$01
 ; 1:58           if timer>$06 then timer=$00:timer2=timer2+$01 - 2 Minute Timer
 ; 2:45           if timer>$09 then timer=$00:timer2=timer2+$01
 ; 4:34           if timer>$10 then timer=$00:timer2=timer2+$01
 ; 5:07           if timer>$12 then timer=$00:timer2=timer2+$01 - 5 Minute Timer  
 ; 5:40           if timer>$14 then timer=$00:timer2=timer2+$01
 ; 5:51           if timer>$15 then timer=$00:timer2=timer2+$01
 ; 8:57           if timer>$20 then timer=$00:timer2=timer2+$01 - 9 Minute Timer
 if timerOption=1 then timer=$00
 if timerOption=2 && timer>$06 then timer=$00:timer2=timer2+$01
 if timerOption=3 && timer>$12 then timer=$00:timer2=timer2+$01
 if timerOption=4 && timer>$20 then timer=$00:timer2=timer2+$01
skipTimeCounter
 if timerOption=2 then plotchars '2 MIN' 3 78 26
 if timerOption=3 then plotchars '5 MIN' 3 78 26
 if timerOption=4 then plotchars '9 MIN' 3 78 26

 timerX=timer2+3
 if timerX<115 then timerFlash=7
 if timerX>128 && timerX<133 then coinsMed=$00:coinsLo=$00 ; This will end the game
 if timerOption>1 then plotsprite ball timerFlash timerX 98

 ; Plot Timer Bar on screen
 plotsprite bar_left_end 2 29 98:plotsprite bar_middle_64 2 33 98:plotsprite bar_middle_64 2 65 98:plotsprite bar_middle_64 2 97 98:plotsprite bar_right_end 2 129 98

skipTimer

 plotbanner text_jacksorbetter5 2 0 0

  if handComplete=$00 || handComplete=$02 then goto skipdrophold
  if handComplete=$03 then goto skipdrophold
  if card1hold=0 then plotchars 'DROP'  4 12 23   ; Card 1
  if card2hold=0 then plotchars 'DROP'  4 42 23   ; Card 2
  if card3hold=0 then plotchars 'DROP'  4 72 23   ; Card 3
  if card4hold=0 then plotchars 'DROP'  4 102 23  ; Card 4
  if card5hold=0 then plotchars 'DROP'  4 132 23  ; Card 5
  if card1hold=1 then plotchars 'HOLD'  7 12 23   ; Card 1
  if card2hold=1 then plotchars 'HOLD'  7 42 23   ; Card 2
  if card3hold=1 then plotchars 'HOLD'  7 72 23   ; Card 3
  if card4hold=1 then plotchars 'HOLD'  7 102 23  ; Card 4
  if card5hold=1 then plotchars 'HOLD'  7 132 23  ; Card 5
skipdrophold

 Xselect=select_x-1
 Xselect2=select_x+1
 Yselect=select_y-2
 Yselect2=select2_y-2
 Yselect3=select2_y-2
 Yselect4=select2_y-3
 Yselect5=select2_y+3

 if select_y=182 then goto moveselecttop
 if select_y=208 then goto moveSelectbottom
moveselecttop
 if gameover=$00 then plotsprite ball 7 select_x Yselect3
 goto moveselectskip
moveSelectbottom
 plotsprite select_top    3 select_x 205
 plotsprite select_bottom 3 select_x 211
moveselectskip

 if handComplete=$00 then buttondrawcolor=6:buttonbetcolor=6:buttonnewhandcolor=1
 if handComplete=$01 then buttondrawcolor=6:buttonbetcolor=1:buttonnewhandcolor=1
 if handComplete=$02 then buttondrawcolor=1:buttonbetcolor=1:buttonnewhandcolor=6
 if handComplete=$03 then buttondrawcolor=6:buttonbetcolor=6:buttonnewhandcolor=1
 plotsprite button_bet  buttonbetcolor 8 208
 plotsprite button_draw buttondrawcolor 128 208
 plotsprite button_newhand buttonnewhandcolor 102 208

 plotsprite button_1 betColor1 35 208
 plotsprite button_2 betColor2 41 208
 plotsprite button_3 betColor3 47 208
 plotsprite button_4 betColor4 53 208

 if timerOption=1 then plotsprite button_coins 4 60 208
 if timerOption=1 then plotsprite button_coins2 4 60 209

 if timerOption>1 then plotsprite button_time 4 60 208

 plotsprite button_credits 2 98 0
 plotsprite button_credits2 2 98 1

 plotvalue scoredigits_8_wide 3 scorec 6 128 0
 if timerOption<2 then plotvalue scoredigits_8_wide 3 coinsMed 2 82 26
 if timerOption<2 then plotvalue scoredigits_8_wide 3 coinsLo 2 90 26

 ;Change Cards to drop or hold
 ;LEFT Button to HOLD, RIGHT button to DROP

 if select_y=208 then goto skipDropHold
 if joy0fire0 && select_x=8   then gosub dropsound:card1hold=0
 if joy0fire0 && select_x=38  then gosub dropsound:card2hold=0
 if joy0fire0 && select_x=68  then gosub dropsound:card3hold=0
 if joy0fire0 && select_x=98  then gosub dropsound:card4hold=0
 if joy0fire0 && select_x=128 then gosub dropsound:card5hold=0

 if joy0fire1 && select_x=8   then gosub dropsound:card1hold=1
 if joy0fire1 && select_x=38  then gosub dropsound:card2hold=1
 if joy0fire1 && select_x=68  then gosub dropsound:card3hold=1
 if joy0fire1 && select_x=98  then gosub dropsound:card4hold=1
 if joy0fire1 && select_x=128 then gosub dropsound:card5hold=1
skipDropHold

 ;Change bet when you're low on coins
 if bet=$04 && coinsLo<$04 then bet=$03
 if bet=$03 && coinsLo<$03 then bet=$02
 if bet=$02 && coinsLo<$02 then bet=$01

 ;Change bet if the bet button is highlighted and you press fire
 if select_x=8 && select_y=208 && joy0fire then gosub selectBet

 if bet=$01 then betColor1=3:betColor2=1:betColor3=1:betColor4=1
 if bet=$02 then betColor1=1:betColor2=3:betColor3=1:betColor4=1
 if bet=$03 then betColor1=1:betColor2=1:betColor3=3:betColor4=1
 if bet=$04 then betColor1=1:betColor2=1:betColor3=1:betColor4=3

 ;Card Values, assign numbers and suit                                                 ; For Testing
  if newhand=$01 then goto skipcardvalues
  if card1_value=$01 then c1value=$02:c1suit=$01:gosub card1number_2:gosub card1suit   ; plotchars '2D'  1 C1X 24
  if card1_value=$02 then c1value=$03:c1suit=$01:gosub card1number_3:gosub card1suit   ; plotchars '3D'  1 C1X 24
  if card1_value=$03 then c1value=$04:c1suit=$01:gosub card1number_4:gosub card1suit   ; plotchars '4D'  1 C1X 24
  if card1_value=$04 then c1value=$05:c1suit=$01:gosub card1number_5:gosub card1suit   ; plotchars '5D'  1 C1X 24
  if card1_value=$05 then c1value=$06:c1suit=$01:gosub card1number_6:gosub card1suit   ; plotchars '6D'  1 C1X 24
  if card1_value=$06 then c1value=$07:c1suit=$01:gosub card1number_7:gosub card1suit   ; plotchars '7D'  1 C1X 24
  if card1_value=$07 then c1value=$08:c1suit=$01:gosub card1number_8:gosub card1suit   ; plotchars '8D'  1 C1X 24
  if card1_value=$08 then c1value=$09:c1suit=$01:gosub card1number_9:gosub card1suit   ; plotchars '9D'  1 C1X 24
  if card1_value=$09 then c1value=$10:c1suit=$01:gosub card1number_10:gosub card1suit  ; plotchars '10D' 1 C1X 24
  if card1_value=$10 then c1value=$11:c1suit=$01:gosub card1number_J:gosub card1suit   ; plotchars 'JD'  1 C1X 24
  if card1_value=$11 then c1value=$12:c1suit=$01:gosub card1number_Q:gosub card1suit   ; plotchars 'QD'  1 C1X 24
  if card1_value=$12 then c1value=$13:c1suit=$01:gosub card1number_K:gosub card1suit   ; plotchars 'KD'  1 C1X 24
  if card1_value=$13 then c1value=$14:c1suit=$01:gosub card1number_A:gosub card1suit   ; plotchars 'AD'  1 C1X 24
  if card1_value=$14 then c1value=$02:c1suit=$02:gosub card1number_2:gosub card1suit   ; plotchars '2H'  1 C1X 24
  if card1_value=$15 then c1value=$03:c1suit=$02:gosub card1number_3:gosub card1suit   ; plotchars '3H'  1 C1X 24
  if card1_value=$16 then c1value=$04:c1suit=$02:gosub card1number_4:gosub card1suit   ; plotchars '4H'  1 C1X 24 
  if card1_value=$17 then c1value=$05:c1suit=$02:gosub card1number_5:gosub card1suit   ; plotchars '5H'  1 C1X 24
  if card1_value=$18 then c1value=$06:c1suit=$02:gosub card1number_6:gosub card1suit   ; plotchars '6H'  1 C1X 24
  if card1_value=$19 then c1value=$07:c1suit=$02:gosub card1number_7:gosub card1suit   ; plotchars '7H'  1 C1X 24
  if card1_value=$20 then c1value=$08:c1suit=$02:gosub card1number_8:gosub card1suit   ; plotchars '8H'  1 C1X 24
  if card1_value=$21 then c1value=$09:c1suit=$02:gosub card1number_9:gosub card1suit   ; plotchars '9H'  1 C1X 24
  if card1_value=$22 then c1value=$10:c1suit=$02:gosub card1number_10:gosub card1suit  ; plotchars '10H' 1 C1X 24
  if card1_value=$23 then c1value=$11:c1suit=$02:gosub card1number_J:gosub card1suit   ; plotchars 'JH'  1 C1X 24
  if card1_value=$24 then c1value=$12:c1suit=$02:gosub card1number_Q:gosub card1suit   ; plotchars 'QH'  1 C1X 24
  if card1_value=$25 then c1value=$13:c1suit=$02:gosub card1number_K:gosub card1suit   ; plotchars 'KH'  1 C1X 24
  if card1_value=$26 then c1value=$14:c1suit=$02:gosub card1number_A:gosub card1suit   ; plotchars 'AH'  1 C1X 24
  if card1_value=$27 then c1value=$02:c1suit=$03:gosub card1number_2:gosub card1suit   ; plotchars '2S'  1 C1X 24
  if card1_value=$28 then c1value=$03:c1suit=$03:gosub card1number_3:gosub card1suit   ; plotchars '3S'  1 C1X 24
  if card1_value=$29 then c1value=$04:c1suit=$03:gosub card1number_4:gosub card1suit   ; plotchars '4S'  1 C1X 24 
  if card1_value=$30 then c1value=$05:c1suit=$03:gosub card1number_5:gosub card1suit   ; plotchars '5S'  1 C1X 24
  if card1_value=$31 then c1value=$06:c1suit=$03:gosub card1number_6:gosub card1suit   ; plotchars '6S'  1 C1X 24
  if card1_value=$32 then c1value=$07:c1suit=$03:gosub card1number_7:gosub card1suit   ; plotchars '7S'  1 C1X 24
  if card1_value=$33 then c1value=$08:c1suit=$03:gosub card1number_8:gosub card1suit   ; plotchars '8S'  1 C1X 24
  if card1_value=$34 then c1value=$09:c1suit=$03:gosub card1number_9:gosub card1suit   ; plotchars '9S'  1 C1X 24
  if card1_value=$35 then c1value=$10:c1suit=$03:gosub card1number_10:gosub card1suit  ; plotchars '10S' 1 C1X 24
  if card1_value=$36 then c1value=$11:c1suit=$03:gosub card1number_J:gosub card1suit   ; plotchars 'JS'  1 C1X 24
  if card1_value=$37 then c1value=$12:c1suit=$03:gosub card1number_Q:gosub card1suit   ; plotchars 'QS'  1 C1X 24
  if card1_value=$38 then c1value=$13:c1suit=$03:gosub card1number_K:gosub card1suit   ; plotchars 'KS'  1 C1X 24
  if card1_value=$39 then c1value=$14:c1suit=$03:gosub card1number_A:gosub card1suit   ; plotchars 'AS'  1 C1X 24
  if card1_value=$40 then c1value=$02:c1suit=$00:gosub card1number_2:gosub card1suit   ; plotchars '2C'  1 C1X 24
  if card1_value=$41 then c1value=$03:c1suit=$00:gosub card1number_3:gosub card1suit   ; plotchars '3C'  1 C1X 24
  if card1_value=$42 then c1value=$04:c1suit=$00:gosub card1number_4:gosub card1suit   ; plotchars '4C'  1 C1X 24
  if card1_value=$43 then c1value=$05:c1suit=$00:gosub card1number_5:gosub card1suit   ; plotchars '5C'  1 C1X 24
  if card1_value=$44 then c1value=$06:c1suit=$00:gosub card1number_6:gosub card1suit   ; plotchars '6C'  1 C1X 24
  if card1_value=$45 then c1value=$07:c1suit=$00:gosub card1number_7:gosub card1suit   ; plotchars '7C'  1 C1X 24  $16 4H - $30 5S - $45 7C - $46 8C - $44 6C
  if card1_value=$46 then c1value=$08:c1suit=$00:gosub card1number_8:gosub card1suit   ; plotchars '8C'  1 C1X 24
  if card1_value=$47 then c1value=$09:c1suit=$00:gosub card1number_9:gosub card1suit   ; plotchars '9C'  1 C1X 24
  if card1_value=$48 then c1value=$10:c1suit=$00:gosub card1number_10:gosub card1suit  ; plotchars '10C' 1 C1X 24
  if card1_value=$49 then c1value=$11:c1suit=$00:gosub card1number_J:gosub card1suit   ; plotchars 'JC'  1 C1X 24
  if card1_value=$50 then c1value=$12:c1suit=$00:gosub card1number_Q:gosub card1suit   ; plotchars 'QC'  1 C1X 24
  if card1_value=$51 then c1value=$13:c1suit=$00:gosub card1number_K:gosub card1suit   ; plotchars 'KC'  1 C1X 24
  if card1_value=$52 then c1value=$14:c1suit=$00:gosub card1number_A:gosub card1suit   ; plotchars 'AC'  1 C1X 24

  if card2_value=$01 then c2value=$02:c2suit=$01:gosub card2number_2:gosub card2suit 
  if card2_value=$02 then c2value=$03:c2suit=$01:gosub card2number_3:gosub card2suit 
  if card2_value=$03 then c2value=$04:c2suit=$01:gosub card2number_4:gosub card2suit 
  if card2_value=$04 then c2value=$05:c2suit=$01:gosub card2number_5:gosub card2suit 
  if card2_value=$05 then c2value=$06:c2suit=$01:gosub card2number_6:gosub card2suit 
  if card2_value=$06 then c2value=$07:c2suit=$01:gosub card2number_7:gosub card2suit 
  if card2_value=$07 then c2value=$08:c2suit=$01:gosub card2number_8:gosub card2suit 
  if card2_value=$08 then c2value=$09:c2suit=$01:gosub card2number_9:gosub card2suit 
  if card2_value=$09 then c2value=$10:c2suit=$01:gosub card2number_10:gosub card2suit 
  if card2_value=$10 then c2value=$11:c2suit=$01:gosub card2number_J:gosub card2suit 
  if card2_value=$11 then c2value=$12:c2suit=$01:gosub card2number_Q:gosub card2suit 
  if card2_value=$12 then c2value=$13:c2suit=$01:gosub card2number_K:gosub card2suit 
  if card2_value=$13 then c2value=$14:c2suit=$01:gosub card2number_A:gosub card2suit 
  if card2_value=$14 then c2value=$02:c2suit=$02:gosub card2number_2:gosub card2suit 
  if card2_value=$15 then c2value=$03:c2suit=$02:gosub card2number_3:gosub card2suit 
  if card2_value=$16 then c2value=$04:c2suit=$02:gosub card2number_4:gosub card2suit 
  if card2_value=$17 then c2value=$05:c2suit=$02:gosub card2number_5:gosub card2suit 
  if card2_value=$18 then c2value=$06:c2suit=$02:gosub card2number_6:gosub card2suit 
  if card2_value=$19 then c2value=$07:c2suit=$02:gosub card2number_7:gosub card2suit 
  if card2_value=$20 then c2value=$08:c2suit=$02:gosub card2number_8:gosub card2suit 
  if card2_value=$21 then c2value=$09:c2suit=$02:gosub card2number_9:gosub card2suit
  if card2_value=$22 then c2value=$10:c2suit=$02:gosub card2number_10:gosub card2suit
  if card2_value=$23 then c2value=$11:c2suit=$02:gosub card2number_J:gosub card2suit
  if card2_value=$24 then c2value=$12:c2suit=$02:gosub card2number_Q:gosub card2suit
  if card2_value=$25 then c2value=$13:c2suit=$02:gosub card2number_K:gosub card2suit
  if card2_value=$26 then c2value=$14:c2suit=$02:gosub card2number_A:gosub card2suit
  if card2_value=$27 then c2value=$02:c2suit=$03:gosub card2number_2:gosub card2suit
  if card2_value=$28 then c2value=$03:c2suit=$03:gosub card2number_3:gosub card2suit
  if card2_value=$29 then c2value=$04:c2suit=$03:gosub card2number_4:gosub card2suit
  if card2_value=$30 then c2value=$05:c2suit=$03:gosub card2number_5:gosub card2suit
  if card2_value=$31 then c2value=$06:c2suit=$03:gosub card2number_6:gosub card2suit
  if card2_value=$32 then c2value=$07:c2suit=$03:gosub card2number_7:gosub card2suit
  if card2_value=$33 then c2value=$08:c2suit=$03:gosub card2number_8:gosub card2suit
  if card2_value=$34 then c2value=$09:c2suit=$03:gosub card2number_9:gosub card2suit
  if card2_value=$35 then c2value=$10:c2suit=$03:gosub card2number_10:gosub card2suit
  if card2_value=$36 then c2value=$11:c2suit=$03:gosub card2number_J:gosub card2suit
  if card2_value=$37 then c2value=$12:c2suit=$03:gosub card2number_Q:gosub card2suit
  if card2_value=$38 then c2value=$13:c2suit=$03:gosub card2number_K:gosub card2suit
  if card2_value=$39 then c2value=$14:c2suit=$03:gosub card2number_A:gosub card2suit
  if card2_value=$40 then c2value=$02:c2suit=$00:gosub card2number_2:gosub card2suit
  if card2_value=$41 then c2value=$03:c2suit=$00:gosub card2number_3:gosub card2suit
  if card2_value=$42 then c2value=$04:c2suit=$00:gosub card2number_4:gosub card2suit
  if card2_value=$43 then c2value=$05:c2suit=$00:gosub card2number_5:gosub card2suit
  if card2_value=$44 then c2value=$06:c2suit=$00:gosub card2number_6:gosub card2suit
  if card2_value=$45 then c2value=$07:c2suit=$00:gosub card2number_7:gosub card2suit
  if card2_value=$46 then c2value=$08:c2suit=$00:gosub card2number_8:gosub card2suit
  if card2_value=$47 then c2value=$09:c2suit=$00:gosub card2number_9:gosub card2suit
  if card2_value=$48 then c2value=$10:c2suit=$00:gosub card2number_10:gosub card2suit
  if card2_value=$49 then c2value=$11:c2suit=$00:gosub card2number_J:gosub card2suit
  if card2_value=$50 then c2value=$12:c2suit=$00:gosub card2number_Q:gosub card2suit
  if card2_value=$51 then c2value=$13:c2suit=$00:gosub card2number_K:gosub card2suit
  if card2_value=$52 then c2value=$14:c2suit=$00:gosub card2number_A:gosub card2suit

  if card3_value=$01 then c3value=$02:c3suit=$01:gosub card3number_2:gosub card3suit
  if card3_value=$02 then c3value=$03:c3suit=$01:gosub card3number_3:gosub card3suit
  if card3_value=$03 then c3value=$04:c3suit=$01:gosub card3number_4:gosub card3suit
  if card3_value=$04 then c3value=$05:c3suit=$01:gosub card3number_5:gosub card3suit
  if card3_value=$05 then c3value=$06:c3suit=$01:gosub card3number_6:gosub card3suit
  if card3_value=$06 then c3value=$07:c3suit=$01:gosub card3number_7:gosub card3suit
  if card3_value=$07 then c3value=$08:c3suit=$01:gosub card3number_8:gosub card3suit
  if card3_value=$08 then c3value=$09:c3suit=$01:gosub card3number_9:gosub card3suit
  if card3_value=$09 then c3value=$10:c3suit=$01:gosub card3number_10:gosub card3suit
  if card3_value=$10 then c3value=$11:c3suit=$01:gosub card3number_J:gosub card3suit
  if card3_value=$11 then c3value=$12:c3suit=$01:gosub card3number_Q:gosub card3suit
  if card3_value=$12 then c3value=$13:c3suit=$01:gosub card3number_K:gosub card3suit
  if card3_value=$13 then c3value=$14:c3suit=$01:gosub card3number_A:gosub card3suit
  if card3_value=$14 then c3value=$02:c3suit=$02:gosub card3number_2:gosub card3suit
  if card3_value=$15 then c3value=$03:c3suit=$02:gosub card3number_3:gosub card3suit
  if card3_value=$16 then c3value=$04:c3suit=$02:gosub card3number_4:gosub card3suit
  if card3_value=$17 then c3value=$05:c3suit=$02:gosub card3number_5:gosub card3suit
  if card3_value=$18 then c3value=$06:c3suit=$02:gosub card3number_6:gosub card3suit
  if card3_value=$19 then c3value=$07:c3suit=$02:gosub card3number_7:gosub card3suit
  if card3_value=$20 then c3value=$08:c3suit=$02:gosub card3number_8:gosub card3suit
  if card3_value=$21 then c3value=$09:c3suit=$02:gosub card3number_9:gosub card3suit
  if card3_value=$22 then c3value=$10:c3suit=$02:gosub card3number_10:gosub card3suit
  if card3_value=$23 then c3value=$11:c3suit=$02:gosub card3number_J:gosub card3suit
  if card3_value=$24 then c3value=$12:c3suit=$02:gosub card3number_Q:gosub card3suit
  if card3_value=$25 then c3value=$13:c3suit=$02:gosub card3number_K:gosub card3suit
  if card3_value=$26 then c3value=$14:c3suit=$02:gosub card3number_A:gosub card3suit
  if card3_value=$27 then c3value=$02:c3suit=$03:gosub card3number_2:gosub card3suit
  if card3_value=$28 then c3value=$03:c3suit=$03:gosub card3number_3:gosub card3suit
  if card3_value=$29 then c3value=$04:c3suit=$03:gosub card3number_4:gosub card3suit
  if card3_value=$30 then c3value=$05:c3suit=$03:gosub card3number_5:gosub card3suit
  if card3_value=$31 then c3value=$06:c3suit=$03:gosub card3number_6:gosub card3suit
  if card3_value=$32 then c3value=$07:c3suit=$03:gosub card3number_7:gosub card3suit
  if card3_value=$33 then c3value=$08:c3suit=$03:gosub card3number_8:gosub card3suit
  if card3_value=$34 then c3value=$09:c3suit=$03:gosub card3number_9:gosub card3suit
  if card3_value=$35 then c3value=$10:c3suit=$03:gosub card3number_10:gosub card3suit
  if card3_value=$36 then c3value=$11:c3suit=$03:gosub card3number_J:gosub card3suit
  if card3_value=$37 then c3value=$12:c3suit=$03:gosub card3number_Q:gosub card3suit
  if card3_value=$38 then c3value=$13:c3suit=$03:gosub card3number_K:gosub card3suit
  if card3_value=$39 then c3value=$14:c3suit=$03:gosub card3number_A:gosub card3suit
  if card3_value=$40 then c3value=$02:c3suit=$00:gosub card3number_2:gosub card3suit
  if card3_value=$41 then c3value=$03:c3suit=$00:gosub card3number_3:gosub card3suit
  if card3_value=$42 then c3value=$04:c3suit=$00:gosub card3number_4:gosub card3suit
  if card3_value=$43 then c3value=$05:c3suit=$00:gosub card3number_5:gosub card3suit
  if card3_value=$44 then c3value=$06:c3suit=$00:gosub card3number_6:gosub card3suit
  if card3_value=$45 then c3value=$07:c3suit=$00:gosub card3number_7:gosub card3suit
  if card3_value=$46 then c3value=$08:c3suit=$00:gosub card3number_8:gosub card3suit
  if card3_value=$47 then c3value=$09:c3suit=$00:gosub card3number_9:gosub card3suit
  if card3_value=$48 then c3value=$10:c3suit=$00:gosub card3number_10:gosub card3suit
  if card3_value=$49 then c3value=$11:c3suit=$00:gosub card3number_J:gosub card3suit
  if card3_value=$50 then c3value=$12:c3suit=$00:gosub card3number_Q:gosub card3suit
  if card3_value=$51 then c3value=$13:c3suit=$00:gosub card3number_K:gosub card3suit
  if card3_value=$52 then c3value=$14:c3suit=$00:gosub card3number_A:gosub card3suit

  if card4_value=$01 then c4value=$02:c4suit=$01:gosub card4number_2:gosub card4suit
  if card4_value=$02 then c4value=$03:c4suit=$01:gosub card4number_3:gosub card4suit
  if card4_value=$03 then c4value=$04:c4suit=$01:gosub card4number_4:gosub card4suit
  if card4_value=$04 then c4value=$05:c4suit=$01:gosub card4number_5:gosub card4suit
  if card4_value=$05 then c4value=$06:c4suit=$01:gosub card4number_6:gosub card4suit
  if card4_value=$06 then c4value=$07:c4suit=$01:gosub card4number_7:gosub card4suit
  if card4_value=$07 then c4value=$08:c4suit=$01:gosub card4number_8:gosub card4suit
  if card4_value=$08 then c4value=$09:c4suit=$01:gosub card4number_9:gosub card4suit
  if card4_value=$09 then c4value=$10:c4suit=$01:gosub card4number_10:gosub card4suit
  if card4_value=$10 then c4value=$11:c4suit=$01:gosub card4number_J:gosub card4suit
  if card4_value=$11 then c4value=$12:c4suit=$01:gosub card4number_Q:gosub card4suit
  if card4_value=$12 then c4value=$13:c4suit=$01:gosub card4number_K:gosub card4suit
  if card4_value=$13 then c4value=$14:c4suit=$01:gosub card4number_A:gosub card4suit
  if card4_value=$14 then c4value=$02:c4suit=$02:gosub card4number_2:gosub card4suit
  if card4_value=$15 then c4value=$03:c4suit=$02:gosub card4number_3:gosub card4suit
  if card4_value=$16 then c4value=$04:c4suit=$02:gosub card4number_4:gosub card4suit
  if card4_value=$17 then c4value=$05:c4suit=$02:gosub card4number_5:gosub card4suit
  if card4_value=$18 then c4value=$06:c4suit=$02:gosub card4number_6:gosub card4suit
  if card4_value=$19 then c4value=$07:c4suit=$02:gosub card4number_7:gosub card4suit
  if card4_value=$20 then c4value=$08:c4suit=$02:gosub card4number_8:gosub card4suit
  if card4_value=$21 then c4value=$09:c4suit=$02:gosub card4number_9:gosub card4suit
  if card4_value=$22 then c4value=$10:c4suit=$02:gosub card4number_10:gosub card4suit
  if card4_value=$23 then c4value=$11:c4suit=$02:gosub card4number_J:gosub card4suit
  if card4_value=$24 then c4value=$12:c4suit=$02:gosub card4number_Q:gosub card4suit
  if card4_value=$25 then c4value=$13:c4suit=$02:gosub card4number_K:gosub card4suit
  if card4_value=$26 then c4value=$14:c4suit=$02:gosub card4number_A:gosub card4suit
  if card4_value=$27 then c4value=$02:c4suit=$03:gosub card4number_2:gosub card4suit
  if card4_value=$28 then c4value=$03:c4suit=$03:gosub card4number_3:gosub card4suit
  if card4_value=$29 then c4value=$04:c4suit=$03:gosub card4number_4:gosub card4suit
  if card4_value=$30 then c4value=$05:c4suit=$03:gosub card4number_5:gosub card4suit
  if card4_value=$31 then c4value=$06:c4suit=$03:gosub card4number_6:gosub card4suit
  if card4_value=$32 then c4value=$07:c4suit=$03:gosub card4number_7:gosub card4suit
  if card4_value=$33 then c4value=$08:c4suit=$03:gosub card4number_8:gosub card4suit
  if card4_value=$34 then c4value=$09:c4suit=$03:gosub card4number_9:gosub card4suit
  if card4_value=$35 then c4value=$10:c4suit=$03:gosub card4number_10:gosub card4suit
  if card4_value=$36 then c4value=$11:c4suit=$03:gosub card4number_J:gosub card4suit
  if card4_value=$37 then c4value=$12:c4suit=$03:gosub card4number_Q:gosub card4suit
  if card4_value=$38 then c4value=$13:c4suit=$03:gosub card4number_K:gosub card4suit
  if card4_value=$39 then c4value=$14:c4suit=$03:gosub card4number_A:gosub card4suit
  if card4_value=$40 then c4value=$02:c4suit=$00:gosub card4number_2:gosub card4suit
  if card4_value=$41 then c4value=$03:c4suit=$00:gosub card4number_3:gosub card4suit
  if card4_value=$42 then c4value=$04:c4suit=$00:gosub card4number_4:gosub card4suit
  if card4_value=$43 then c4value=$05:c4suit=$00:gosub card4number_5:gosub card4suit
  if card4_value=$44 then c4value=$06:c4suit=$00:gosub card4number_6:gosub card4suit
  if card4_value=$45 then c4value=$07:c4suit=$00:gosub card4number_7:gosub card4suit 
  if card4_value=$46 then c4value=$08:c4suit=$00:gosub card4number_8:gosub card4suit
  if card4_value=$47 then c4value=$09:c4suit=$00:gosub card4number_9:gosub card4suit
  if card4_value=$48 then c4value=$10:c4suit=$00:gosub card4number_10:gosub card4suit
  if card4_value=$49 then c4value=$11:c4suit=$00:gosub card4number_J:gosub card4suit
  if card4_value=$50 then c4value=$12:c4suit=$00:gosub card4number_Q:gosub card4suit
  if card4_value=$51 then c4value=$13:c4suit=$00:gosub card4number_K:gosub card4suit
  if card4_value=$52 then c4value=$14:c4suit=$00:gosub card4number_A:gosub card4suit

  if card5_value=$01 then c5value=$02:c5suit=$01:gosub card5number_2:gosub card5suit
  if card5_value=$02 then c5value=$03:c5suit=$01:gosub card5number_3:gosub card5suit
  if card5_value=$03 then c5value=$04:c5suit=$01:gosub card5number_4:gosub card5suit
  if card5_value=$04 then c5value=$05:c5suit=$01:gosub card5number_5:gosub card5suit
  if card5_value=$05 then c5value=$06:c5suit=$01:gosub card5number_6:gosub card5suit
  if card5_value=$06 then c5value=$07:c5suit=$01:gosub card5number_7:gosub card5suit
  if card5_value=$07 then c5value=$08:c5suit=$01:gosub card5number_8:gosub card5suit
  if card5_value=$08 then c5value=$09:c5suit=$01:gosub card5number_9:gosub card5suit
  if card5_value=$09 then c5value=$10:c5suit=$01:gosub card5number_10:gosub card5suit
  if card5_value=$10 then c5value=$11:c5suit=$01:gosub card5number_J:gosub card5suit
  if card5_value=$11 then c5value=$12:c5suit=$01:gosub card5number_Q:gosub card5suit
  if card5_value=$12 then c5value=$13:c5suit=$01:gosub card5number_K:gosub card5suit
  if card5_value=$13 then c5value=$14:c5suit=$02:gosub card5number_A:gosub card5suit
  if card5_value=$14 then c5value=$02:c5suit=$02:gosub card5number_2:gosub card5suit
  if card5_value=$15 then c5value=$03:c5suit=$02:gosub card5number_3:gosub card5suit
  if card5_value=$16 then c5value=$04:c5suit=$02:gosub card5number_4:gosub card5suit
  if card5_value=$17 then c5value=$05:c5suit=$02:gosub card5number_5:gosub card5suit
  if card5_value=$18 then c5value=$06:c5suit=$02:gosub card5number_6:gosub card5suit
  if card5_value=$19 then c5value=$07:c5suit=$02:gosub card5number_7:gosub card5suit
  if card5_value=$20 then c5value=$08:c5suit=$02:gosub card5number_8:gosub card5suit
  if card5_value=$21 then c5value=$09:c5suit=$02:gosub card5number_9:gosub card5suit
  if card5_value=$22 then c5value=$10:c5suit=$02:gosub card5number_10:gosub card5suit
  if card5_value=$23 then c5value=$11:c5suit=$02:gosub card5number_J:gosub card5suit
  if card5_value=$24 then c5value=$12:c5suit=$02:gosub card5number_Q:gosub card5suit
  if card5_value=$25 then c5value=$13:c5suit=$02:gosub card5number_K:gosub card5suit
  if card5_value=$26 then c5value=$14:c5suit=$02:gosub card5number_A:gosub card5suit
  if card5_value=$27 then c5value=$02:c5suit=$03:gosub card5number_2:gosub card5suit
  if card5_value=$28 then c5value=$03:c5suit=$03:gosub card5number_3:gosub card5suit
  if card5_value=$29 then c5value=$04:c5suit=$03:gosub card5number_4:gosub card5suit
  if card5_value=$30 then c5value=$05:c5suit=$03:gosub card5number_5:gosub card5suit
  if card5_value=$31 then c5value=$06:c5suit=$03:gosub card5number_6:gosub card5suit
  if card5_value=$32 then c5value=$07:c5suit=$03:gosub card5number_7:gosub card5suit
  if card5_value=$33 then c5value=$08:c5suit=$03:gosub card5number_8:gosub card5suit
  if card5_value=$34 then c5value=$09:c5suit=$03:gosub card5number_9:gosub card5suit
  if card5_value=$35 then c5value=$10:c5suit=$03:gosub card5number_10:gosub card5suit
  if card5_value=$36 then c5value=$11:c5suit=$03:gosub card5number_J:gosub card5suit
  if card5_value=$37 then c5value=$12:c5suit=$03:gosub card5number_Q:gosub card5suit
  if card5_value=$38 then c5value=$13:c5suit=$03:gosub card5number_K:gosub card5suit
  if card5_value=$39 then c5value=$14:c5suit=$03:gosub card5number_A:gosub card5suit
  if card5_value=$40 then c5value=$02:c5suit=$00:gosub card5number_2:gosub card5suit
  if card5_value=$41 then c5value=$03:c5suit=$00:gosub card5number_3:gosub card5suit
  if card5_value=$42 then c5value=$04:c5suit=$00:gosub card5number_4:gosub card5suit
  if card5_value=$43 then c5value=$05:c5suit=$00:gosub card5number_5:gosub card5suit
  if card5_value=$44 then c5value=$06:c5suit=$00:gosub card5number_6:gosub card5suit
  if card5_value=$45 then c5value=$07:c5suit=$00:gosub card5number_7:gosub card5suit
  if card5_value=$46 then c5value=$08:c5suit=$00:gosub card5number_8:gosub card5suit
  if card5_value=$47 then c5value=$09:c5suit=$00:gosub card5number_9:gosub card5suit
  if card5_value=$48 then c5value=$10:c5suit=$00:gosub card5number_10:gosub card5suit
  if card5_value=$49 then c5value=$11:c5suit=$00:gosub card5number_J:gosub card5suit
  if card5_value=$50 then c5value=$12:c5suit=$00:gosub card5number_Q:gosub card5suit
  if card5_value=$51 then c5value=$13:c5suit=$00:gosub card5number_K:gosub card5suit
  if card5_value=$52 then c5value=$14:c5suit=$00:gosub card5number_A:gosub card5suit
skipcardvalues
 
  plotsprite leftline 2 3 24 : plotsprite leftline 2 69 24 : plotsprite leftline 2 89 24  : plotsprite leftline 2 109 24  : plotsprite leftline 2 129 24 : plotsprite leftline2 2 150 24 
  plotchars '          #<####<####<####<####!' 2 26 2                                                                                        
  if timerFlag=$00 then plotchars '&:::::::::::::::>::::>::::>::::>' 2 6 12 : plotchars '::::::%' 2 126 12
  if timerFlag=$01 then plotchars '&:::::' 2 6 12 : plotchars '>' 2 70 12 : plotchars '>' 2 90 12 : plotchars '>::::%' 2 130 12
  if timerFlag=$01 then plotchars '>' 2 110 12 

displaywinners
  plotchars 'Royal Flush'                      0 8 textY1
  plotchars 'Straight Flush'                   0 8 textY2 
  plotchars 'Four of a Kind'                   0 8 textY3  
  plotchars 'Full House'                       0 8 textY4  
  plotchars 'Flush'                            0 8 textY5  
  plotchars 'Straight'                         0 8 textY6   
  plotchars 'Three of a Kind'                  0 8 textY7   
  plotchars 'Two Pair'                         0 8 textY8  
  plotchars 'Jacks or Better'                  0 8 textY9  
  if gameover=$01 then return 
  if statsFlag=$01 then return

  plotchars ' 250' betColor1 72 3  : plotchars ' 500' betColor2 92 3  : plotchars ' 750' betColor3 112 3  : plotchars '1000' betColor4  136 3
  plotchars ' 200' betColor1 72 4  : plotchars ' 400' betColor2 92 4  : plotchars ' 600' betColor3 112 4  : plotchars ' 800' betColor4  136 4
  plotchars '  40' betColor1 72 5  : plotchars '  80' betColor2 92 5  : plotchars ' 120' betColor3 112 5  : plotchars ' 160' betColor4  136 5
  plotchars '  16' betColor1 72 6  : plotchars '  32' betColor2 92 6  : plotchars '  48' betColor3 112 6  : plotchars '  64' betColor4  136 6
  plotchars '  12' betColor1 72 7  : plotchars '  24' betColor2 92 7  : plotchars '  36' betColor3 112 7  : plotchars '  48' betColor4  136 7
  plotchars '   8' betColor1 72 8  : plotchars '  16' betColor2 92 8  : plotchars '  24' betColor3 112 8  : plotchars '  32' betColor4  136 8
  plotchars '   3' betColor1 72 9  : plotchars '   6' betColor2 92 9  : plotchars '   9' betColor3 112 9  : plotchars '  12' betColor4  136 9
  plotchars '   2' betColor1 72 10 : plotchars '   3' betColor2 92 10 : plotchars '   4' betColor3 112 10 : plotchars '   5' betColor4  136 10
  plotchars '   1' betColor1 72 11 : plotchars '   2' betColor2 92 11 : plotchars '   3' betColor3 112 11 : plotchars '   4' betColor4  136 11

  plotchars '='  2 70 4  : plotchars '='  2 90 4  : plotchars '='  2 110 4  : plotchars '='  2 130 4
  plotchars '='  2 70 5  : plotchars '='  2 90 5  : plotchars '='  2 110 5  : plotchars '='  2 130 5
  plotchars '='  2 70 6  : plotchars '='  2 90 6  : plotchars '='  2 110 6  : plotchars '='  2 130 6 
  plotchars '='  2 70 7  : plotchars '='  2 90 7  : plotchars '='  2 110 7  : plotchars '='  2 130 7 
  plotchars '='  2 70 8  : plotchars '='  2 90 8  : plotchars '='  2 110 8  : plotchars '='  2 130 8
  plotchars '='  2 70 9  : plotchars '='  2 90 9  : plotchars '='  2 110 9  : plotchars '='  2 130 9  
  plotchars '='  2 70 10 : plotchars '='  2 90 10 : plotchars '='  2 110 10 : plotchars '='  2 130 10
  plotchars '='  2 70 11 : plotchars '='  2 90 11 : plotchars '='  2 110 11 : plotchars '='  2 130 11

 ;Pay Table    		1 coin	 2 coins  3 coins	4 coins	
 ;----------------------------------------------------
 ;Royal flush		  250	    500	    750	    1000	
 ;Straight flush	  200	    400	    600	    800	
 ;4 of a kind		  40	    80	    120	    160	
 ;Full house		  16	    32	    48	    64	
 ;Flush			      12	    24	    36	    48	
 ;Straight		      8	        16	    24	    32	
 ;3 of a kind		  3	        6	    9	    12	
 ;2 pairs		      2	        3	    4	    5	
 ;Jacks or better	  1	        2	    3	    4

  plotchars '('  2 6 4   : plotchars ')'  2 150 4 
  plotchars '('  2 6 5   : plotchars ')'  2 150 5  
  plotchars '('  2 6 6   : plotchars ')'  2 150 6   
  plotchars '('  2 6 7   : plotchars ')'  2 150 7   
  plotchars '('  2 6 8   : plotchars ')'  2 150 8   
  plotchars '('  2 6 9   : plotchars ')'  2 150 9   
  plotchars '('  2 6 10  : plotchars ')'  2 150 10   
  plotchars '('  2 6 11  : plotchars ')'  2 150 11

 ;Debugging Values
 ;  I plotted these values on screen for debugging purposes when testing the game
 ;
 ;plotvalue scoredigits_8_wide 1 handCount 2 0 12
 ;plotvalue scoredigits_8_wide 1 handComplete 2 0 14
 ;plotvalue scoredigits_8_wide 1 newhand 2 0 16 
 ;plotvalue scoredigits_8_wide 1 loseFlag 2 0 18
 ;plotvalue scoredigits_8_wide 5 bet 2 0 16
 ;plotvalue scoredigits_8_wide 5 bankFlag 2 0 18
 ;plotvalue scoredigits_8_wide 5 bet 2 0 4
 ;plotvalue scoredigits_8_wide 5 bet 2 0 6
 ;plotvalue scoredigits_8_wide 5 jacksorbetter 2 0 18
 ;plotvalue scoredigits_8_wide 5 twopair 2 0 19
 ;plotvalue scoredigits_8_wide 5 threeofakind 2 0 20
 ;plotvalue scoredigits_8_wide 5 straight 2 0 0
 ;plotvalue scoredigits_8_wide 5 straightflush 2 0 22
 ;plotvalue scoredigits_8_wide 5 flush 2 0 21
 ;plotvalue scoredigits_8_wide 5 royalflush 2 0 24
 ;plotvalue scoredigits_8_wide 5 fullhouse 2 0 24
 ;plotvalue scoredigits_8_wide 5 winner 2 0 14
 ;plotvalue scoredigits_8_wide 5 frame_counter 2 0 16
 ;plotvalue scoredigits_8_wide 5 frame_counter2 2 0 18
 ;plotvalue scoredigits_8_wide 5 winFlag 2 0 0
 ;plotvalue scoredigits_8_wide 5 loseFlag 2 0 2
 ;plotvalue scoredigits_8_wide 5 c1temp4th 2 0 3
 ;plotvalue scoredigits_8_wide 5 c2temp4th 2 0 4
 ;plotvalue scoredigits_8_wide 5 c3temp4th 2 0 6
 ;plotvalue scoredigits_8_wide 5 c4temp4th 2 0 8
 ;plotvalue scoredigits_8_wide 5 c5temp4th 2 0 2
 ;plotvalue scoredigits_8_wide 5 c1value 2 0 2
 ;plotvalue scoredigits_8_wide 5 c2value 2 0 4
 ;plotvalue scoredigits_8_wide 5 c3value 2 0 6
 ;plotvalue scoredigits_8_wide 5 c4value 2 0 8
 ;plotvalue scoredigits_8_wide 5 c5value 2 0 2
 ;plotvalue scoredigits_8_wide 5 check510 2 0 13
 ;plotvalue scoredigits_8_wide 5 c1suit 2 0 19
 ;plotvalue scoredigits_8_wide 5 c2suit 2 0 20
 ;plotvalue scoredigits_8_wide 5 c3suit 2 0 21
 ;plotvalue scoredigits_8_wide 5 c4suit 2 0 22
 ;plotvalue scoredigits_8_wide 5 c5suit 2 0 23
 ;plotvalue scoredigits_8_wide 5 checkSuits 2 0 15
 ;plotvalue scoredigits_8_wide 5 checkDoubles 2 0 25
 ;plotvalue scoredigits_8_wide 5 straight 2 0 17
 ;plotvalue scoredigits_8_wide 5 tempCheck 2 0 4
 ;plotvalue scoredigits_8_wide 5 tempFlag 2 0 6
 ;plotvalue scoredigits_8_wide 5 mathFlag 2 0 20
 ;plotvalue scoredigits_8_wide 5 displayFlag 2 0 20

 ;Joystick Debounce 
debounceOne
 if joy0fire && handComplete=$00 && select_x=128 && select_y=208 then debounce=7
  if !joy0fire && debounce=7 then debounce=9

debounceTwo
 if joy0fire && handComplete=$01 && select_x=128 && select_y=208 then debounce=3
  if !joy0fire && debounce=3 then debounce=4

debounceThree
 if joy0fire && handComplete=$02 && select_x=102 && select_y=208 then debounce=5
  if !joy0fire && debounce=5 then debounce=6

  ; Grab another card number if it's out of range (<1 or >52)
  if tempscorezLo<$01 then gosub setRandomPrice
  if tempscorezLo>$52 then gosub setRandomPrice

  ;-----Initial Draw-----
  ;Player chooses 'Draw' and handComplete=0, Selector moved to top left Drop/Hold, handComplete=1, handCount=1, reshuffle deck
  if handComplete=$00 && select_x=128 && select_y=208 && debounce=9 then clearscreen:debounce=7:gosub playdraw:newhand=$00:handComplete=$01:RandomSeed=rand:RandomSeed2=rand:handCount=$01:gosub initialize_deck:select_x=8:select_y=182:select2_y=186:;gosub checkdupes

  ;-----Second Draw-----
  ;Player chooses 'Draw' and handComplete=1, Selector NOT MOVED, handComplete=2, handCount=1, bankFlag=1, take coin(s), reshuffle deck - Hand is OVER
  if handComplete=$01 && select_x=128 && select_y=208 && debounce=4 then pause_counter=0:frame_counter2=0:bankFlag=1:debounce=3:gosub playdraw: handComplete=$02:handCount=$01: gosub takeacoin:clearscreen:gosub initialize_deck

  ;-----Third Draw (Deal New Hand)-----
  ;v49 added newhand=$01 to below line based on testing
  ;Player chooses 'Deal' and handComplete=2, Selector moved to Deal (New Hand), handComplete=3, handCount=0, reshuffle deck
  if handComplete=$02 && select_x=102 && select_y=208 && debounce=5 then clearscreen:mathFlag=$00:tempFlag=$00:gosub countemup:debounce=6:newhand=$01:playsfx sfx_newhand:select_x=128:select_y=208:select2_y=212:handComplete=$03:handCount=$00:RandomSeed=rand:RandomSeed2=rand:handCount=$01:gosub initialize_deck 
  if handComplete=$02 then card1hold=0:card2hold=0:card3hold=0:card4hold=0:card5hold=0 ;Reset Drop/Hold back to all being set to Drop

  ;-----Deal new hand-----
  ;After you move back to Draw from New hand, it resets handComplete back to zero.
  if handComplete=$03 && select_x=128 && select_y=208 && joy0fire then gosub newdeal   ;handCount=$00;-->scrambles card graphics on new hand

 ;Skip earning credits if any of the below conditions are met
 if handComplete=$00 || handComplete=$01 then goto skipBank
 if handComplete=$03 || bankFlag=0 then goto skipBank
 if twopair<>$01 && jacksorbetter<>$01 && threeofakind<>$01 && straight<>$01 && flush<>$01 && fullhouse<>$01 && fourofakind<>$01 && straightflush<>$01 && royalflush<>$01 then goto skipBank

 ;Add appropriate credits when you win
 if bet=$01 then gosub bet1:goto skipBank
 if bet=$02 then gosub bet2:goto skipBank
 if bet=$03 then gosub bet3:goto skipBank
 if bet=$04 then gosub bet4:goto skipBank
skipBank

 if handComplete=$00 then goto skipud
 if joy0down then gosub menumovedown
 if joy0up then gosub menumoveup
skipud

 if select_y=182 && joy0left then gosub playmenuselect:gosub menumoveleft
 if select_y=182 && joy0right then gosub playmenuselect:gosub menumoveright
 if handComplete=$02 then select_x=102:select_y=208:select2_y=212:goto skiplr
 if select_y=208 && joy0left then gosub playmenuselect:gosub menumovebottomleft
 if select_y=208 && joy0right then gosub playmenuselect:gosub menumovebottomright
skiplr

  winFlag=$99
  loseFlag=$99
 
  ;tempCheck=c5temp4th-c4temp4th-c3temp4th-c2temp4th-c1temp4th

  if newhand=$01 then goto displayBlanks
  if handCount>$00 then goto skipBlanks
displayBlanks
  plotsprite cardbar_back_top    5 8 108 : plotsprite cardbar_back_top    5 38 108 : plotsprite cardbar_back_top    5 68 108 : plotsprite cardbar_back_top    5 98 108 : plotsprite cardbar_back_top    5 128 108
  plotsprite cardbar_back 5 8 116 : plotsprite cardbar_back 5 38 116 : plotsprite cardbar_back 5 68 116 : plotsprite cardbar_back 5 98 116 : plotsprite cardbar_back 5 128 116
  plotsprite cardback_a 5 8 124 : plotsprite cardback_a 5 38 124 : plotsprite cardback_a 5 68 124 : plotsprite cardback_a 5 98 124 : plotsprite cardback_a 5 128 124
  plotsprite cardback_b 5 8 132 : plotsprite cardback_b 5 38 132 : plotsprite cardback_b 5 68 132 : plotsprite cardback_b 5 98 132 : plotsprite cardback_b 5 128 132
  plotsprite cardback_c 5 8 140 : plotsprite cardback_c 5 38 140 : plotsprite cardback_c 5 68 140 : plotsprite cardback_c 5 98 140 : plotsprite cardback_c 5 128 140
  plotsprite cardback_d 5 8 148 : plotsprite cardback_d 5 38 148 : plotsprite cardback_d 5 68 148 : plotsprite cardback_d 5 98 148 : plotsprite cardback_d 5 128 148
  plotsprite cardbar_back 5 8 156 : plotsprite cardbar_back 5 38 156 : plotsprite cardbar_back 5 68 156 : plotsprite cardbar_back 5 98 156 : plotsprite cardbar_back 5 128 156
  plotsprite cardbar_back 5 8 164 : plotsprite cardbar_back 5 38 164 : plotsprite cardbar_back 5 68 164 : plotsprite cardbar_back 5 98 164 : plotsprite cardbar_back 5 128 164
  plotsprite cardbar_back_bottom 5 8 172 : plotsprite cardbar_back_bottom 5 38 172 : plotsprite cardbar_back_bottom 5 68 172 : plotsprite cardbar_back_bottom 5 98 172 : plotsprite cardbar_back_bottom 5 128 172
skipBlanks

  if newhand=$01 then drawscreen:goto poker_loop
  if handCount=$00 then drawscreen:goto poker_loop

 ;Draw Card sprites on-screen
 ; Lots of them are commented out, they will plot blanks.

 ; /-----------CARD 1-------------\ /-----------CARD 2-------------\  /-----------CARD 3------------\  /-----------CARD 4-------------\  /-----------CARD 5-------------\   */
   plotsprite card_top    5 8 108 : plotsprite card_top    5 38 108 : plotsprite card_top    5 68 108 : plotsprite card_top    5 98 108 : plotsprite card_top    5 128 108
  ;plotsprite card_middle 5 8 116 : plotsprite card_middle 5 38 116 : plotsprite card_middle 5 68 116 : plotsprite card_middle 5 98 116 : plotsprite card_middle 5 128 116
  ;plotsprite card_middle 5 8 124 : plotsprite card_middle 5 38 124 : plotsprite card_middle 5 68 124 : plotsprite card_middle 5 98 124 : plotsprite card_middle 5 128 124
   plotsprite card_middle 5 8 132 : plotsprite card_middle 5 38 132 : plotsprite card_middle 5 68 132 : plotsprite card_middle 5 98 132 : plotsprite card_middle 5 128 132
  ;plotsprite card_middle 5 8 140 : plotsprite card_middle 5 38 140 : plotsprite card_middle 5 68 140 : plotsprite card_middle 5 98 140 : plotsprite card_middle 5 128 140
  ;plotsprite card_middle 5 8 148 : plotsprite card_middle 5 38 148 : plotsprite card_middle 5 68 148 : plotsprite card_middle 5 98 148 : plotsprite card_middle 5 128 148
   plotsprite card_middle 5 8 156 : plotsprite card_middle 5 38 156 : plotsprite card_middle 5  68 156 : plotsprite card_middle 5 98 156 : plotsprite card_middle 5 128 156
   plotsprite card_middle 5 8 164 : plotsprite card_middle 5 38 164 : plotsprite card_middle 5  68 164 : plotsprite card_middle 5 98 164 : plotsprite card_middle 5 128 164
  ;plotsprite card_middle 5 8 172 : plotsprite card_middle 5 38 172 : plotsprite card_middle 5 68 172 : plotsprite card_middle 5 98 172 : plotsprite card_middle 5 128 172
   plotsprite card_bottom 5 8 172 : plotsprite card_bottom 5 38 172 : plotsprite card_bottom 5 68 172 : plotsprite card_bottom 5 98 172 : plotsprite card_bottom 5 128 172
 ; \-----------CARD 1-------------/ \-----------CARD 2-------------/  \-----------CARD 3------------/   \-----------CARD 4-------------/ \-----------CARD 5-------------/        

  ;Force Specific Winning Hands
  ;  Make specific Hands here to validate the hand check subroutines. 
  ;
  ;card5_value=$52:card4_value=$39:card3_value=$51:card2_value=$38:card1_value=$02 ;2 pair
  ;card5_value=$52:card4_value=$39:card3_value=$52:card2_value=$38:card1_value=$52 ;3 of a kind
  ;card1_value=$02:card2_value=$03:card3_value=$04:card4_value=$05:card5_value=$06 ;flush
  ;card1_value=$15:card2_value=$03:card3_value=$04:card4_value=$05:card5_value=$06 ;straight
  ;card5_value=$52:card4_value=$39:card3_value=$26:card2_value=$02:card1_value=$13 ;4 of a kind
  ;card1_value=$17:card2_value=$20:card3_value=$16:card4_value=$38:card5_value=$47 ;v24 check for non-straight
  ;card1_value=$16:card2_value=$30:card3_value=$45:card4_value=$46:card5_value=$44 ;straight (out of order)
  ;card1_value=$19:card2_value=$46:card3_value=$47:card4_value=$48:card5_value=$49 ;straight (7-j)
  ;card1_value=$41:card2_value=$16:card3_value=$17:card4_value=$18:card5_value=$19 ;straight (in order)
  ;card1_value=$20:card2_value=$08:card3_value=$09:card4_value=$10:card5_value=$11 ;8H - 9D - 10D - JD - QD
  ;card1_value=$49:card2_value=$48:card3_value=$50:card4_value=$52:card5_value=$51 ;royal flush
  ;card5_value=$52:card4_value=$39:card3_value=$26:card2_value=$02:card1_value=$13 ;4 of a kind X (reported full house)
  ;card5_value=$30:card4_value=$39:card3_value=$51:card2_value=$30:card1_value=$30 ;3 of a kind   
  ;card5_value=$38:card4_value=$50:card3_value=$50:card2_value=$50:card1_value=$38 ;full house    1=5 2=3 3=4
  ;card5_value=$38:card4_value=$50:card3_value=$38:card2_value=$50:card1_value=$50 ;full house    1=3 2=4 4=5
  ;card1_value=$08:card2_value=$10:card3_value=$12:card4_value=$11:card5_value=$09 ;straight flush 
  ;card1_value=$08:card2_value=$09:card3_value=$10:card4_value=$11:card5_value=$51 ;straight 
  ;card1_value=$08:card2_value=$03:card3_value=$04:card4_value=$05:card5_value=$12 ;flush  
  ;card1_value=$42:card2_value=$43:card3_value=$44:card4_value=$45:card5_value=$52 ;flush  ;4D - $03 | AD - $13
  ;card5_value=$02:card4_value=$52:card3_value=$08:card2_value=$52:card1_value=$02 ;two pair X
  ;card5_value=$52:card4_value=$52:card3_value=$02:card2_value=$08:card1_value=$04 ;jacks or better 
  ;card1_value=$08:card2_value=$36:card3_value=$25:card4_value=$10:card5_value=$31 ;jacks oR better (All four suits $08 $36 $25 $10 $31)
  ;card1_value=$03:card2_value=$04:card3_value=$05:card4_value=$06:card5_value=$52 ;Checks special case of 1st card 4 5th card ace for NO straight/straight flush
  ;card1_value=$28:card2_value=$21:card3_value=$22:card4_value=$24:card5_value=$39 ;$31  $21  $22  $24  $38 ; incorrectly registers as straight in 1.29/30

  ;*------------------------------------------------------------------------------------------------------------------*
  ;                                      Check for winning hand combinations  
  ;*------------------------------------------------------------------------------------------------------------------*
  ;
  ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   if handComplete=$00 || handComplete=$01 then goto stopChecking ;No need to check on the first two draws
   if handComplete=$03 then goto stopChecking                     ;or right before you deal again
 
   ; --Delay fixes straight/straightflush/flush detection--
   ; This is probably going to appear as a convoluted mess.  The math & logic behind winning hand detection works fine, however the timing
   ; of checking them was causing me headaches.  I need to check for all winning combinations first,
   ; then delay one frame and check for the straight, straight flush, and flush one more time.
 
   if frame_counter2=3 then goto checkforwinners ; Wait until FrameCounter2 is 3 before checking for non-straight/straightflush/flush hands.

   frame_counter2=frame_counter2+1               ; Frame_counter2 counts to 3 and then stops.  It's reset to zero on the draw after drop/hold.
   if frame_counter2<3 then goto stopChecking    ; Wait until FrameCounter2 is 3 before checking for straight/straightflush/flush. 
   if frame_counter2>2 then frame_counter2=3     ;   ^Based on frame counting, this one runs 2nd, after the 'checkforwinners' has just run.  It's set to 3 here.

   if mathFlag=$00 then tempCheck=$00:gosub bubbleSort:tempCheck=c5temp4th-c1temp4th ; the Math Flag is set if the difference between the first and last card is 4.
        ;  if tempCheck is ever 4, permanently set mathFlag to 1, which is reset on a new deal.
        ;  I'm not sure why, but when face cards are present the difference between the first & last cards is 10, when logically it should be 4.  I check both.
        if tempCheck=$04 then gosub checkStraight:mathFlag=$01:tempFlag=$13 ; the diff between first and last cards is 4 when it's all number cards.
        if tempCheck=$0A then gosub checkStraight:mathFlag=$01:tempFlag=$13 ; the diff between 1st/lasat cards is $0A/10 when there is a face card.
  ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
stopChecking

  ; Set Win or Lose Flag
  if handComplete=$00 || handComplete=$01 then goto skipdisplay7
  if handComplete=$03 || winner=$99 then goto skipdisplay7
  if twopair=$01       then winner=$01:winFlag=$01:loseFlag=$00:goto skipdisplay7
  if jacksorbetter=$01 then winner=$01:winFlag=$01:loseFlag=$00:goto skipdisplay7
  if threeofakind=$01  then winner=$01:winFlag=$01:loseFlag=$00:goto skipdisplay7
  if straight=$01      then winner=$01:winFlag=$01:loseFlag=$00:goto skipdisplay7
  if flush=$01         then winner=$01:winFlag=$01:loseFlag=$00:goto skipdisplay7
  if fullhouse=$01     then winner=$01:winFlag=$01:loseFlag=$00:goto skipdisplay7
  if fourofakind=$01   then winner=$01:winFlag=$01:loseFlag=$00:goto skipdisplay7
  if straightflush=$01 then winner=$01:winFlag=$01:loseFlag=$00:goto skipdisplay7
  if royalflush=$01    then winner=$01:winFlag=$01:loseFlag=$00:goto skipdisplay7
  if loser=$99 then goto skipdisplay7
  if twopair<>$01 && jacksorbetter<>$01 && threeofakind<>$01 && straight<>$01 && flush<>$01 && fullhouse<>$01 && fourofakind<>$01 && straightflush<>$01 && royalflush<>$01 then loser=$01:winFlag=$00:loseFlag=$01
skipdisplay7
  
  if frame_counter2<3 && loseFlag=$01 then plotchars 'Checking' 2 63 24:drawscreen:goto poker_loop

  ; Display Loss or Win (with Winning Hand)
  ;  Irritatingly, the "Better Luck Next Time" appears breifly every time you win before it switches over correctly to "You Win".
  ;  I've added a flag in every position imaginable in this loop to try and detect that condition, and nothing worked.  I guess it's staying that way.
  if handComplete=$00 || handComplete=$01 then goto skipdisplay8
  if handComplete=$03 then goto skipdisplay8
  ; In Version 1.37, I commented out the line below so it does not display the losing message.  It will now only display a message if you win the hand.
  ;if loseFlag=$01      && handComplete=$02 then plotchars 'Better Luck Next Time'  2 11 24: plotchars 'You Lose' 7 113 24:goto skipdisplay8
skipDisplayLoss
  if fourofakind=$01   && handComplete=$02 then plotchars '4 of a kind'            2 32 24: plotchars 'You Win'  2 114 24:goto skipdisplay8
  if straightflush=$01 && handComplete=$02 then plotchars 'Straight Flush'         2 26 24: plotchars 'You Win'  2 114 24:goto skipdisplay8
  if royalflush=$01    && handComplete=$02 then plotchars 'Royal Flush'            2 32 24: plotchars 'You Win'  2 114 24:goto skipdisplay8
  if fullhouse=$01     && handComplete=$02 then plotchars 'Full House'             2 34 24: plotchars 'You Win'  2 114 24:goto skipdisplay8
  if flush=$01         && handComplete=$02 then plotchars 'Flush'                  2 44 24: plotchars 'You Win'  2 114 24:goto skipdisplay8
  if straight=$01      && handComplete=$02 then plotchars 'Straight'               2 38 24: plotchars 'You Win'  2 114 24:goto skipdisplay8
  if threeofakind=$01  && handComplete=$02 then plotchars '3 of a kind'            2 32 24: plotchars 'You Win'  2 114 24:goto skipdisplay8
  if jacksorbetter=$01 && handComplete=$02 then plotchars 'Jacks or better'        2 24 24: plotchars 'You Win'  2 114 24:goto skipdisplay8
  if twopair=$01       && handComplete=$02 then plotchars '2 Pair'                 2 42 24: plotchars 'You Win'  2 114 24:goto skipdisplay8
skipdisplay8
wincheck

  ; Game ends if you run out of coins to bet
  if coinsMed=$00 && coinsLo=$00 then newhand=$01:handComplete=$00:gameover=$01: statsFlag=$01:debounce=99:gosub countemup:savescreen:goto lasthand;:plotchars 'Game Over.' 7 8 24:plotchars 'Press fire to play again.' 2 52 24

 drawscreen
 goto poker_loop
  ;----------------------------------------------END MAIN LOOP--------------------------------------------------------------------------------
checkdupes
  ;After the initial hand (handcomplete 0), get a new card if the card you're shuffled on the next draw is the same one you already had.
  if card1hold=1 then goto skipcard1
  if card1_value=card2_value || card1_value=card3_value then gosub card1_new
  if card1_value=card4_value || card1_value=card5_value then gosub card1_new
skipcard1
  if card2hold=1 then goto skipcard2
  if card2_value=card1_value || card2_value=card4_value then gosub card2_new
  if card2_value=card3_value || card2_value=card5_value then gosub card2_new
skipcard2
  if card3hold=1 then goto skipcard3
  if card3_value=card1_value || card3_value=card4_value then gosub card3_new
  if card3_value=card2_value || card3_value=card5_value then gosub card3_new
skipcard3
  if card4hold=1 then goto skipcard4
  if card4_value=card1_value || card4_value=card3_value then gosub card4_new
  if card4_value=card2_value || card4_value=card5_value then gosub card4_new
skipcard4
  if card5hold=1 then goto skipcard5
  if card5_value=card1_value || card5_value=card3_value then gosub card5_new
  if card5_value=card2_value || card5_value=card4_value then gosub card5_new
skipcard5
  return

 ;If you run out of coins or the timer expires, do one last stats check and end the game
 ;Display final action on screen for about 3 seconds
lasthand
  restorescreen
  frame_counter=0
lasthand2
  drawwait
  frame_counter=frame_counter+1
  if frame_counter=140 then goto stats
  ;if joy0fire then goto stats
  drawscreen
  goto lasthand2
  ;winCount = scored
  ;lossCount = scoree
  ;twopairCount = scoref
  ;jacksorbetterCount = score2
  ;threeofakindCount = score3
  ;straightCount = score4
  ;flushCount = score5
  ;fullhouseCount = score6
  ;fourofakindCount = score7
  ;straightflushCount = score8
  ;royalflushCount = score9

newdeal
 clearscreen:newhand=$01:handComplete=$00
 return

  ;Count winning or losing hands for stats screen
countemup
  if twopair=$01       then scoref=scoref+1:gosub addHandsWon  ;Add one to twopair counter and one to winning hand count
  if jacksorbetter=$01 then score2=score2+1:gosub addHandsWon  ; ...etc... to all of them
  if threeofakind=$01  then score3=score3+1:gosub addHandsWon 
  if straight=$01      then score4=score4+1:gosub addHandsWon 
  if flush=$01         then score5=score5+1:gosub addHandsWon 
  if fullhouse=$01     then score6=score6+1:gosub addHandsWon 
  if fourofakind=$01   then score7=score7+1:gosub addHandsWon 
  if straightflush=$01 then score8=score8+1:gosub addHandsWon 
  if royalflush=$01    then score9=score9+1:gosub addHandsWon 
  if loseFlag=1 then scoree=scoree+1
  return

addHandsWon
 scored=scored+1
 return

menumoveup
  if !joy0up then select_x=8:select_y=182:select2_y=186:return
  goto menumoveup

menumovedown
  if !joy0down then select_x=128:select_y=208:select2_y=212:return
  goto menumovedown

menumoveleft
  if !joy0left && select_x=128 then select_x=98:return
  if !joy0left && select_x=98 then select_x=68:return
  if !joy0left && select_x=68 then select_x=38:return
  if !joy0left && select_x=38 then select_x=8:return
  if !joy0left && select_x=8 then select_x=8:return
  goto menumoveleft

menumovebottomleft
  if handComplete=$00 && select_x=128 then select_x=8:return ;if you move left from Draw before first draw, go to bet not new hand
  if handComplete=$01 then return ; can't place bet after first draw
  ;Left side, select_x=8  |  Right side, select_x=128
  if !joy0left && select_x=8 then select_x=8:return
  if !joy0left && select_x=128 then select_x=102:return
  if !joy0left && select_x=102 then select_x=8:return
  goto menumovebottomleft

menumoveright
  if !joy0right && select_x=8 then select_x=38:return
  if !joy0right && select_x=38 then select_x=68:return
  if !joy0right && select_x=68 then select_x=98:return
  if !joy0right && select_x=98 then select_x=128:return
  if !joy0right && select_x=128 then select_x=128:return
  goto menumoveright

menumovebottomright
  ;Left side, select_x=8  |  Right side, select_x=128
  if handComplete=$00 && select_x=8 then select_x=128:return ; if you move right from bet before first draw, go to draw not new hand

  if !joy0left && select_x=128 then select_x=128:return
  if !joy0left && select_x=102 then select_x=128:return
  if !joy0left && select_x=8 then select_x=102:return
  goto menumovebottomright

menumovebottomleft_alt
  ;Left side, select_x=8  |  Right side, select_x=128
  if !joy0left && select_x=8 then select_x=8:return
  if !joy0left && select_x=128 then select_x=8:return
  goto menumovebottomleft

menumovebottomright_alt
  ;Left side, select_x=8  |  Right side, select_x=128
  if !joy0left && select_x=128 then select_x=128:return
  if !joy0left && select_x=8 then select_x=128:return
  goto menumovebottomright

selectBet
  bet=bet+$01
  if bet>$04 then bet=$01
  if coinsLo=$03 && bet=$04 then bet=$03:gosub playdenied:return
  if coinsLo=$02 && bet>$02 then bet=$02:gosub playdenied:return
  if coinsLo=$01 && bet>$01 then bet=$01:gosub playdenied:return
  playsfx sfx_bet
  return

selectDraw
  if joy0fire && select_x=8   && card1hold=1 then card1hold=0:return
  if joy0fire && select_x=38  && card2hold=1 then card2hold=0:return
  if joy0fire && select_x=68  && card3hold=1 then card3hold=0:return
  if joy0fire && select_x=98  && card4hold=1 then card4hold=0:return
  if joy0fire && select_x=128 && card5hold=1 then card5hold=0:return
  if joy0fire && select_x=8   && card1hold=0 then card1hold=1:return
  if joy0fire && select_x=38  && card2hold=0 then card2hold=1:return
  if joy0fire && select_x=68  && card3hold=0 then card3hold=1:return 
  if joy0fire && select_x=98  && card4hold=0 then card4hold=1:return
  if joy0fire && select_x=128 && card5hold=0 then card5hold=1:return 
  return

bet1
 if royalflush=$01     then tempCreditsMed=$02:tempCreditsLo=$50:gosub addCredits
 if straightflush=$01  then tempCreditsMed=$02:tempCreditsLo=$00:gosub addCredits
 if fourofakind=$01    then tempCreditsMed=$00:tempCreditsLo=$40:gosub addCredits
 if fullhouse=$01      then tempCreditsLo=$16:gosub addCredits
 if flush=$01          then tempCreditsLo=$12:gosub addCredits
 if straight=$01       then tempCreditsLo=$08:gosub addCredits
 if threeofakind=$01   then tempCreditsLo=$03:gosub addCredits
 if twopair=$01        then tempCreditsLo=$02:gosub addCredits
 if jacksorbetter=$01  then tempCreditsLo=$01:gosub addCredits
bet1return
 bankFlag=0
 return
bet2
 if royalflush=$01     then tempCreditsHi=$00:tempCreditsMed=$05:tempCreditsLo=$00:gosub addCredits
 if straightflush=$01  then tempCreditsHi=$00:tempCreditsMed=$04:tempCreditsLo=$00:gosub addCredits
 if fourofakind=$01    then tempCreditsHi=$00:tempCreditsMed=$00:tempCreditsLo=$80:gosub addCredits
 if fullhouse=$01      then tempCreditsHi=$00:tempCreditsMed=$00:tempCreditsLo=$32:gosub addCredits
 if flush=$01          then tempCreditsHi=$00:tempCreditsMed=$00:tempCreditsLo=$24:gosub addCredits
 if straight=$01       then tempCreditsHi=$00:tempCreditsMed=$00:tempCreditsLo=$16:gosub addCredits
 if threeofakind=$01   then tempCreditsHi=$00:tempCreditsMed=$00:tempCreditsLo=$06:gosub addCredits
 if twopair=$01        then tempCreditsHi=$00:tempCreditsMed=$00:tempCreditsLo=$03:gosub addCredits
 if jacksorbetter=$01  then tempCreditsHi=$00:tempCreditsMed=$00:tempCreditsLo=$02:gosub addCredits
 bankFlag=0
 return
bet3
 if royalflush=$01     then tempCreditsHi=$00:tempCreditsMed=$07:tempCreditsLo=$50:gosub addCredits
 if straightflush=$01  then tempCreditsHi=$00:tempCreditsMed=$06:tempCreditsLo=$00:gosub addCredits
 if fourofakind=$01    then tempCreditsHi=$00:tempCreditsMed=$01:tempCreditsLo=$20:gosub addCredits
 if fullhouse=$01      then tempCreditsHi=$00:tempCreditsMed=$00:tempCreditsLo=$48:gosub addCredits
 if flush=$01          then tempCreditsHi=$00:tempCreditsMed=$00:tempCreditsLo=$36:gosub addCredits
 if straight=$01       then tempCreditsHi=$00:tempCreditsMed=$00:tempCreditsLo=$24:gosub addCredits
 if threeofakind=$0    then tempCreditsHi=$00:tempCreditsMed=$00:tempCreditsLo=$09:gosub addCredits
 if twopair=$01        then tempCreditsHi=$00:tempCreditsMed=$00:tempCreditsLo=$04:gosub addCredits
 if jacksorbetter=$01  then tempCreditsHi=$00:tempCreditsMed=$00:tempCreditsLo=$03:gosub addCredits
 bankFlag=0
 return
bet4
 if royalflush=$01     then tempCreditsHi=$00:tempCreditsMed=$10:tempCreditsLo=$00:gosub addCredits
 if straightflush=$01  then tempCreditsHi=$00:tempCreditsMed=$08:tempCreditsLo=$00:gosub addCredits
 if fourofakind=$01    then tempCreditsHi=$00:tempCreditsMed=$01:tempCreditsLo=$60:gosub addCredits
 if fullhouse=$01      then tempCreditsHi=$00:tempCreditsMed=$00:tempCreditsLo=$64:gosub addCredits
 if flush=$01          then tempCreditsHi=$00:tempCreditsMed=$00:tempCreditsLo=$48:gosub addCredits
 if straight=$01       then tempCreditsHi=$00:tempCreditsMed=$00:tempCreditsLo=$32:gosub addCredits
 if threeofakind=$01   then tempCreditsHi=$00:tempCreditsMed=$00:tempCreditsLo=$12:gosub addCredits
 if twopair=$01        then tempCreditsHi=$00:tempCreditsMed=$00:tempCreditsLo=$05:gosub addCredits
 if jacksorbetter=$01  then tempCreditsHi=$00:tempCreditsMed=$00:tempCreditsLo=$04:gosub addCredits
 bankFlag=0
 return

takeacoin
 if bet=$01 then scoreb=scoreb-1
 if bet=$02 then scoreb=scoreb-2
 if bet=$03 then scoreb=scoreb-3
 if bet=$04 then scoreb=scoreb-4
 return

  ;This was for testing putting a red character on red hands, but 5 at once proved too much for MARIA.
  ;--------------------------------------------------------------------------------------------------------------------------------------
  ;         CARD 1                    CARD 2                     CARD 3                      CARD 4                     CARD 5
  ; plotchars '+'  7 18 18 :   plotchars '+'  7 48 18 :   plotchars '+'  7 78 18 :   plotchars '+'  7 108 18 :   plotchars '+'  7 138 18

card1suit
 if c1suit=$00 then card1Color=5:plotsprite cardbar_clubs_top card1Color 8 140
 if c1suit=$00 then card1Color=5:plotsprite cardbar_clubs_bottom card1Color 8 148
 if c1suit=$01 then card1Color=7:plotsprite cardbar_diamonds_top card1Color 8 140    ;:plotchars '+'  7 18 18 ; This added a red suit indicator icon, removed
 if c1suit=$01 then card1Color=7:plotsprite cardbar_diamonds_bottom card1Color 8 148 ;:plotchars '+'  7 18 18 ; because it caused graphical glitches on screen.
 if c1suit=$02 then card1Color=7:plotsprite cardbar_hearts_top card1Color 8 140      ;:plotchars '+'  7 18 18 ; This was the plan originally rather than the
 if c1suit=$02 then card1Color=7:plotsprite cardbar_hearts_bottom card1Color 8 148   ;:plotchars '+'  7 18 18 ; red stripes across the entire card.
 if c1suit=$03 then card1Color=5:plotsprite cardbar_spades_top card1Color 8 140
 if c1suit=$03 then card1Color=5:plotsprite cardbar_spades_bottom card1Color 8 148
 return

card2suit
 if c2suit=$00 then card2Color=5:plotsprite cardbar_clubs_top card2Color 38 140
 if c2suit=$00 then card2Color=5:plotsprite cardbar_clubs_bottom card2Color 38 148
 if c2suit=$01 then card2Color=7:plotsprite cardbar_diamonds_top card2Color 38 140    ;:plotchars '+'  7 48 18
 if c2suit=$01 then card2Color=7:plotsprite cardbar_diamonds_bottom card2Color 38 148 ;:plotchars '+'  7 48 18
 if c2suit=$02 then card2Color=7:plotsprite cardbar_hearts_top card2Color 38 140      ;:plotchars '+'  7 48 18
 if c2suit=$02 then card2Color=7:plotsprite cardbar_hearts_bottom card2Color 38 148   ;:plotchars '+'  7 48 18
 if c2suit=$03 then card2Color=5:plotsprite cardbar_spades_top card2Color 38 140
 if c2suit=$03 then card2Color=5:plotsprite cardbar_spades_bottom card2Color 38 148
 return

card3suit
 if c3suit=$00 then card3Color=5:plotsprite cardbar_clubs_top card3Color 68 140
 if c3suit=$00 then card3Color=5:plotsprite cardbar_clubs_bottom card3Color 68 148
 if c3suit=$01 then card3Color=7:plotsprite cardbar_diamonds_top card3Color 68 140    ;:plotchars '+'  7 78 18
 if c3suit=$01 then card3Color=7:plotsprite cardbar_diamonds_bottom card3Color 68 148 ;:plotchars '+'  7 78 18
 if c3suit=$02 then card3Color=7:plotsprite cardbar_hearts_top card3Color 68 140      ;:plotchars '+'  7 78 18
 if c3suit=$02 then card3Color=7:plotsprite cardbar_hearts_bottom card3Color 68 148   ;:plotchars '+'  7 78 18
 if c3suit=$03 then card3Color=5:plotsprite cardbar_spades_top card3Color 68 140
 if c3suit=$03 then card3Color=5:plotsprite cardbar_spades_bottom card3Color 68 148
 return

card4suit
 if c4suit=$00 then card4Color=5:plotsprite cardbar_clubs_top card4Color 98 140
 if c4suit=$00 then card4Color=5:plotsprite cardbar_clubs_bottom card4Color 98 148
 if c4suit=$01 then card4Color=7:plotsprite cardbar_diamonds_top card4Color 98 140    ;:plotchars '+'  7 108 18
 if c4suit=$01 then card4Color=7:plotsprite cardbar_diamonds_bottom card4Color 98 148 ;:plotchars '+'  7 108 18
 if c4suit=$02 then card4Color=7:plotsprite cardbar_hearts_top card4Color 98 140      ;:plotchars '+'  7 108 18
 if c4suit=$02 then card4Color=7:plotsprite cardbar_hearts_bottom card4Color 98 148   ;:plotchars '+'  7 108 18
 if c4suit=$03 then card4Color=5:plotsprite cardbar_spades_top card4Color 98 140
 if c4suit=$03 then card4Color=5:plotsprite cardbar_spades_bottom card4Color 98 148
 return

card5suit
 if c5suit=$00 then card5Color=5:plotsprite cardbar_clubs_top card5Color 128 140
 if c5suit=$00 then card5Color=5:plotsprite cardbar_clubs_bottom card5Color 128 148
 if c5suit=$01 then card5Color=7:plotsprite cardbar_diamonds_top card5Color 128 140    ;:plotchars '+'  7 138 18
 if c5suit=$01 then card5Color=7:plotsprite cardbar_diamonds_bottom card5Color 128 148 ;:plotchars '+'  7 138 18
 if c5suit=$02 then card5Color=7:plotsprite cardbar_hearts_top card5Color 128 140      ;:plotchars '+'  7 138 18
 if c5suit=$02 then card5Color=7:plotsprite cardbar_hearts_bottom card5Color 128 148   ;:plotchars '+'  7 138 18
 if c5suit=$03 then card5Color=5:plotsprite cardbar_spades_top card5Color 128 140
 if c5suit=$03 then card5Color=5:plotsprite cardbar_spades_bottom card5Color 128 148
 return

 ;top number
card1number_2
 plotsprite cardbar_2_top 5 8 116 
 plotsprite cardbar_2_bottom 5 8 124 
 return

card1number_3
 plotsprite cardbar_3_top 5 8 116 
 plotsprite cardbar_3_bottom 5 8 124 
 return

card1number_4
 plotsprite cardbar_4_top 5 8 116 
 plotsprite cardbar_4_bottom 5 8 124
 return

card1number_5
 plotsprite cardbar_5_top 5 8 116 
 plotsprite cardbar_5_bottom 5 8 124 
 return

card1number_6
 plotsprite cardbar_6_top 5 8 116
 plotsprite cardbar_6_bottom 5 8 124
 return

card1number_7
 plotsprite cardbar_7_top 5 8 116
 plotsprite cardbar_7_bottom 5 8 124 
 return

card1number_8
 plotsprite cardbar_8_top 5 8 116
 plotsprite cardbar_8_bottom 5 8 124 
 return

card1number_9
 plotsprite cardbar_9_top 5 8 116
 plotsprite cardbar_9_bottom 5 8 124
 return

card1number_10
 plotsprite cardbar_10_top 5 8 116
 plotsprite cardbar_10_bottom 5 8 124 
 return

card1number_J
 plotsprite cardbar_J_top 5 8 116 
 plotsprite cardbar_J_bottom 5 8 124
 return

card1number_Q
 plotsprite cardbar_Q_top 5 8 116
 plotsprite cardbar_Q_bottom 5 8 124
 return

card1number_K
 plotsprite cardbar_K_top 5 8 116
 plotsprite cardbar_K_bottom 5 8 124 
 return

card1number_A
 plotsprite cardbar_A_top 5 8 116
 plotsprite cardbar_A_bottom 5 8 124 
 return

card2number_2
 plotsprite cardbar_2_top 5 38 116
 plotsprite cardbar_2_bottom 5 38 124 
 return

card2number_3
 plotsprite cardbar_3_top 5 38 116
 plotsprite cardbar_3_bottom 5 38 124 
 return

card2number_4
 plotsprite cardbar_4_top 5 38 116
 plotsprite cardbar_4_bottom 5 38 124 
 return

card2number_5
 plotsprite cardbar_5_top 5 38 116
 plotsprite cardbar_5_bottom 5 38 124
 return

card2number_6
 plotsprite cardbar_6_top 5 38 116
 plotsprite cardbar_6_bottom 5 38 124 
 return

card2number_7
 plotsprite cardbar_7_top 5 38 116
 plotsprite cardbar_7_bottom 5 38 124 
 return

card2number_8
 plotsprite cardbar_8_top 5 38 116
 plotsprite cardbar_8_bottom 5 38 124
 return

card2number_9
 plotsprite cardbar_9_top 5 38 116
 plotsprite cardbar_9_bottom 5 38 124 
 return

card2number_10
 plotsprite cardbar_10_top 5 38 116
 plotsprite cardbar_10_bottom 5 38 124
 return

card2number_J
 plotsprite cardbar_J_top 5 38 116
 plotsprite cardbar_J_bottom 5 38 124 
 return

card2number_Q
 plotsprite cardbar_Q_top 5 38 116
 plotsprite cardbar_Q_bottom 5 38 124 
 return

card2number_K
 plotsprite cardbar_K_top 5 38 116
 plotsprite cardbar_K_bottom 5 38 124 
 return

card2number_A
 plotsprite cardbar_A_top 5 38 116
 plotsprite cardbar_A_bottom 5 38 124
 return

card3number_2
 plotsprite cardbar_2_top 5 68 116
 plotsprite cardbar_2_bottom 5 68 124 
 return

card3number_3
 plotsprite cardbar_3_top 5 68 116
 plotsprite cardbar_3_bottom 5 68 124 
 return

card3number_4
 plotsprite cardbar_4_top 5 68 116
 plotsprite cardbar_4_bottom 5 68 124 
 return

card3number_5
 plotsprite cardbar_5_top 5 68 116
 plotsprite cardbar_5_bottom 5 68 124 
 return

card3number_6
 plotsprite cardbar_6_top 5 68 116
 plotsprite cardbar_6_bottom 5 68 124
 return

card3number_7
 plotsprite cardbar_7_top 5 68 116
 plotsprite cardbar_7_bottom 5 68 124 
 return

card3number_8
 plotsprite cardbar_8_top 5 68 116
 plotsprite cardbar_8_bottom 5 68 124 
 return

card3number_9
 plotsprite cardbar_9_top 5 68 116
 plotsprite cardbar_9_bottom 5 68 124 
 return

card3number_10
 plotsprite cardbar_10_top 5 68 116
 plotsprite cardbar_10_bottom 5 68 124 
 return

card3number_J
 plotsprite cardbar_J_top 5 68 116
    dmahole 0
 plotsprite cardbar_J_bottom 5 68 124 
 return

card3number_Q
 plotsprite cardbar_Q_top 5 68 116
 plotsprite cardbar_Q_bottom 5 68 124
 return

card3number_K
 plotsprite cardbar_K_top 5 68 116
 plotsprite cardbar_K_bottom 5 68 124 
 return

card3number_A
 plotsprite cardbar_A_top 5 68 116
 plotsprite cardbar_A_bottom 5 68 124 
 return

card4number_2
 plotsprite cardbar_2_top 5 98 116
 plotsprite cardbar_2_bottom 5 98 124 
 return

card4number_3
 plotsprite cardbar_3_top 5 98 116
 plotsprite cardbar_3_bottom 5 98 124 
 return

card4number_4
 plotsprite cardbar_4_top 5 98 116
 plotsprite cardbar_4_bottom 5 98 124

 return
 
card4number_5
 plotsprite cardbar_5_top 5 98 116
 plotsprite cardbar_5_bottom 5 98 124 
 return

card4number_6
 plotsprite cardbar_6_top 5 98 116
 plotsprite cardbar_6_bottom 5 98 124 
 return

card4number_7
 plotsprite cardbar_7_top 5 98 116
 plotsprite cardbar_7_bottom 5 98 124 
 return

card4number_8
 plotsprite cardbar_8_top 5 98 116
 plotsprite cardbar_8_bottom 5 98 124
 return

card4number_9
 plotsprite cardbar_9_top 5 98 116
 plotsprite cardbar_9_bottom 5 98 124
 return

card4number_10
 plotsprite cardbar_10_top 5 98 116
 plotsprite cardbar_10_bottom 5 98 124 
 return

card4number_J
 plotsprite cardbar_J_top 5 98 116
 plotsprite cardbar_J_bottom 5 98 124 
 return

card4number_Q
 plotsprite cardbar_Q_top 5 98 116
 plotsprite cardbar_Q_bottom 5 98 124
 return

card4number_K
 plotsprite cardbar_K_top 5 98 116
 plotsprite cardbar_K_bottom 5 98 124
 return

card4number_A
 plotsprite cardbar_A_top 5 98 116
 plotsprite cardbar_A_bottom 5 98 124 
 return

card5number_2
 plotsprite cardbar_2_top 5 128 116
 plotsprite cardbar_2_bottom 5 128 124 
 return

card5number_3
 plotsprite cardbar_3_top 5 128 116
 plotsprite cardbar_3_bottom 5 128 124 
 return

card5number_4
 plotsprite cardbar_4_top 5 128 116
 plotsprite cardbar_4_bottom 5 128 124
 return

card5number_5
 plotsprite cardbar_5_top 5 128 116
 plotsprite cardbar_5_bottom 5 128 124 
 return

card5number_6
 plotsprite cardbar_6_top 5 128 116
 plotsprite cardbar_6_bottom 5 128 124
 return

card5number_7
 plotsprite cardbar_7_top 5 128 116
 plotsprite cardbar_7_bottom 5 128 124 
 return

card5number_8
 plotsprite cardbar_8_top 5 128 116
 plotsprite cardbar_8_bottom 5 128 124 
 return

card5number_9
 plotsprite cardbar_9_top 5 128 116
 plotsprite cardbar_9_bottom 5 128 124 
 return

card5number_10
 plotsprite cardbar_10_top 5 128 116
 plotsprite cardbar_10_bottom 5 128 124
 return

card5number_J
 plotsprite cardbar_J_top 5 128 116
 plotsprite cardbar_J_bottom 5 128 124 
 return

card5number_Q
 plotsprite cardbar_Q_top 5 128 116
 plotsprite cardbar_Q_bottom 5 128 124 
 return

card5number_K
 plotsprite cardbar_K_top 5 128 116
 plotsprite cardbar_K_bottom 5 128 124
 return

card5number_A
 plotsprite cardbar_A_top 5 128 116
 plotsprite cardbar_A_bottom 5 128 124 
 return

initialize_initial_deck

card_1i
  temp1=$01:temp2=$52:gosub setRandomPrice
  card1_value=tempscorezLo
card_2i
  temp1=$01:temp2=$52:gosub setRandomPrice
  card2_value=tempscorezLo
card_3i
  temp1=$01:temp2=$52:gosub setRandomPrice
  card3_value=tempscorezLo
card_4i
  temp1=$01:temp2=$52:gosub setRandomPrice
  card4_value=tempscorezLo
card_5i
  temp1=$01:temp2=$52:gosub setRandomPrice
  card5_value=tempscorezLo

  return

 ; I made this a sub as it's called twice - once when the game starts or is re-started, and once when the cards are reshuffled.
 ; The values just need to be set to something other than 1.
resetcardvariables
 c1value=21:         c2value=22:         c3value=23:         c4value=24:       c5value=25
 pair=$26:           twopair=$27:        jacksorbetter=$90:  threeofakind=$32
 straight=$50:       flush=$42:          fullhouse=$43:      fourofakind=$44
 straightflush=$51:  royalflush=$52
 firstcardsuit=11:   check510=12
 facepair=13:        consecutive=14
 check5=19:          check10=20
 checkSuits=$21:      checkDoubles=22
 checkDiff5=23:      checkAce=24
 ; Reset the temporary values used in the bubble sort subroutine.
 c1temp4th=$00: c2temp4th=$00 : c3temp4th=$00 : c4temp4th=$00 : c5temp4th=$00: tempCheck=$99
 return

lastValue
 ;Saves the last value of the card when it's changed, so we can check for a duplicate later.
 c1LastValue=card1_value
 c2LastValue=card2_value
 c3LastValue=card3_value
 c4LastValue=card4_value
 c5LastValue=card5_value
 return

initialize_deck

 gosub resetcardvariables

 ;Before we initialize the deck, save the previous values of the cards.
 ;  so... when we draw a new card we don't draw the same card again, we'll check this value first.
 ;    ...we'll use the cardX_new subs to draw new individual cards.
 gosub lastValue
 
card_1
  if card1hold=1 then goto card_2
  temp1=$01:temp2=$52:gosub setRandomPrice
  card1_value=tempscorezLo
card_2
  if card2hold=1 then goto card_3
  temp1=$01:temp2=$52:gosub setRandomPrice
  card2_value=tempscorezLo
card_3
  if card3hold=1 then goto card_4
  temp1=$01:temp2=$52:gosub setRandomPrice
  card3_value=tempscorezLo
card_4
  if card4hold=1 then goto card_5
  temp1=$01:temp2=$52:gosub setRandomPrice
  card4_value=tempscorezLo
card_5
  if card5hold=1 then goto card_skip
  temp1=$01:temp2=$52:gosub setRandomPrice
  card5_value=tempscorezLo
card_skip

  return

card1_new
  temp1=$01:temp2=$52:gosub setRandomPrice
     dmahole 1 
  card1_value=tempscorezLo
  if card1_value=c1LastValue then goto card1_new
  return

card2_new
  temp1=$01:temp2=$52:gosub setRandomPrice
  card2_value=tempscorezLo
  if card2_value=c2LastValue then goto card2_new
  return

card3_new
  temp1=$01:temp2=$52:gosub setRandomPrice
  card3_value=tempscorezLo
  if card3_value=c3LastValue then goto card3_new
  return

card4_new
  temp1=$01:temp2=$52:gosub setRandomPrice
  card4_value=tempscorezLo
  if card4_value=c4LastValue then goto card4_new
  return

card5_new
  temp1=$01:temp2=$52:gosub setRandomPrice
  card5_value=tempscorezLo
  if card5_value=c5LastValue then goto card5_new
  return

setRandomPrice  rem given minimum and maximum decimal values between 01 and 99, set a random BCD value between them
  ;It's called Random Price because I pulled this subroutine from Death Merchant and I never renamed it.
  rem ** Input: temp1(minimum) temp2(maximum)
  rem ** Output: tempscorezLo

  tempscorezLo=0
  ; get tempscorezLo to our minimum value
  for temp3=0 to temp1
  dec tempscorezLo=tempscorezLo+1
  next
  dec temp2=temp2-temp1
  rem ** the following bit of code finds a nice bitmask, so we don't spend a long time 
  rem ** searching for a suitable random within our range...
  temp5=127
  if temp2<64 then temp5=63
  if temp2<32 then temp5=31
  if temp2<16 then temp5=15
  if temp2<8 then temp5=7
getSuitableRand
  dec temp4=rand&temp5
  if temp4=0 then return
  if temp4>temp2 then goto getSuitableRand
  for temp3=0 to temp4
  dec tempscorezLo=tempscorezLo+1
  if tempscorezLo<$01 then gosub setRandomPrice
  if tempscorezLo>$52 then gosub setRandomPrice
  next
  return

check4duplicates
  ;prevent duplicate cards from being drawn
  if card1_value=card2_value || card1_value=card3_value then gosub card1_new
  if card1_value=card4_value || card1_value=card5_value then gosub card1_new
  if card2_value=card1_value || card2_value=card4_value then gosub card2_new
  if card2_value=card3_value || card2_value=card5_value then gosub card2_new
  if card3_value=card1_value || card3_value=card4_value then gosub card3_new
  if card3_value=card2_value || card3_value=card5_value then gosub card3_new
  if card4_value=card1_value || card4_value=card3_value then gosub card4_new
  if card4_value=card2_value || card4_value=card5_value then gosub card4_new
  if card5_value=card1_value || card5_value=card3_value then gosub card5_new
  if card5_value=card2_value || card5_value=card4_value then gosub card5_new
  return

 ; ----------------------------------------------------------------------------------------------------------------------------------
 ; ---- BUBBLE SORT -----------------------------------------------------------------------------------------------------------------
 ; ----------------------------------------------------------------------------------------------------------------------------------


bubbleSort
 ; Sort Cards in ascending order
 ; A bubble sort requires n-1 maximum passes.  If you have 5 values, the maximum passes needed would be 4.

 ; --------------------------------FIRST PASS---------------------------------------------------------------------------------

 c1temp=c1value : c2temp=c2value
 if c1value>c2value then c1temp=c2value : c2temp=c1value
 c2temp2nd=c2temp:c3temp=c3value
 if c2temp>c3value then  c2temp=c3value : c3temp=c2temp2nd
 c3temp2nd=c3temp:c4temp=c4value  
 if c3temp>c4value then  c3temp=c4value : c4temp=c3temp2nd
 c4temp2nd=c4temp:c5temp=c5value
 if c4temp>c5value then  c4temp=c5value : c5temp=c4temp2nd
 c1temp2nd=c1temp : c2temp2nd=c2temp : c3temp2nd=c3temp : c4temp2nd=c4temp : c5temp2nd=c5temp

 ; --------------------------------SECOND PASS---------------------------------------------------------------------------------

 c1temp3rd=c1temp2nd : c2temp3rd=c2temp2nd
 if c1temp2nd>c2temp2nd then  c1temp2nd=c2temp2nd : c2temp2nd=c1temp3rd
 c2temp3rd=c2temp2nd : c3temp3rd=c3temp2nd
 if c2temp2nd>c3temp2nd then  c2temp2nd=c3temp2nd : c3temp2nd=c2temp3rd
 c3temp3rd=c3temp2nd:c4temp3rd=c4temp2nd 
 if c3temp2nd>c4temp2nd then  c3temp2nd=c4temp2nd : c4temp2nd=c3temp3rd
 c4temp3rd=c4temp2nd:c5temp3rd=c5temp2nd
 if c4temp3rd>c5temp3rd then  c4temp2nd=c5temp2nd : c5temp2nd=c4temp3rd
 c1temp3rd=c1temp2nd : c2temp3rd=c2temp2nd : c3temp3rd=c3temp2nd : c4temp3rd=c4temp2nd : c5temp3rd=c5temp2nd

 ; --------------------------------THIRD PASS---------------------------------------------------------------------------------

 c1temp4th=c1temp3rd  : c2temp4th=c2temp3rd
 if c1temp3rd>c2temp3rd then  c1temp3rd=c2temp3rd : c2temp3rd=c1temp4th
 c2temp4th=c2temp3rd : c3temp4th=c3temp3rd
 if c2temp3rd>c3temp3rd then  c2temp3rd=c3temp3rd : c3temp3rd=c2temp4th
 c3temp4th=c3temp3rd:c4temp4th=c4temp3rd
 if c3temp3rd>c4temp3rd then  c3temp3rd=c4temp3rd : c4temp3rd=c3temp4th
 c4temp4th=c4temp3rd:c5temp4th=c5temp3rd
 if c4temp4th>c5temp4th then  c4temp3rd=c5temp3rd : c5temp3rd=c4temp4th
 c1temp4th=c1temp3rd : c2temp4th=c2temp3rd : c3temp4th=c3temp3rd : c4temp4th=c4temp3rd : c5temp4th=c5temp3rd

 ; --------------------------------FOURTH PASS---------------------------------------------------------------------------------
 ;
 ; By the time you get to the fourth pass, the only values remaining that would possibly need sorting are the 1st and 2nd values.
 if c1temp4th>c2temp4th then c1temp4th=c2temp4th : c2temp4th=c1temp3rd

 ; -------------------------

 return

 ; ----------------------------------------------------------------------------------------------------------------------------------
 ; ---- CHECK FOR STRAIGHT, STRAIGHT FUSH, AND FLUSH---------------------------------------------------------------------------------
 ; ----------------------------------------------------------------------------------------------------------------------------------

checkStraight

 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ;Sort the cards in ascending order
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ;Check for a Straight or a Straight Flush
 ;
 ; 1. An ordered sequence is a straight if it does not contain doubles and if the first and last cards difference is 4.
 ;  My card values:  A=14, K=13, Q=12, J=11, 10=10, 9=9, 8=8, 7=7, 6=6, 5=5, 4=4, 3=3, 2=2
 ;  3/4/5/6/7, diff is 4 | 7/6/5/4/3 diff is 4 | A/K/Q/J/10 diff is 9 (special case)
 ;
 ; 2. Aces can be high or low, but cannot wrap around (K-A-2-3-4).
 ;
 ; 3. It's not a straight if cards 2,3 or 4 are an Ace.
 ; 
 ; 4. A straight can only be made if the player has a 5 or 10.
 ;
 ; 5. There can be no pairs
 ; 
 ; 6. Check and special-case the wheel (A2345), the difference is 9 rather than 4
 ;  
 ;   if ( highest rank card == ACE )
 ;     Check if other 4 cards are 
 ;           K, Q, J, 10   
 ;       or  2, 3, 4, 5
 ;
 ; 7. The cards cannot all be the same suit or it's a straight flush, not a straight.
 ; 
 ; 8. Check the hand for a sequence of cards...
 ;     - If all 5 suits match, this would be a straight flush         (Matching Suits)  
 ;     - If any of the cards are differnet suits, it would be a flush (Non-Matching Suits)
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ;If all 5 cards are the same suit then no straight
   ;   if all 5 suits match, this would be a straight flush         | checkSuits=$01  | Matching Suits     | 
   ;   if any of the cards are differnet suits, it would be a flush | checkSuits=$99 | Non-Matching Suits | 
   if c1suit=c2suit && c2suit=c3suit && c3suit=c4suit && c4suit=c5suit then checkSuits=$01 else checkSuits=$99
   if c1suit<>c2suit || c2suit<>c3suit then checkSuits=$99
   if c4suit<>c5suit || c3suit<>c4suit then checkSuits=$99
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ;There must be a 5 or a 10 to make a straight
 ;
  ;Check to see if there's a 5
   if c1temp4th=$05 || c2temp4th=$05 then check5=1
   if c3temp4th=$05 || c4temp4th=$05 then check5=1
   if c5temp4th=$05 then check5=1
  ;Check to see if there's a 10
   if c1temp4th=$10 || c2temp4th=$10 then check10=1
   if c3temp4th=$10 || c4temp4th=$10 then check10=1
   if c5temp4th=$10 then check10=1
  ;If you don't have a 5 or a 10, stop, no straight
   if check5=1 then check510=1
   if check10=1 then check510=1
   if check510=1 then goto straightContinue                    ; 5h 8h 4h ks 9c
   goto checkStraightReturn
straightContinue
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ;If there are any pairs, no straight
   if c1temp4th=c2temp4th then checkDoubles=$01                ; 5h 8h 4h ks 9c
   if c1temp4th=c3temp4th then checkDoubles=$01 
   if c1temp4th=c4temp4th then checkDoubles=$01 
   if c1temp4th=c5temp4th then checkDoubles=$01 
   if c2temp4th=c3temp4th then checkDoubles=$01 
   if c3temp4th=c4temp4th then checkDoubles=$01 
   if c4temp4th=c2temp4th then checkDoubles=$01 
   if c5temp4th=c3temp4th then checkDoubles=$01 
   if c5temp4th=c4temp4th then checkDoubles=$01 
 ;Exit sub if there are any pairs
   if checkDoubles=$01  then goto checkStraightReturn
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ;no straight if cards 2,3 or 4 are an ace
   if c2temp4th=$14 || c3temp4th=$14 then checkAce=$01         ; 5h 8h 4h ks 9c
   if c4temp4th=$14 then checkAce=$01
   if checkAce=$01 then goto checkStraightReturn
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ;Special-case the wheel (A2345)
 ;  if ( highest rank card == ACE )
 ;     Check if other 4 cards are 
 ;           K, Q, J, 10   
 ;       or  2, 3, 4, 5
 ;  else
 ;     Check if 5 cards are continuous in rank
 ;       5 4 3 2 A    Math:5-14 = -9  ace high straight
 ;       a 2 3 4 5         14-5 = 9   5 high straight
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ;card1_value=$09:card2_value=$10:card3_value=$11:card4_value=$12:card5_value=$13 ; 10 J Q K A
   ; A | 2 | 3 | 4 | 5 | Diff=9
 ;-> moved down in 1.29 if c1temp4th=$14 && c1temp4th=$02 && c1temp4th=$03 && c1temp4th=$04 && c1temp4th=$05 then straight=$01
   ; A | K | Q | J | 10| Diff=4
   ;if c1value=$14 && c1value=$13 && c1value=$12 && c1value=$11 && c1value=$10 then straight=$01
   ; 5 | 4 | 3 | 2 | A | Diff=9
 ;-> moved down in 1.29 if c1temp4th=$05 && c1temp4th=$04 && c1temp4th=$03 && c1temp4th=$02 && c1temp4th=$14 then straight=$01
   ; 10 | J | Q | K | A| Diff=4
   ; if card1temp=$10 && card1temp=$11 && card1temp=$12 && card1temp=$13 && card1temp=$14 then straight=$01
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ;Difference between first and last card must be 4, except for special cases above (9)
 ; Examples:
 ;  6 7 8 9 10        6-10 = -4
 ;  10 11 12 13 14   10-14 = -4
 ;  2 3 4 5 6         6-2  = 4  
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
continueCheck
 ;~~~~~~Royal Flush~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ; if you have AQKJ10 of the same suit, it's a royal flush                                                 ;This assumes bubble sort has put them in order already
   if c1temp4th=$10 && c2temp4th=$11 && c3temp4th=$12 && c4temp4th=$13 && c5temp4th=$14 && checkSuits=$01 then royalflush=$01:goto checkStraightReturn
                                   ;This shouldn't be needed after adding card sorting
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ;There are 3 case where tempChck would be $0A Hex (or 10 Dec) and it's not a straight flush or a straight:
 ;(A - 4)   $14 - $04 = $10  (c1value=$04 && c5value=$14)
 ;(Q - 3)   $13 - $03 = $10  (c1value=$03 && c5value=$13)
 ;(J - 2)   $12 - $02 = $10  (c1value=$02 && c5value=$12)
 ;If the first and 5th cards are those values, there's no way it can be a straight or straight flush.
 ;This counteracts the tempChck for $0A.
 ;if c1temp4th=$04 && c5temp4th=$14 then goto checkFlush
 ;if c1temp4th=$03 && c5temp4th=$13 then goto checkFlush
 ;if c1temp4th=$02 && c5temp4th=$12 then goto checkFlush
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ;Check difference between first and last card
 ;tempFlag is set to $13 if c5temp4th-c1temp4th is 4, it's checked at the end of the bubble sort.
 ;If the difference between the 5th card and the 1st card is NOT four, then it's not a straight flush or a straight, skip to flush check.
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ; Sequence Check - A sequence check is no longer needed as the bubble sort now takes care of this.
   ;if c5temp4th-c4temp4th=$01 && c4temp4th-c3temp4th=$01 && c3temp4th-c2temp4th=$01 && c2temp4th-c1temp4th=$01 then goto continuechecking
   ;if c4temp4th-c5temp4th=$01 && c3temp4th-c4temp4th=$01 && c2temp4th-c3temp4th=$01 && c1temp4th-c2temp4th=$01 then goto continuechecking
 ;goto checkStraightReturn
continuechecking
 ;if  c1suit<>c2suit && c2suit<>c3suit && c3suit<>c4suit && c4suit<>c5suit then goto checkonStraight
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ;if c1suit=c2suit && c2suit=c3suit && c3suit=c4suit && c4suit=c5suit && c5temp4th-c4temp4th<>$04 then goto checkFlush ; flush works, detects straight flush as flush
 ;if c1suit=c2suit && c2suit=c3suit && c3suit=c4suit && c4suit=c5suit && tempFlag<>$13 then goto checkFlush ; detects flush as straight flush, real straight flush works
 ;~~~~~~Straight Flush~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ; if all 5 suits match, and diff is 4, this would be a straight flush            | checkSuits=$01  | Matching Suits      
   ;if c1suit<>c2suit && c2suit<>c3suit && c3suit<>c4suit && c4suit<>c5suit && mathFlag=$00 then goto checkonStraight
   if mathFlag=$01 && checkSuits=$01 then straightflush=$01:goto checkStraightReturn
 ;~~~~~~Straight~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
checkonStraight
   ; if any of the cards are differnet suits, it would be a straight | checkSuits=$99 | Non-Matching Suits  
   ;if c1suit=c2suit && c2suit=c3suit && c3suit=c4suit && c4suit=c5suit && mathFlag=$00 then goto checkFlush
   if mathFlag=$01 && checkSuits=$99 then straight=$01:goto checkStraightReturn
   ;if tempFlag=$13 && checkSuits=$99 then straight=$01:goto checkStraightReturn
   ;if c1temp4th-c5temp4th=$04 && checkSuits=$99 then straight=$01   
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
checkFlush
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ; Flush
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ;if royalflush=$01 || straightflush=$01 then flush=$98:goto stopChecking
 ;if straight=$01 then goto stopChecking
  ;If all 5 cards are of the same suit, you have a flush.  Simple as that.
  if c1suit=c2suit && c2suit=c3suit && c3suit=c4suit && c4suit=c5suit then flush=$01
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
checkStraightReturn

 return

 ; ----------------------------------------------------------------------------------------------------------------------------------
 ; ---- CHECK FOR WINNING HANDS (OTHER THAN STRAIGHT, STRAIGHT FLUSH, AND FLUSH) ----------------------------------------------------
 ; ----------------------------------------------------------------------------------------------------------------------------------

checkforwinners

 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ;Two Pair Check
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ; If we already have a royal flush, straight flush, or straight, no need to check for anything else -
 ; the sub jumps immediately back.
 if royalflush=$01 || straightflush=$01 then goto stopChecking
 if straight=$01 then goto stopChecking
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ;  1     2     3     4     5
 ; ---   ---   ---   ---   ---
 ;  x     x     y     y
 ;  x     x     y           y
 ;  x     x           y     y
 ;  x           x     y     y
 ;        x     x     y     y
 ; ---   ---   ---   ---   ---
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ; 1=2 and 3=4
 ; 1=2 and 3=5
 ; 1=2 and 4=5
 ; 1=3 and 4=5
 ; 2=3 and 4=5
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ;  1     2     3     4     5
 ; ---   ---   ---   ---   ---
 ;  x     y     x     y
 ;  x     y     x           y
 ;  x     y           x     y
 ;  x           y     x     y
 ;        x     y     x     y
 ; ---   ---   ---   ---   ---
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ; 1=3 and 2=4
 ; 1=3 and 2=5
 ; 1=4 and 2=5
 ; 1=4 and 3=5
 ; 2=4 and 3=5
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ;  1     2     3     4     5
 ; ---   ---   ---   ---   ---
 ;  y     x     y     x
 ;  y     x     y           x
 ;  y     x           y     x
 ;  y           x     y     x
 ;        y     x     y     x
 ; ---   ---   ---   ---   ---
 ; 
 ;  1     2     3     4     5
 ; ---   ---   ---   ---   ---
 ;  y     y     x     x
 ;  y     y     x           x
 ;  y     y           x     x
 ;   y           y     x     x
 ;        y     y     x     x
 ; ---   ---   ---   ---   ---
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
 ; 1=2 and 3=4
 ; 1=2 and 3=5
 ; 1=2 and 4=5
 ; 1=3 and 4=5
 ; 2=3 and 4=5
 ; 1=3 and 2=4
 ; 1=3 and 2=5
 ; 1=4 and 2=5
 ; 1=4 and 3=5
 ; 2=4 and 3=5
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ;  1     2     3     4     5
 ; ---   ---   ---   ---   ---
 ;  x           y     y     x
 ;  x     y     y           x
 ;        x     y     y     x
 ;        x     y     x     y
 ;  x     y     y     x
 ;  x           y     y     x
 ;  x     y           y     x
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ; *1=4 and 2=3     v1.18 - caught this mistake
 ; *1=5 and 2=4     v1.27 - caught this mistake
 ; 1=5 and 2=3 v57
 ; 1=5 and 3=4
 ; 1=2 and 4=5
 ; 2=5 and 3=4
 ; 2=4 and 3=5
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 if c1value=c5value && c2value=c4value then twopair=$01 
 if c1value=c5value && c2value=c3value then twopair=$01 
 if c1value=c5value && c3value=c4value then twopair=$01
 if c2value=c5value && c3value=c4value then twopair=$01
 if c1value=c4value && c2value=c3value then twopair=$01
 if c1value=c2value && c3value=c4value then twopair=$01 
 if c1value=c2value && c3value=c4value then twopair=$01
 if c1value=c2value && c4value=c5value then twopair=$01
 if c1value=c3value && c4value=c5value then twopair=$01
 if c2value=c3value && c4value=c5value then twopair=$01
 if c1value=c3value && c2value=c4value then twopair=$01
 if c1value=c3value && c2value=c5value then twopair=$01
 if c1value=c4value && c2value=c5value then twopair=$01
 if c1value=c4value && c3value=c5value then twopair=$01
 if c2value=c4value && c3value=c5value then twopair=$01
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

checkfourofakind

 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  /* Four of a Kind
  ------------------------------------------------------
     Check for: x x x x y
     Check for: x x x y x
     Check for: x x y x x
     Check for: x y x x x
     Check for: y x x x x
  ------------------------------------------------------- */
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  if c1value=c2value && c2value=c3value && c3value=c4value then fourofakind=$01
  if c1value=c2value && c2value=c3value && c3value=c5value then fourofakind=$01
  if c1value=c2value && c2value=c4value && c4value=c5value then fourofakind=$01
  if c1value=c3value && c3value=c4value && c4value=c5value then fourofakind=$01
  if c2value=c3value && c3value=c4value && c4value=c5value then fourofakind=$01
 
  dmahole 2 

checkFullHouse
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ;If we already have a four of a kind, we don't need to check for a full house, it's a better hand.
 if fourofakind=$01 then goto finishChecking
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ; Full House
 ; ---   ---   ---   ---   ---
 ;  1     2     3     4     5
 ; ---   ---   ---   ---   ---
 ;  x     x     x     y     y   1=2 2=3 4=5
 ;  x     x     y     y     x  *1=2 3=4 2=5   
 ;  x     x     y     x     y   1=2 2=4 3=5    
 ;  x     y     x     x     y  *1=3 3=4 2=5
 ;  x     y     y     x     x  *1=4 4=5 2=3
 ; ---   ---   ---   ---   ---
 ;  x     x     y     y     x  *1=2 3=4 2=5
 ;  y     x     x     y     x  *1=4 2=3 3=5
 ;  x     y     y     x     x  *1=4 2=3 4=5 
 ;  y     x     y     x     x  *1=3 2=4 4=5
 ;  y     y     x     x     x   1=2 3=4 4=5
 ; ---   ---   ---   ---   ---
 ;  x     y     x     y     x   1=3 3=5 2=4
 ;  y     x     x     x     y   1=5 2=3 3=4 
 ; ---   ---   ---   ---   ---
 ;  x     y     x     y     y  -  1=3 2=4 4=5 dupe
 ;  y     y     x     y     x  -  1=2 2=4 3=5 dupe
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 if c1value=c3value && c3value=c5value && c2value=c4value then fullhouse=$01 ;1=3 3=5 2=4
 if c1value=c5value && c2value=c3value && c3value=c4value then fullhouse=$01 ;1=5 2=3 3=4 
 ;---------------------------------------------------------------------------------------
 if c1value=c2value && c2value=c3value && c4value=c5value then fullhouse=$01 ;1=2 2=3 4=5
 if c1value=c2value && c3value=c4value && c2value=c5value then fullhouse=$01 ;1=2 3=4 2=5  
 if c1value=c2value && c2value=c4value && c3value=c5value then fullhouse=$01 ;1=2 2=4 3=5
 if c1value=c3value && c3value=c4value && c2value=c5value then fullhouse=$01 ;1=3 3=4 2=5
 if c1value=c4value && c4value=c5value && c2value=c3value then fullhouse=$01 ;1=4 4=5 2=3 
 ;---------------------------------------------------------------------------------------
 if c1value=c2value && c3value=c4value && c2value=c5value then fullhouse=$01 ;1=2 3=4 2=5
 if c1value=c4value && c2value=c3value && c3value=c5value then fullhouse=$01 ;1=4 2=3 3=5
 if c1value=c4value && c2value=c3value && c4value=c5value then fullhouse=$01 ;1=4 2=3 4=5 
 if c1value=c3value && c2value=c4value && c4value=c5value then fullhouse=$01 ;1=3 2=4 4=5
 if c1value=c2value && c3value=c4value && c4value=c5value then fullhouse=$01 ;1=2 3=4 4=5
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

checkthreeofakind

 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ; 3 of a kind
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ; We don't need to check for three of a kind if we already have four of a kind or a full house.
  if fourofakind=$01 || fullhouse=$01 then goto finishChecking
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ;  1     2     3     4     5
 ; ---   ---   ---   ---   ---
 ;  x     x     x               
 ;  x     x                 x    
 ;  x     x           x          
 ;  x           x     x          
 ;  x                 x     x    
 ; ---   ---   ---   ---   ---
 ;  x     x                 x    
 ;        x     x           x    
 ;  x                 x     x    
 ;        x           x     x    
 ;              x     x     x    
 ; ---   ---   ---   ---   ---
 ;  x           x           x    
 ;        x     x     x          
 ; ---   ---   ---   ---   ---
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ;First card leads
 ;---------------------------------------------------------------------     -----TESTING-----            
 if c1value=c2value && c2value=c3value then threeofakind=$01  ; 1=2 2=3      XXX..      X.X.X
 if c1value=c2value && c2value=c4value then threeofakind=$01  ; 1=2 2=4      XX.X.      XX..X
 if c1value=c2value && c2value=c5value then threeofakind=$01  ; 1=2 2=5      XX..X      X.X.X
 ;                                                            ;                         X..XX
 if c1value=c3value && c3value=c4value then threeofakind=$01  ; 1=3 3=4      X.XX.   
 if c1value=c3value && c3value=c5value then threeofakind=$01  ; 1=3 3=5      X.X.X      X..XX
 if c1value=c4value && c4value=c5value then threeofakind=$01  ; 1=4 4=5      X..XX      X.XX.
 ;                                                            ;
 ;Second Card leads                                           ;
 ;---------------------------------------------------------------------      -----TESTING-----         
 if c2value=c3value && c3value=c4value then threeofakind=$01  ; 2=3 3=4      .XXX.      .X.XX
 if c2value=c3value && c3value=c5value then threeofakind=$01  ; 2=3 3=5      .XX.X      
                                                              ;                         ..XXX
 if c2value=c4value && c4value=c5value then threeofakind=$01  ; 2=4 4=5      .X.XX      .X.XX
                                                              ;                         X..XX
 ;Third Card leads                                            ;                         
 ;---------------------------------------------------------------------      -----TESTING-----  
 if c3value=c4value && c4value=c5value then threeofakind=$01  ; 3=4 4=5      ..XXX
 ;
 ;Fourth and Fifth card leads are all already covered by the above.
 ;---------------------------------------------------------------------      -----TESTING----- 
 ; 
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

checkJB

 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ; Jacks or better Logic 
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ; We don't need to check for a jacks or better pair if we already have
 ; two pair, four of a kind, flush, or full house, those are better hands.
  if twopair=$01 || fourofakind=$01 then goto finishChecking
  if flush=$01 || fullhouse=$01 then goto finishChecking
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ; Detect a Pair of Jacks between any of the 5 cards
 ; Results in a positive condition for at least one pair, doesn't check for two pair.
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ;Detect a pair of Jacks or better
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 if c1value=$11 && c2value=$11 then jacksorbetter=$01 ; 1=2
 if c1value=$11 && c3value=$11 then jacksorbetter=$01 ; 1=3
 if c1value=$11 && c4value=$11 then jacksorbetter=$01 ; 1=4
 if c1value=$11 && c5value=$11 then jacksorbetter=$01 ; 1=5
 if c2value=$11 && c3value=$11 then jacksorbetter=$01 ; 2=3
 if c2value=$11 && c4value=$11 then jacksorbetter=$01 ; 2=4
 if c2value=$11 && c5value=$11 then jacksorbetter=$01 ; 2=5
 if c3value=$11 && c4value=$11 then jacksorbetter=$01 ; 3=4
 if c3value=$11 && c5value=$11 then jacksorbetter=$01 ; 3=5
 if c4value=$11 && c5value=$11 then jacksorbetter=$01 ; 4=5
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ;Detect a pair of Queens or better
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 if c1value=$12 && c2value=$12 then jacksorbetter=$01
 if c1value=$12 && c3value=$12 then jacksorbetter=$01
 if c1value=$12 && c4value=$12 then jacksorbetter=$01
 if c1value=$12 && c5value=$12 then jacksorbetter=$01
 if c2value=$12 && c3value=$12 then jacksorbetter=$01
 if c2value=$12 && c4value=$12 then jacksorbetter=$01
 if c2value=$12 && c5value=$12 then jacksorbetter=$01
 if c3value=$12 && c4value=$12 then jacksorbetter=$01
 if c3value=$12 && c5value=$12 then jacksorbetter=$01
 if c4value=$12 && c5value=$12 then jacksorbetter=$01
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ;Detect a pair of Kings or better
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 if c1value=$13 && c2value=$13 then jacksorbetter=$01
 if c1value=$13 && c3value=$13 then jacksorbetter=$01
 if c1value=$13 && c4value=$13 then jacksorbetter=$01
 if c1value=$13 && c5value=$13 then jacksorbetter=$01
 if c2value=$13 && c3value=$13 then jacksorbetter=$01
 if c2value=$13 && c4value=$13 then jacksorbetter=$01
 if c2value=$13 && c5value=$13 then jacksorbetter=$01
 if c3value=$13 && c4value=$13 then jacksorbetter=$01
 if c3value=$13 && c5value=$13 then jacksorbetter=$01
 if c4value=$13 && c5value=$13 then jacksorbetter=$01
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ;Detect a pair of Aces or better
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 if c1value=$14 && c2value=$14 then jacksorbetter=$01
 if c1value=$14 && c3value=$14 then jacksorbetter=$01
 if c1value=$14 && c4value=$14 then jacksorbetter=$01
 if c1value=$14 && c5value=$14 then jacksorbetter=$01
 if c2value=$14 && c3value=$14 then jacksorbetter=$01
 if c2value=$14 && c4value=$14 then jacksorbetter=$01
 if c2value=$14 && c5value=$14 then jacksorbetter=$01
 if c3value=$14 && c4value=$14 then jacksorbetter=$01
 if c3value=$14 && c5value=$14 then jacksorbetter=$01
 if c4value=$14 && c5value=$14 then jacksorbetter=$01
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

finishChecking
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ;Check for a royal flush, straight, or straight flush last.
  gosub checkStraight
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ;Return to the main subroutine 
  goto stopChecking
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

addCredits
   asm
    sed
    lda creditsLo
    clc ;sec
    adc tempCreditsLo
    sta creditsLo
    lda creditsMed
    adc tempCreditsMed
    sta creditsMed
    lda creditsHi
    adc tempCreditsHi
    sta creditsHi
    cld
end
  return 

subtractCredits
   asm
    sed
    lda creditsLo
    sec
    sbc tempCreditsLo
    sta creditsLo
    lda creditsMed
    sbc tempCreditsMed
    sta creditsMed
    lda creditsHi
    sbc tempCreditsHi
    sta creditsHi
    cld
end
  return   

titlescreen
  return

AALogoDraw
  plotsprite aa_left_1b 4 45 56
  plotsprite aa_left_2b 4 45 64
  plotsprite aa_left_3b 4 45 72
  plotsprite aa_left_4b 4 45 80
  plotsprite aa_right_1 5 85 56
  plotsprite aa_right_2 5 85 64
  plotsprite aa_right_3 5 85 72
  plotsprite aa_right_4 5 85 80
 return 

 data sfx_menumove
 $10,$01,$02 
 $06,$04,$0F 
 $0C,$04,$08 
 $18,$04,$04 
 $31,$04,$02 
 $00,$00,$00
end

  data sfx_menuselect
  $10,$04,$02 ; version, priority, frames per chunk
  $00,$06,$05 ; first chunk of freq,channel,volume data 
  $01,$06,$02 
  $02,$06,$01 
  $03,$06,$01
  $00,$00,$00 
end

 data sfx_newhand
 $10,$10,$00 ; version, priority, frames per chunk
 $0a,$06,$0f ; first chunk of freq,channel,volume
 $0a,$06,$0f
 $0a,$06,$06
 $0c,$04,$02
 $1b,$0c,$01
 $07,$06,$0f
 $0a,$06,$0f
 $0a,$06,$0f
 $0a,$06,$07
 $07,$04,$06
 $07,$04,$04
 $07,$06,$0f
 $07,$06,$0d
 $07,$04,$0e
 $07,$04,$06
 $07,$04,$03
 $0a,$06,$09
 $0a,$06,$0f
 $07,$04,$0f
 $07,$04,$05
 $07,$04,$05
 $1b,$0c,$08
 $07,$04,$0d
 $07,$04,$07
 $07,$04,$07
 $07,$04,$03
 $07,$04,$07
 $07,$04,$05
 $07,$04,$03
 $07,$04,$01
 $00,$00,$00
end

  data sfx_cavalry
  $10,$07,$05 ; version, priority, frames per chunk
  $1D,$04,$08 ; first chunk of freq,channel,volume data 
  $1A,$04,$08
  $17,$04,$08
  $13,$04,$08
  $17,$04,$08
  $13,$04,$08
  $13,$04,$08
  $00,$00,$00 
end

 data sfx_denied
 $10,$10,$00 ; version, priority, frames per chunk
 $1e,$06,$00 ; first chunk of freq,channel,volume
 $0a,$06,$01
 $1e,$06,$02
 $1e,$06,$04
 $1e,$06,$05
 $0f,$06,$0f
 $0f,$06,$0f
 $0f,$06,$0f
 $0f,$06,$0d
 $0f,$06,$0f
 $0f,$06,$0f
 $0f,$06,$0f
 $0f,$06,$0f
 $07,$06,$08
 $07,$06,$06
 $0f,$06,$06
 $0f,$06,$04
 $0f,$06,$02
 $00,$00,$00
end

 data sfx_draw
 $10,$10,$00 ; version, priority, frames per chunk
 $1c,$07,$02 ; first chunk of freq,channel,volume
 $02,$07,$06
 $1e,$08,$09
 $11,$08,$09
 $1e,$08,$09
 $11,$07,$06
 $1e,$08,$09
 $11,$07,$06
 $0e,$07,$03
 $06,$07,$02
 $00,$00,$00
end

 data sfx_bet
 $10,$10,$00 ; version, priority, frames per chunk
 $0c,$0c,$09 ; first chunk of freq,channel,volume
 $0c,$0c,$0f
 $0c,$0c,$0f
 $0c,$0c,$0f
 $0c,$0c,$0f
 $1e,$04,$0f
 $1e,$04,$0e
 $07,$0c,$0f
 $07,$0c,$0f
 $07,$0c,$0b
 $1e,$04,$0b
 $07,$0c,$0c
 $0c,$0c,$09
 $07,$0c,$07
 $07,$0c,$06
 $07,$0c,$05
 $07,$0c,$04
 $07,$0c,$04
 $07,$0c,$03
 $07,$0c,$03
 $07,$0c,$02
 $07,$0c,$02
 $07,$0c,$01
 $07,$0c,$01
 $00,$00,$00
end

playdenied
 playsfx sfx_denied
 return


