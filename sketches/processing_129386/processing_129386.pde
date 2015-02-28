
int richting;
int richting2;
int richting3;
int richting4;
int richting5;
int richting6;
int richting7;
int richting8;
int counter;
boolean kleur;
void setup(){
size (1400,500);
frameRate(60);
richting = 100;
kleur = true;
counter = 0;
}

void draw(){
   
 println(counter);
 println(kleur);
 
 if (counter == 25){ 
  kleur= !kleur;

}

  if (kleur=true){
background(61,110,130);
  }
   if (kleur=false){
background(50);
  }
  
     //* F18-A horizon
//* Engine blocks
stroke(0);
fill(99,99,99);
rect(richting8+84,67,9,12);
rect(richting8+86,67,10,12);



//* tail connection
stroke(0);
fill(101,101,101);
rect(richting8+96,69,9,8);



//*backside bulb
fill(101,100,100);
ellipse(richting8+120,82,40,9);

//* airpressure tool
rect(richting8+268,66,9,2);



//*Cockpit expansion
fill(102,102,102);
ellipse(richting8+241,65,54,18);



//* frontside bulb
fill(121,119,119);
ellipse(richting8+229,81,61,9);



//* cockpit Glass
fill(102,127,173);
ellipse(richting8+237,62,40,20);





//* Plane body
fill(126,126,126);
rect(richting8+101,65,157,17);



//* Exhaust block
rect(richting8+204,65,25,13);
fill(152,152,152);
rect(richting8+229,66,5,8);
fill(158,152,152);
rect(richting8+234,68,2,3);



//* Weaponry block I
rect(richting8+172,78,39,10);
rect(richting8+210,82,3,-3);
rect(richting8+210,86,3,-4);
rect(richting8+210,88,3,-3);
rect(richting8+122,107,22,-2);



//* FFAR rocket pod heads
stroke(0);
fill(58,14,14);
//* third
triangle(richting8+214,78,richting8+213,83,richting8+220,80);
//* second
triangle(richting8+213,83,richting8+213,84,richting8+221,83);
//* first
triangle(richting8+213,83,richting8+219,86,richting8+213,88);



//* Bomb
  stroke(255);
  fill(15,42,13);
  stroke(0);
ellipse(richting8+175,95,45,9);
stroke(104,104,104);
  fill(122,122,122);
  ellipse(richting8+184,94,3,8);
stroke(228,255,0);
  fill(0,0,0);
  rect(richting8+182,90,1,8);
  stroke(0);
  fill(5,46,3);
  rect(richting8+146,90,8,11);
  


//*Weapon stacks
fill(131,129,129);
rect(richting8+146,87,46,2);
rect(richting8+151,103,-27,2);
rect(richting8+239,68,12,2);
rect(richting8+134,101,46,3);




//* stinger stack
stroke(0);
fill(190,190,190);
rect(richting8+155,104,8,2);
rect(richting8+143,102,11,6);



//* Rocket
stroke(0);
fill(104);
triangle(richting8+167,104,richting8+166,109,richting8+174,106);
stroke(0);
fill(137);
rect(richting8+133,106,34,3);
stroke(255,0,0);
fill(179,176,176);
rect(richting8+159,106,1,2);
stroke(255,0,0);
fill(richting8+180,195,177);
rect(richting8+132,102,1,2);
stroke(140,140,143);
fill(46,30,30);
rect(richting8+138,106,1,2);
stroke(0);
fill(108);
rect(richting8+129,106,2,6);
stroke(0);
fill(87);
rect(richting8+129,108,-4,3);



//* rocket II
stroke(0);
fill(118);
triangle(richting8+166,100,richting8+165,104,richting8+174,102);
stroke(0);
fill(150);
rect(richting8+131,100,34,4);
stroke(255,0,0);
fill(240,215,215);
rect(richting8+159,101,1,2);
stroke(255,0,0);
fill(202,180,180);
rect(richting8+132,100,1,2);
stroke(140,140,143);
fill(1,1,1);
rect(richting8+147,100,1,2);
stroke(0);
fill(106);
rect(richting8+129,101,2,4);
stroke(0);
fill(87);
rect(richting8+130,101,-4,3);



//* Wings
stroke(0);
fill(146,144,144);
triangle(richting8+97,36,richting8+123,65,richting8+100,65);
triangle(richting8+226,64,richting8+141,65,richting8+132,106);
triangle(richting8+123,65,richting8+99,66,richting8+84,89);
triangle(richting8+99,65,richting8+77,47,richting8+123,66);
triangle(richting8+283,74,richting8+258,82,richting8+258,65);
triangle(richting8+121,66,richting8+221,51,richting8+220,64);
rect(richting8+241,49,-3,16);



//* U letter
rect(richting8+238,74,1,1);
rect(richting8+240,74,1,1);



//* N letter
rect(richting8+247,72,1,1);
rect(richting8+247,74,1,1);

richting8 = richting8 +1;

if(richting8 > 3000){
  richting8 = -600;
  counter = counter + 1;
}




//* cloud
fill(255);
stroke(255);
ellipse(richting +75,146,92,63);
ellipse(richting+23,122,128,76);
ellipse(richting +110,79,191,94);
ellipse(richting +170,973,164,64);

richting = richting-31;

if(richting < -300){
  richting = 1702;
  counter= counter + 1;
  
}


//* cloud II ( big one on the low side)
ellipse(richting2+284,418,174,90);
ellipse(richting2+243,383,106,76);
ellipse(richting2+180,431,114,94);
ellipse(richting2+270,460,97,64);

richting2 = richting2 -21;

if(richting2 < -370){
  richting2 = 1702;
  counter= counter + 1;
}
  //* cloud III
ellipse(richting3+ 29,306,70,37);
ellipse(richting3 -0,324,45,45);
ellipse(richting3 -22,311,52,50);
ellipse(richting3 +4,288,60,45);

richting3 = richting3 -4;

if(richting3 < -300){
  richting3 = 1702;
  counter= counter + 1;
}
    //* cloud IV
ellipse(richting5+ 29,99,70,37);
ellipse(richting5 -0,118,45,45);
ellipse(richting5 -22,78,52,50);
ellipse(richting5 +-46,109,60,45);

richting5 = richting5 -2;

if(richting5 < -300){
  richting5 = 1702;
  counter= counter + 1;
}
      //* cloud V
ellipse(richting5+ -285,449,62,23);
ellipse(richting5 -296,469,34,26);
ellipse(richting5 -299,434,35,26);
ellipse(richting5 +-318,456,34,23);

richting6 = richting6 -1;

if(richting6 < -300){
  richting6 = 1702;
  counter= counter + 1;
}
//* Harrier
//* Engine blocks
stroke(0);
fill(34,34,34);
rect(55,mouseY-13,19,24);
rect(53,mouseY-13,20,24);

//* tail connection
stroke(0);
fill(60,68,84);
rect(84,mouseY-19,64,37);

//*backside bulb
fill(47,41,-9);
ellipse(115,mouseY+15,101,13);

//*Cockpit expansion
fill(47,43,-9);
ellipse(314,mouseY-15,216,27);

//* frontside bulb
fill(47,41,-9);
ellipse(320,mouseY+13,122,18);

//* cockpit Glass
fill(60,68,84);
ellipse(357,mouseY-21,107,35);

//* Plane body
fill(47,52,-9);
rect(76,mouseY+-17,333,34);

//* Exhaust block
rect(265,mouseY-13,50,25);
fill(45,37,37);
rect(315,mouseY-8,10,15);
fill(47,52,-9);
rect(325,mouseY-3,4,5);

//* Weaponry block I
rect(207,mouseY+15,50,20);
rect(257,mouseY+19,6,4);
rect(257,mouseY+35,6,-5);
rect(257,mouseY+29,6,-5);
rect(122,mouseY+72,44,-3);

//* FFAR rocket pod heads
stroke(0);
fill(71,58,58);
//* third
triangle(264,mouseY+25,264,mouseY+19,272,mouseY+22);
//* second
triangle(264,mouseY+23,264,mouseY+30,272,mouseY+27);
//* first
triangle(264,mouseY+29,264,mouseY+35,272,mouseY+32);

//* Bomb
  stroke(255);
  fill(0);
  stroke(0);
ellipse(206,mouseY+57,90,17);
stroke(104,104,104);
  fill(122,122,122);
  ellipse(218,mouseY+57,5,16);
stroke(228,255,0);
  fill(254,251,34);
  rect(217,mouseY+50,2,15);
  stroke(0);
  fill(0);
  rect(145,mouseY+44,16,21);
  
 
//*Weapon stacks
fill(47,52,-9);
rect(129,mouseY+47,91,4);
rect(336,mouseY-12,48,-2);
rect(410,mouseY+6,58,4);
rect(270,mouseY-27,92,9);

//* stinger stack
stroke(0);
fill(47,52,-9);
rect(166,mouseY+69,23,4);
rect(144,mouseY+69,22,12);


//* Rocket
stroke(0);
fill(255);
triangle(196,mouseY+76,187,mouseY+73,187,mouseY+78);
stroke(0);
fill(255);
rect(119,mouseY+73,68,5);
stroke(255,0,0);
fill(255,0,0);
rect(180,mouseY+73,2,4);
stroke(255,0,0);
fill(255,0,0);
rect(122,mouseY+74,2,3);
stroke(140,140,143);
fill(114,mouseY+114,114);
rect(175,mouseY+74,2,3);
stroke(0);
fill(255);
rect(115,mouseY+70,4,11);
stroke(0);
fill(255);
rect(115,mouseY+73,-7,5);

//* rocket II
stroke(0);
fill(255);
triangle(196,mouseY+84,187,mouseY+86,187,mouseY+81);
stroke(0);
fill(255);
rect(119,mouseY+81,68,5);
stroke(255,0,0);
fill(255,0,0);
rect(180,mouseY+82,2,4);
stroke(255,0,0);
fill(255,0,0);
rect(122,mouseY+82,2,3);
stroke(140,140,143);
fill(114,114,114);
rect(175,mouseY+82,2,3);
stroke(0);
fill(255);
rect(115,mouseY+80,4,8);
stroke(0);
fill(255);
rect(115,mouseY+81,-7,5);


//* Wings
stroke(0);
fill(47,52,-9);
triangle(76,mouseY-58,117,mouseY-16,75,mouseY-15);
triangle(353,mouseY-18,119,mouseY+73,144,mouseY-18);
triangle(119,mouseY-17,50,mouseY+37,76,mouseY-15);
triangle(469,mouseY+0,409,mouseY-17,409,mouseY+16);
triangle(144,mouseY-19,281,mouseY-35,281,mouseY-19);
rect(365,mouseY-40,-3,22);



//* U letter
rect(345,mouseY-6,1,1);
rect(345,mouseY-4,1,1);
rect(345,mouseY-2,1,1);
rect(345,mouseY+0,1,1);
rect(345,mouseY+1,1,1);
rect(345,mouseY+3,1,1);
rect(347,mouseY+3,1,1);
rect(349,mouseY+3,1,1);
rect(351,mouseY+3,1,1);
rect(353,mouseY+3,1,1);
rect(353,mouseY+1,1,1);
rect(353,mouseY-1,1,1);
rect(353,mouseY-3,1,1);
rect(353,mouseY-5,1,1);
rect(353,mouseY-6,1,1);

//* S letter
rect(364,mouseY-6,1,1);
rect(362,mouseY-6,1,1);
rect(360,mouseY-6,1,1);
rect(366,mouseY-6,1,1);
rect(360,mouseY-4,1,1);
rect(360,mouseY-2,1,1);
rect(360,mouseY+0,1,1);
rect(362,mouseY+0,1,1);
rect(364,mouseY+0,1,1);
rect(366,mouseY+0,1,1);
rect(366,mouseY+2,1,1);
rect(366,mouseY+4,1,1);
rect(365,mouseY+4,1,1);
rect(363,mouseY+4,1,1);
rect(361,mouseY+4,1,1);
rect(360,mouseY+4,1,1);

//* Body Connection block
fill(47,54,-9);
rect(281,mouseY-27,39,-8);

//* cloud V
fill(255);
stroke(255);
ellipse(richting4+ 984,250,38,27);
ellipse(richting4 +1001,229,42,28);
ellipse(richting4 +958,214,72,50);
ellipse(richting4 +952,235,52,22);

richting4 = richting4-20;

if(richting4 < -1200){
  richting4 = 1002;
  counter= counter + 1;
}
  //* F18-A
//* Engine blocks
stroke(0);
fill(99,99,99);
rect(richting7+55,361,19,24);
rect(richting7+53,361,20,24);



//* tail connection
stroke(0);
fill(101,101,101);
rect(richting7+84,355,64,37);



//*backside bulb
fill(101,100,100);
ellipse(richting7+123,390,96,17);



//*Cockpit expansion
fill(102,102,102);
ellipse(richting7+317,359,222,36);



//* frontside bulb
fill(121,119,119);
ellipse(richting7+320,388,122,18);



//* cockpit Glass
fill(102,127,173);
ellipse(richting7+357,352,107,35);





//* Plane body
fill(126,126,126);
rect(richting7+76,357,333,34);



//* Exhaust block
rect(richting7+265,361,50,25);
fill(152,152,152);
rect(richting7+315,371,10,15);
fill(158,152,152);
rect(richting7+325,381,4,5);



//* Weaponry block I
rect(richting7+207,388,50,20);
rect(richting7+257,395,6,-5);
rect(richting7+257,403,6,-8);
rect(richting7+257,408,6,-5);
rect(richting7+122,446,44,-3);



//* FFAR rocket pod heads
stroke(0);
fill(58,14,14);
//* third
triangle(richting7+264,398,richting7+263,392,richting7+273,396);
//* second
triangle(richting7+264,397,richting7+264,403,richting7+272,401);
//* first
triangle(richting7+264,408,richting7+264,403,richting7+272,406);



//* Bomb
  stroke(255);
  fill(15,42,13);
  stroke(0);
ellipse(richting7+206,428,90,17);
stroke(104,104,104);
  fill(122,122,122);
  ellipse(richting7+218,428,5,16);
stroke(228,255,0);
  fill(0,0,0);
  rect(richting7+217,420,2,15);
  stroke(0);
  fill(5,46,3);
  rect(richting7+145,418,16,21);
  


//*Weapon stacks
fill(131,129,129);
rect(richting7+129,418,91,4);
rect(richting7+336,367,48,-3);
rect(richting7+410,360,41,3);
rect(richting7+270,348,92,9);





//* stinger stack
stroke(0);
fill(190,190,190);
rect(richting7+166,443,23,4);
rect(richting7+144,443,22,12);



//* Rocket
stroke(0);
fill(104);
triangle(richting7+196,449,richting7+187,451,richting7+187,447);
stroke(0);
fill(137);
rect(richting7+119,447,68,5);
stroke(255,0,0);
fill(179,176,176);
rect(richting7+180,447,2,4);
stroke(255,0,0);
fill(richting7+177,177,177);
rect(richting7+122,448,2,3);
stroke(140,140,143);
fill(46,30,30);
rect(richting7+175,448,2,3);
stroke(0);
fill(108);
rect(richting7+115,445,4,11);
stroke(0);
fill(87);
rect(richting7+115,447,-7,5);



//* rocket II
stroke(0);
fill(118);
triangle(richting7+196,457,richting7+187,460,richting7+187,456);
stroke(0);
fill(150);
rect(richting7+119,455,68,5);
stroke(255,0,0);
fill(240,215,215);
rect(richting7+180,456,2,4);
stroke(255,0,0);
fill(202,180,180);
rect(richting7+122,456,2,3);
stroke(140,140,143);
fill(1,1,1);
rect(richting7+175,456,2,3);
stroke(0);
fill(106);
rect(richting7+115,455,4,8);
stroke(0);
fill(87);
rect(richting7+115,455,-7,5);



//* Wings
stroke(0);
fill(146,144,144);
triangle(richting7+76,353,richting7+120,357,richting7+76,300);
triangle(richting7+318,356,richting7+114,453,richting7+143,358);
triangle(richting7+120,358,richting7+50,405,richting7+76,358);
triangle(richting7+54,310,richting7+75,357,richting7+120,358);
triangle(richting7+469,374,richting7+409,391,richting7+409,356);
triangle(richting7+141,357,richting7+318,356,richting7+318,332);
rect(richting7+365,335,-3,22);



//* U letter
rect(richting7+345,370,1,1);
rect(richting7+345,372,1,1);
rect(richting7+345,374,1,1);
rect(richting7+345,376,1,1);
rect(richting7+345,380,1,1);
rect(richting7+345,378,1,1);
rect(richting7+347,380,1,1);
rect(richting7+349,380,1,1);
rect(richting7+351,380,1,1);
rect(richting7+353,380,1,1);
rect(richting7+353,378,1,1);
rect(richting7+353,376,1,1);
rect(richting7+353,374,1,1);
rect(richting7+353,372,1,1);
rect(richting7+353,370,1,1);



//* N letter
rect(richting7+364,370,1,1);
rect(richting7+362,370,1,1);
rect(richting7+360,370,1,1);
rect(richting7+366,370,1,1);
rect(richting7+360,372,1,1);
rect(richting7+360,374,1,1);
rect(richting7+360,376,1,1);
rect(richting7+360,378,1,1);
rect(richting7+366,372,1,1);
rect(richting7+366,374,1,1);
rect(richting7+366,376,1,1);
rect(richting7+366,378,1,1);
rect(richting7+366,380,1,1);
rect(richting7+360,380,1,1);

richting7 = richting7 +3;

if(richting7 > 7000){
  richting7 = -3000;
  counter = counter + 1;
}
}


