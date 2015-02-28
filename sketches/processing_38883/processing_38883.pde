
// Name: Jennifer Lau
// Assignment: Coding the Stadia ii med 

size (500,500);
smooth ();


// Background //
noStroke();
background (224, 213, 183);
fill (211, 208, 189);
quad (0,253,500,256,500,446,0,449);

//quad without stroke--upper left//
stroke (0);
strokeWeight (2);
noFill();
quad (-1,12, 20, 12, 22, 45, -1, 45);
quad (32, 13, 95 ,13, 92, 42, 31, 43);
quad (106, 13, 166, 13, 124, 45, 98, 45);

fill(215,225,224);
strokeWeight (0.25);
quad (419,52,442,53,500,166,500,251);

strokeWeight (4);
stroke (51,70,100);
line (0,36, 36,10);

//quad
fill (170,169,151);
noStroke ();
quad (62,163,63,164,0,177,0,174);
quad (0,191, 94, 166,94, 167, 0,193);
quad (0,261,140,176,141,176,0,267);
quad (0,363, 190, 168,191, 168,0,376);
quad (223, 172, 224, 172, 114, 500, 95, 500);
quad (349, 500, 258, 170, 259, 170, 370, 500);
quad (500, 415, 280, 174, 281, 174, 500, 399);
quad (500, 290, 317, 174, 318, 174, 500, 284);
quad (362, 175, 363,174, 500, 229, 500, 233);
quad (500, 202, 390, 171, 391, 171, 500, 200);


//lines//
strokeWeight (4);
stroke (188, 51, 58);
line (0,18,498,130); /* redline */
stroke (0);
line (377,351,500,342);
line (0,415,500,401);


stroke (0);
strokeWeight (2);
line (92,208,500,197);
line(133,210,262,139);
line(260,198,305,395);
line(379,247,500,238);
line (500,254,469,233);
line(469,233,500,221);
line (360,214,500,309);
line (376,247,442,250);
line (0,488,45,500);
line (317,500,500,453);
line (91,0,255,62);
stroke (51,70,100);
line (395,0,440,48);

//ellipses//
noStroke ();
fill (45,78,149);
ellipse (22,80,16,16); //blue ellipse
ellipse (45,143, 16,16);
ellipse (110,181,16,16);
ellipse (236,232,16,16);
ellipse (234,95,8,8);
ellipse (243, 95, 8,8);
ellipse ( 435,106,10,10);
ellipse (440,101,10,10);
ellipse (356,55,10,10);
ellipse (358,50,10,10);
ellipse (494,193,8,8);

///red ellipse//
fill (216,82,33);
ellipse (354,113,10,10);
ellipse (465,48,10,10);
ellipse (472,37,12,12);

//yellow//
fill (252, 188,56);
quad (479,246,500,246,500,255,479,255);
ellipse ( 263,357,178,61);
ellipse ( 263,274,103,26);
ellipse ( 263,220,56,9);

stroke (220,115,90); /*orange line*/
line (0,290,210,301);

noFill();
strokeWeight (4);
stroke (66,87,106);
ellipseMode (CORNER);
arc(103, 238, 856, 269, radians(95) , radians(225));


 
strokeWeight (2);
  stroke (0);
  beginShape();
  curveVertex(442, 250); // the first control point
  curveVertex(442, 250);
  curveVertex(442, 253);
  curveVertex(409,276);
  curveVertex(417, 322);
  curveVertex(500,381);
  curveVertex(500,381);
  endShape();
  
  beginShape();
  curveVertex(326, 156); // the first control point
  curveVertex(326, 156);
  curveVertex(443, 231);
  curveVertex(457, 268);
  curveVertex(457, 268);
  endShape();
  
  stroke (0);
  strokeWeight (1);
  line (0,226,61,248);
  line(61,248,0,292);
  
  stroke (223,110,44);
  strokeWeight (2);
  line(0,290,211,302);
  
  stroke (40,63,94);
  strokeWeight (4);
  line (0,132,500,287);

