
// size
size(640, 480);
smooth();
background(171, 181, 170);
rectMode(CORNER);
ellipseMode(CENTER);
noStroke();


//brown
fill(81, 71, 61);
quad(303, 41, 538, 33, 700, 275, 430, 237);
//blue dot
strokeWeight(5);
stroke(17,67,154);
strokeCap(SQUARE);
line(0,191,9,197);
strokeWeight(7);
line(249,243,236,271);
//pink
noStroke();
fill(187, 83, 118);
quad(79, 54, 246, 38, 246, 301, 72, 267);

// SECOND VERTICAL BLACK LINE
stroke(0);
strokeWeight(3);
strokeCap(ROUND);
line(206, 138, 221, 386);

// 3RD VERTICAL LINE
stroke(0);
strokeWeight(3.5);
line(25, 412, 322, 415);

// red
noStroke();
fill(162, 92, 92,200);
quad(0, 83, 95, 83, 95, 107, 0, 107);

//orange circle
fill(240, 129, 68);
ellipse(169, 427, 180, 180);
//blue under white
fill(41, 63, 114);
quad(0, 327, 12, 327, 65, 480, 0, 480);

//1st vertical black line
stroke(0);
strokeWeight(3);
strokeCap(ROUND);
line(46, 312, 42, 480);

//tan
noStroke();
fill(222, 211, 178);
beginShape();
vertex(515, 46);
vertex(560, 46);
vertex(560, 251);
vertex(640, 261);
vertex(640, 332);
vertex(502, 332);
vertex(431, 238);
vertex(515, 250);
endShape(CLOSE);

//top blue
fill(39, 86, 162);
quad(0, 30, 680, 30, 680, 73, 0, 56);

//blue shape under orange semi circle
fill(39, 86, 162);
quad(269, 330, 415, 330, 460, 480, 330, 480);

//orange
fill(240, 129, 68);
beginShape();
curveVertex(363, 411);
curveVertex(363, 411);
curveVertex(405, 374);
curveVertex(476, 377);
curveVertex(521, 427);
curveVertex(521, 427);
vertex(502, 442);
vertex(502, 480);
vertex(363, 480);
endShape(CLOSE);


//lightbrown
fill(175, 110, 65, 200);
quad(452, 330, 680, 330, 680, 480, 452, 480);
//lines under yellow arrow
noFill();
stroke(0);
strokeWeight(.5);
line(640,330,430,74);
line(640,330,374,150);
line(454,104,455,273);
line(418,73,419,221);


//yellow arrow
noStroke();
fill(249, 192, 51);
quad(491, 95, 560, 243, 634, 95, 560, 404);

//LINE 1
stroke(0);
strokeWeight(6);
line(-10, 60, 50, 18);

//LINE 2
stroke(0);
strokeWeight(3);
strokeCap(ROUND);
line(0, 146, 146, 134);

// MIDDLE LINE ACROSS PAGE
line(0, 208, 640, 187);

//vertical blue line
stroke(39, 86, 162);
strokeWeight(5);
strokeCap(SQUARE);
line(98, 182, 161, 480);

//horiz blue line
stroke(39, 86, 162);
strokeWeight(5);
strokeCap(SQUARE);
line(0, 455, 310, 485);

//white
noStroke();
fill(210, 223, 223);
quad(212, 294, 214, 350, 0, 313, 0, 252);

//red arc
noFill();
strokeCap(ROUND);
stroke(166, 35, 40);
arc(280, 780, 790, 1000, TWO_PI-PI/2, TWO_PI);

//BLACK ELLIPSE
noFill();
stroke(0);
strokeCap(SQUARE);
strokeWeight(10);
ellipse(920, 240, 1200, 605);

//top teal shape
noStroke();
fill(211, 217, 202);
rect(0, 0, 680, 30);

//2nd long vertical line
stroke(0);
noFill();
strokeWeight(3);
beginShape();
vertex(213, 327);
vertex(451, 327);
bezierVertex(515, 335, 700, 320, 640, 320);
endShape();

//CROSS SHAPE
stroke(6, 114, 156);
strokeWeight(12);
noFill();
beginShape();
vertex(486, 195);
vertex(504, 195);
vertex(504, 243);
vertex(544.5, 243);
vertex(544.5, 262);
vertex(504, 262);
vertex(504, 344.5);
vertex(486, 344.5);
vertex(486, 262);
vertex(442, 262);
vertex(442, 244);
vertex(486, 244);
endShape(CLOSE);

noStroke();
fill(208, 218, 223);
beginShape();
vertex(486, 190);
vertex(504, 190);
vertex(504, 244);
vertex(551, 244);
vertex(551, 262);
vertex(504, 262);
vertex(504, 351);
vertex(486, 351);
vertex(486, 262);
vertex(436, 262);
vertex(436, 244);
vertex(486, 244);
endShape(CLOSE);

//star
fill(0);
noStroke();
beginShape();
vertex(225, 130);
vertex(228, 140);
vertex(235, 140);
vertex(230, 146);
vertex(234, 156);
vertex(225, 150);
vertex(216, 156);
vertex(220, 146);
vertex(214, 140);
vertex(222, 140);
endShape(CLOSE);
fill(0);
noStroke();
beginShape();
vertex(385, 450);
vertex(388, 460);
vertex(395, 460);
vertex(390, 466);
vertex(394, 476);
vertex(385, 470);
vertex(376, 476);
vertex(380, 466);
vertex(374, 460);
vertex(382, 460);
endShape(CLOSE);

//faint lines on top
noFill();
stroke(197,112,62);
strokeWeight(.5);
line(165,348,164,460);
line(220,358,215,451);
line(243,379,148,382);
line(134,383,94,390);
line(88,398,133,413);
line(420,369,420,394);
line(407,402,381,390);
line(365,456,415,480);
line(617,340,617 ,259);

beginShape();
vertex(371,400);
vertex(419,416);
vertex(420,447);
vertex(394,451);
bezierVertex(409,428,368,403,368,412);
endShape();
stroke(201,170,170);
strokeWeight(1);
line(629,480,477,305);
stroke(0);
arc(84,415,64,64,PI/2-TWO_PI,PI/2);



