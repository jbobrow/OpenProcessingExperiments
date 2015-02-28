
size(640,480);
smooth();
background(230,221,202);

noStroke();
//fill(80,124,44);
fill(122,132,75);
triangle(373,191,200,0,180,0); //green med slash



strokeWeight(6);
strokeCap(SQUARE);
//stroke(250,225,0);
stroke(249,219,59);
//line(27,47,209.5,-5);//yellow short vert
line(40,60,209.5,-5);

stroke(0);
//line(26,43,199,-5);//black short vert
line(38,55.5,199,-5);//black short vert


fill(0);
noStroke();
triangle(361,177,189,0,200,0);//black med slash

////BIG BLOCK
fill(203,131,54);
quad(0,136,0,325,171,377,176,86);
fill(48,81,64);
quad(176,86,171,377,319,422,215,75);
///BIG BLOCK
////**************************///
stroke(0);
line(179,0,171,480);//left verticle
//
//strokeWeight(8);
fill(0);
ellipse(114,207,180,180);

noStroke();
//blue arcs
fill(22,79,148);

arc(114, 207,178,178, 4.4, 4.65);
arc(114, 207,178,178, 4.85, 5.3);

arc(114, 207,178,178, 0.1, 0.55);

arc(114, 207,178,178, 1.2, 1.9);
arc(114, 207,178,178, 2.3, 2.8);
//yellow arcs
fill(245,219,89);
arc(114, 207,178,178, 6, 6.16);
arc(114, 207,178,178, 3.2, 3.6);
//white arcs
fill(230);
arc(114, 207,178,178, 4.7, 4.733);
arc(114, 207,178,178, 4.77, 4.8);

arc(114, 207,178,178, 1.95, 1.98);
arc(114, 207,178,178, 2.03, 2.06);
arc(114, 207,178,178, 2.12, 2.15);
arc(114, 207,178,178, 2.21, 2.24);
//

//middle circle
stroke(0);
strokeWeight(3);
fill(218,220,226);
ellipse(114,207,150,150);
//small dot circle
fill(0);
noStroke();
ellipse(129,205.6,30,30);

//Spikes
noStroke();
fill(245,238,220);
triangle(108,182,0,82,0,119);//bg spike
fill(214,65,42);
triangle(108,182,61,138,50,148);//red spike

quad(29,108,15,129,24.5,133,36.5,116);
fill(0);//black stripes on spike
quad(39.5,118.3,27,135.5,31.5,137,42.5,122.2);
quad(44.5,123.7,34.3,139.3,37.5,141.7,48,126.6);
quad(49.6,128.3,41,141.3,43.6,143.6,51.6,130.3);

stroke(0);
strokeWeight(1.4);
line(18.3,103.3,-2.3,87.3);
line(15,106,-2.3,93);
line(13,110,-2.3,98);
line(11.5,113.5,-2.3,104);
line(9,118,-2.3,109);

////
line(16.3,97.5,3.8,118.5);
line(11.8,95,0,116.5);
line(8.6,91.6,0,105);
line(4.8,87.5,0,95);
////WEB SPIKE
noFill();
strokeWeight(3);
quad(-2,82,-2,116.8,7.3,122,20,100);
///RIGHT SPIKE Small
noStroke();

fill(214,65,42);
triangle(152,180,260,108,268,119 );//red spike
fill(230);
quad(189,154,193,159,221,144.6,216,137);//white strip spike
fill(0);
quad(271.6,99,281,113,352,73,342.6,49);//black strip spike

//thick circle stroke
stroke(0);
strokeWeight(7);
noFill();
ellipse(114,207,180,180);
///BOTTOM SPIKE
noStroke();
fill(245,238,220);
triangle(147,233,238,480,273,480);//bg spike
fill(214,65,42);
triangle(147,233,165,284,171.6,279);//red spike


fill(0);//black stripes on bottom spike
quad(197.4,328.7,184,334,186,339.5,200,334.7);
quad(203,341,188.7,346.5,191.75,354,207.75,349);
quad(210,356.5,194.5,362,196,368.75,213.5,363);
fill(213,181,61); //yellow 
quad(213.5,363,196,368.75,239.5,480,272,480);


///
///GOLDEN STRIPE
noStroke();
fill(165,100,28);
quad(447,192,531,480,545.5,480,479,179);
quad(486,178,575,480,592,480,519,167.5);   
quad(550,66.75,640,418, 640,358.5,578,57);   
triangle(571,14,622,0,567,0);
////BLACK BOX FILLS
fill(0);
quad(376,114.5,387,160.5,434,145,423,102);
quad(434,145,445,190.5,479,180,470,133.5);
triangle(470,134.5,476,131,439,0);

///BLACK BOX LINE
stroke(0);
strokeWeight(3);

line(358,28,370,70);
line(358+6,28-1,370+6,70-1);
line(358+12,28-2,370+12,70-2);
line(358+18,28-4,370+18,70-3);
line(358+24,28-6,370+24,70-4);
line(358+30,28-8,370+30,70-5);
line(358+36,28-10,370+36,70-6);

int slineX = 470;
int slineX2 = 480;

int slineY = 90;
int slineY2 = 128;

strokeWeight(1);
line(slineX,slineY ,slineX2,slineY2);
line(slineX+4,slineY -1,slineX2+4,slineY2-1);
line(slineX+8,slineY -2,slineX2+8,slineY2-2);
line(slineX+12,slineY -3,slineX2+12,slineY2-3);
line(slineX+16,slineY -4,slineX2+16,slineY2-4);
line(slineX+20,slineY -5,slineX2+20,slineY2-5);
line(slineX+24,slineY-6,slineX2+24,slineY2-6);
///
/// DOTS FILL
strokeWeight(3);
int dotX =473;
int dotY =27;
int dotX2 = 478;
int dotY2 =31;
//1st
line(dotX,dotY,dotX2,dotY2);
line(dotX-14,dotY+9,dotX2-14,dotY2+9);
line(dotX-8,dotY+9,dotX2-8,dotY2+9);
line(dotX-8,dotY-5,dotX2-8,dotY2-3);
line(dotX+3,dotY+9,dotX2+3,dotY2+9);
line(dotX+6,dotY+9,dotX2+6,dotY2+9);
//2nd
line(dotX-8,dotY,dotX2-8,dotY2);
line(dotX-16,dotY+4,dotX2-16,dotY2+4);
line(dotX+6,dotY+4,dotX2+6,dotY2+4);
line(dotX-24,dotY+4,dotX2-24,dotY2+4);
line(dotX-20,dotY+8,dotX2-20,dotY2+8);
//3rd
line(dotX-20,dotY-4,dotX2-20,dotY2-4);
line(dotX-8,dotY-10,dotX2-8,dotY2-10);
line(dotX+4,dotY-10,dotX2+4,dotY2-10);
line(dotX-25,dotY-10,dotX2-25,dotY2-10);
line(dotX-24,dotY-7,dotX2-24,dotY2-7);

line(dotX-17,dotY-13,dotX2-16,dotY2-10);

line(dotX-11,dotY-12,dotX2-11,dotY2-12);
line(dotX-5,dotY-15,dotX2-11,dotY2-12);

line(dotX-30,dotY-20,dotX-22,dotY-15);
line(dotX-27,dotY-27,dotX-22,dotY-22);
line(dotX-14,dotY-27,dotX-18,dotY-28);

line(dotX-19,dotY-23,dotX-13,dotY-22);

line(dotX-9,dotY-22,dotX,dotY-15);
line(dotX-11,dotY-17,dotX,dotY-15);

line(dotX,dotY-24,dotX-7,dotY-25);
line(dotX+1,dotY-21,dotX2-1,dotY2-21);


//stroke(255,0,0);
//line(473,27,478,31);
strokeWeight(3);

int sdotX =417;
int sdotY =63;
int sdotX2 = 418;
int sdotY2 =66;

line(sdotX,sdotY,sdotX2,sdotY2);

line(sdotX+8,sdotY-1,sdotX2+8,sdotY2-1);
////
line(sdotX+15,sdotY+3,sdotX2+15,sdotY2+3);
line(sdotX+23,sdotY+9,sdotX2+23,sdotY2+9);
line(sdotX+24,sdotY-2,sdotX2+24,sdotY2-2);
line(sdotX+28,sdotY+5,sdotX2+34,sdotY2+7);

line(sdotX+18,sdotY+19,sdotX2+22,sdotY2+24);

line(sdotX+4,sdotY+7,sdotX2+11,sdotY2+11);

line(sdotX+7,sdotY-2,sdotX2+13,sdotY2);
//////

line(sdotX+10,sdotY-7,sdotX2+10,sdotY2-7);
line(sdotX+15,sdotY-4,sdotX2+15,sdotY2-4);
line(sdotX+21,sdotY-3,sdotX2+21,sdotY2-3);

line(sdotX+26,sdotY-9,sdotX2+26,sdotY2-9);

line(sdotX+31,sdotY-1,sdotX2+31,sdotY2-1);

line(sdotX+7,sdotY+6,sdotX2+7,sdotY2+6);
line(sdotX+5,sdotY+10,sdotX2+5,sdotY2+10);

line(sdotX+15,sdotY+10,sdotX2+15,sdotY2+10);

line(sdotX+22,sdotY+4,sdotX2+22,sdotY2+4);

line(sdotX+29,sdotY+10,sdotX2+29,sdotY2+10);
line(sdotX+32,sdotY+13,sdotX2+32,sdotY2+13);

line(sdotX+15,sdotY+14,sdotX2+15,sdotY2+14);

line(sdotX+9,sdotY+16,sdotX2+9,sdotY2+16);

line(sdotX+8,sdotY+24,sdotX2+8,sdotY2+24);
line(sdotX+16,sdotY+21,sdotX2+16,sdotY2+21);

line(sdotX+25,sdotY+23,sdotX2+25,sdotY2+23);
line(sdotX+25,sdotY+15,sdotX2+25,sdotY2+15);


line(sdotX+33,sdotY+23,sdotX2+33,sdotY2+23);
line(sdotX+38,sdotY+20,sdotX2+38,sdotY2+20);


line(sdotX+15,sdotY+26,sdotX2+15,sdotY2+26);
line(sdotX+15,sdotY+30,sdotX2+15,sdotY2+30);
line(sdotX+25,sdotY+28,sdotX2+25,sdotY2+28);







//ARCS
stroke(0);
strokeWeight(8);
noFill();
stroke(232,192,64); //YELLOW ARC
arc(265,241, 130.6, 130.6, 4.42, 7.56);
stroke(205,102,71); //RED ARC
arc(265,241, 209, 209, 4.42, 7.56);

// ARC lines
stroke(100);
strokeWeight(1);
arc(265,241, 123, 123, 4.42, 7.56);
arc(265,241, 201, 201, 4.42, 7.56);
fill(228,228,237);
arc(265,241, 123, 123, 4.42, 7.56);
///
stroke(0);
strokeWeight(3);
//BLACK WHITE CIRCLE
fill(255);
ellipse(261.6,244,58,58);
fill(0);
arc(261.6,244,58,58,4.5,7.6);
////     

noStroke();
quad(-13,466,4.66,491.3,95,451.2,86.6,429.3);
fill(190,51,39);// RED FILL
quad(86.6,429.3,95,451.2,433,319.3,427.3,303.3);
fill(0,0,0,220);// BLACK FILL
quad(429.5,303.5,434.5,321,640,248.5,640,222.5);
strokeWeight(6);
stroke(0);
line(173,377,171,480);//Black vert Line Cover left verticle
//bottom horizontal across
stroke(0);
strokeWeight(4);
fill(0);
line(0,461,640,225);//horizontal cross1
line(0,490,640,240);//horizontal cross2



strokeWeight(5);
//right 5 verticle lines 
line(351,29,477,480);
line(400,16,530,480);   
line(440,1,547,480);   
line(440,1,574,480);  
line(480,-5,593,480);  
//far right verticle lines
strokeWeight(4);
line(531,-6.3,643.5,431); 
line(564.6,-6,643.5,366); 
//horizontal cut.right 5v
line(349.3,29,462,-6); 
line(361,74,490,38);
line(375,114,499,82);
line(389,161,509,123);
line(402,206,540,162);
//horizontal cut.far right.
line(540,25,632,-3);
line(549,65,640,40);

//Bottom Random Strokes
strokeWeight(9);
line(99.3,382.3,146.1,482);
strokeWeight(15);
line(350.5,309.5,603,486);
//BIG BLUE CIRCLE
noStroke();
//fill(24,98,161,210);
fill(19,96,165,225);
ellipse(520,243,190,190);


//TOP LEFT CORNER arcs
strokeWeight(9);
noFill();
stroke(188,54,67); //RED ARC
arc(77.5,15.5,132,132, radians(157.5),radians(200));
strokeWeight(6);
arc(-35,58,105.3,105.3, radians(280),radians(342));

stroke(0);
strokeWeight(8);
noFill();
arc(83.4,19.5,132,132, radians(157.5),radians(200));
strokeWeight(3);
arc(-36.6,62.6,105.3,105.3, radians(280),radians(342));

strokeWeight(7);
line(11.7,45,24.5,41.5);
strokeWeight(3);
line(-2.6,32.3,65.3,-4.3);

//PImage b;
//b = loadImage("bluecircle.png");
///image(b,421,147); 
//blend(b, 0, 0, 194, 194, 421, 147, 194, 194,DARKEST);

//DARKEST HARD_LIGHT

