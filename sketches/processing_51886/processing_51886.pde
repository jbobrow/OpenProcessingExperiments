
/* Program:     Cowboy dance move
   Programmer:  Ann Peterson
   Date:        Feb 6, 2012
   Description: Chapter One practice

Peudocode:
1) Make body core in center
2) make legs
3) left arm
4) right arm
5) circle head
6) top hat  */

background (153,255,153);

//Body core
stroke (204,0,0);
fill (204,0,0);
rect (30,30,10,5);
rect (32,35,10,5);
rect (34,40,10,5);

//Right Leg
stroke (0,0,0);
fill (51,0,153);
rect (40,47,10,4);
ellipse (53,49,4,4);
rect (52,52,4,10);
rect (52,60,6,4);

//Left Leg
rect (34,48,4,10);
ellipse (36,61,4,4);
rect (34,64,4,10);
rect (34,73,6,4);

//Right Arm
fill (255,255,51);
rect (25,30,3,14);
rect (24,46,4,3);

//Left Arm
rect (42,30,7,3);
ellipse (52,30,3,3);
rect (50,20,3,8);

//Head then Hat
ellipse (37,21,10,13);
fill (0,0,0);
rect (31,13,12,6);
line (25,20,50,20);











