 ;Bubble Sort Test with 5 Values
 ;Steve Engelhardt 8/3/2022
 
 displaymode 320A

 set tv ntsc
 set basepath card_gfx
 set screenheight 208
 set zoneheight 8
 set romsize 32k

 dim c1value=var1
 dim c2value=var2
 dim c3value=var3
 dim c4value=var4
 dim c5value=var5

 dim c1temp=$2700
 dim c2temp=$2701
 dim c3temp=$2702
 dim c4temp=$2703
 dim c5temp=$2704

 dim c1temp2nd=$2705
 dim c2temp2nd=$2706
 dim c3temp2nd=$2707
 dim c4temp2nd=$2708
 dim c5temp2nd=$2709

 dim c1temp3rd=var36
 dim c2temp3rd=var37
 dim c3temp3rd=var38
 dim c4temp3rd=var39
 dim c5temp3rd=var40

 dim c1temp4th=var41
 dim c2temp4th=var42
 dim c3temp4th=var43
 dim c4temp4th=var61
 dim c5temp4th=var62

 dim c1temp5th=var62
 dim c2temp5th=var63
 dim c3temp5th=var64
 dim c4temp5th=var65
 dim c5temp5th=var66



 ;dim cardArray=$2705 ; and $2706, $2707, $2708, $2709
  dim cardArray=a ; and b,c,d,e

 P0C2=$BA: rem Aqua        ; Poker Hand Text for Payouts
 P1C2=$0A: rem Dark Grey   ; Paylines that are not highlighted
 P2C2=$8C: rem Blue        ; Logo and Box
 P3C2=$2C: rem Yellow      ; Selector Box
 P4C2=$B6: rem Green       ; Bottom Buttons
 P5C2=$0E: rem Light Gray  ; Greyed out buttons     
 P6C2=$3A: rem Orange      ; Credits and Coin Text Color
 P7C2=$46: rem Red         ; Drop Text and Loser Text Colors, Red Card Backs

 incgraphic atascii.png 320A 
 incgraphic scoredigits_8_wide.png 320A 0 1 2 
 characterset atascii
 alphachars ASCII

 c1value=$05
 c2value=$04
 c3value=$03
 c4value=$02
 c5value=$01

main

 drawwait
 clearscreen
 if joy0fire then gosub assignValues

 gosub bubbleSort
 
 if joy0up then c1value=c1value+$01
 if joy0down then c2value=c2value+$01
 if joy0left then c3value=c3value+$01
 if joy0right then c4value=c4value+$01
 if joy0fire then c5value=c5value+$01

 plotchars 'Bubble Sort Test' 2 10 0
 plotchars '-------------------------------' 2 10 1

 plotchars 'Initial Values' 0 10 3
 plotvalue scoredigits_8_wide 3 c1value 2 48 5
 plotvalue scoredigits_8_wide 3 c2value 2 58 5
 plotvalue scoredigits_8_wide 3 c3value 2 68 5
 plotvalue scoredigits_8_wide 3 c4value 2 78 5
 plotvalue scoredigits_8_wide 3 c5value 2 88 5
 plotchars '1' 7 50 6
 plotchars '2' 7 60 6
 plotchars '3' 7 70 6
 plotchars '4' 7 80 6
 plotchars '5' 7 90 6
 
 plotchars 'Sorted' 0 10 8
 plotchars '1st Pass' 0 12 10
 plotvalue scoredigits_8_wide 5 c1temp 2 62 10
 plotvalue scoredigits_8_wide 5 c2temp 2 72 10
 plotvalue scoredigits_8_wide 5 c3temp 2 82 10
 plotvalue scoredigits_8_wide 5 c4temp 2 92 10
 plotvalue scoredigits_8_wide 5 c5temp 2 102 10

 plotchars '2nd Pass' 0 12 12
 plotvalue scoredigits_8_wide 5 c1temp2nd 2 62 12
 plotvalue scoredigits_8_wide 5 c2temp2nd 2 72 12
 plotvalue scoredigits_8_wide 5 c3temp2nd 2 82 12
 plotvalue scoredigits_8_wide 5 c4temp2nd 2 92 12
 plotvalue scoredigits_8_wide 5 c5temp2nd 2 102 12

 plotchars '3rd Pass' 0 12 14
 plotvalue scoredigits_8_wide 5 c1temp3rd 2 62 14
 plotvalue scoredigits_8_wide 5 c2temp3rd 2 72 14
 plotvalue scoredigits_8_wide 5 c3temp3rd 2 82 14
 plotvalue scoredigits_8_wide 5 c4temp3rd 2 92 14
 plotvalue scoredigits_8_wide 5 c5temp3rd 2 102 14

 plotchars 'Final Pass' 0 12 16 ;: plotchars 'Final' 0 112 16
 plotvalue scoredigits_8_wide 6 c1temp4th 2 62 16
 plotvalue scoredigits_8_wide 6 c2temp4th 2 72 16
 plotvalue scoredigits_8_wide 6 c3temp4th 2 82 16
 plotvalue scoredigits_8_wide 6 c4temp4th 2 92 16
 plotvalue scoredigits_8_wide 6 c5temp4th 2 102 16

 plotchars '-------------------------------' 2 10 18
 plotchars 'Up    Increase Value 1' 2 10 19
 plotchars 'Down  Increase Value 2' 2 10 20
 plotchars 'Left  Increase Value 3' 2 10 21
 plotchars 'Right Increase Value 4' 2 10 22
 plotchars 'Fire  Increase Value 5' 2 10 23
 plotchars '-------------------------------' 2 10 25

 drawscreen
 goto main

assignValues

 return

bubbleSort
 ;  A bubble sort requires n-1 maximum passes.  If you have 5 values, the maximum passes needed would be 4.

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

 return