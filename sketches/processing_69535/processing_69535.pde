
//Luis Valle, CP1, 16-17, Penguin/Make Any Animal
//http://lufvalprogramming.webs.com/Programs/BrianGriffin.html
background(255,255,255);
smooth();
size(700,700);
fill(0,0,0);
ellipse(59,52,20,32);                       //black nose
fill(255,255,255);
ellipse(102,23,16,27);                      //left ear
ellipse(105,20,16,16);                      //left eye
bezier(57,35,59,30,65,24,107,24);           //top half of nose
bezier(57,68,60,85,108,80,108,83);          //bottom half of nose
ellipse(116,21,16,16);                      //right eye
stroke(255,255,255);
rect(90,26,19,19);
stroke(0,0,0);
bezier(109,19,118,18,122,19,124,22);       //right eyelid
bezier(98,17,107,16,108,19,108,20);        //left eyelid
fill(0,0,0);
ellipse(119,21,3,3);                       //right pupil
ellipse(105,20,3,3);                       //left pupil
fill(255,255,255);                         
bezier(108,12,113,8,131,10,134,15);        //head
bezier(134,15,137,12,144,13,145,17);       //left ear 1
bezier(142,14,146,14,149,21,149,31);       //left ear 2 
bezier(149,31,150,49,130,45,134,31);       //left ear 3
line(147,41,147,79);                       //neck
bezier(92,83,100,92,138,89,147,79);        //top of collar
bezier(92,94,100,103,138,98,147,91);       //bottom of collar
line(92,83,92,94);
line(147,79,147,91);
noFill();                                  //collar filling
strokeWeight(8);
stroke(239,25,77);
bezier(95,89,102,97,135,95,144,86);
strokeWeight(1);
stroke(0,0,0);
line(101,99,101,104);                      //pendant string
fill(255,228,106);                         //pendant gold
ellipse(101,109,8,10);                     //actual pendant
noFill();
bezier(147,91,154,94,160,112,159,117);
bezier(159,117,160,119,163,140,162,144);
fill(255,255,255);
line(162,144,163,149);                     //hand 1
arc(150,155,10,12,0,PI/1.1);               //bottom finger
arc(155,153,7,8,0,PI/1.1);                 //middle finger
arc(160,150,7,8,0,PI/1.1);                 //top finger
bezier(137,110,145,130,140,153,145,157);
bezier(160,154,160,160,152,170,150,175);
line(150,175,150,206);                     //left leg
bezier(150,206,142,215,116,217,104,211);   //left foot
bezier(117,214,113,212,113,207,117,205);
bezier(109,213,105,210,106,205,109,204);
bezier(104,211,103,200,103,200,113,193);
triangle(158,162,165,173,152,172);         //tail
bezier(113,193,112,188,112,175,115,172);
bezier(104,211,85,213,75,208,75,205);
bezier(75,205,73,197,78,191,85,190);
bezier(83,209,82,207,83,201,86,200);
bezier(78,208,76,205,77,201,79,200);
bezier(85,189,82,184,84,169,86,154);
bezier(86,154,78,142,80,115,87,105);
noFill();
bezier(92,94,81,102,74,140,75,152);
bezier(75,152,76,158,79,160,85,159);
bezier(80,147,79,152,83,155,85,154);
