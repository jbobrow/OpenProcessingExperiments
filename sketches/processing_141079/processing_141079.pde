
/*
 Konkuk University
 SOS iDesign

Name:Lee Joung Ho 
 ID: qmfforghf112

*/

PImage img;

void setup(){
size (600, 600);

 // noLoop();
smooth();
colorMode (RGB, 600); // put the image in the same folder as the processing file
 background(545.2, 531.1, 408.9);
 
 }

void draw(){
println(mouseX + " : " + mouseY);

// here you add your code with all shapes and colors. 
point(231, 451);
noStroke();
fill(600, 0, 0);
ellipse(460, 214, 48, 48);
fill(mouseX+20, mouseY+30, 20, 102);
stroke(0, 0, 0);
strokeWeight(3);
ellipse(460, 214, 72, 72);
noStroke();
fill(255, 255, 125);
ellipse(212, 135, 48, 48);
noStroke();
fill(125, 0, 125);
triangle(389, 115, 331, 191, 429, 186);
noStroke();
rectMode(CORNERS);
rect(536, 336, 598, 427);
fill(600, 0, 600);

point(220,220);
stroke(0);
strokeWeight(10);
line(312, 29, 156, 596);
line(312, 29, 482, 598);
line(309, 444, 577, 595);
line(309, 444, 187, 596);
strokeWeight(2);
line(110, 134, 471, 364);
line(471, 364, 120, 224);
line(144, 564, 374, 453);
line(318, 590, 555, 392);
line(354, 595, 575, 399);
line(158, 595, 477, 433);
ellipse(460, 212, 72, 72);
ellipse(90, 299, 36, 36);


strokeWeight(5);
stroke(mouseX+50, mouseY+50, 0, 205);
line(405, 597, 560, 485);
line(582, 365, 597, 355);
line(582, 365, 598, 392);
strokeWeight(1);
line(143, 554, 361, 451);
line(502, 247, 562, 247);
line(502, 251, 562, 252);
line(502, 255, 562, 255);
noFill();
ellipse(95, 456, 150, 150);
strokeWeight(3);
line(524, 2, 524, 271);
line(535, 2, 535, 271);
line(498, 56, 562, 56);
ellipse(312, 373, 64, 64);
stroke(255,0,0);
strokeWeight(6);
noFill();
ellipse (95, 456, 96, 96);


noStroke();
ellipse(210, 130, 58, 58);

//quad
noStroke();
fill(255, 0, 0);
quad(55, 599, 89, 599, 97, 589, 78, 575);
fill(255, 0, 0);
quad(99, 554, 115, 568, 140, 540, 125, 528);

//line
strokeWeight(5);
stroke(0, 255, 0);
line(57, 592, 122, 528);
line(92, 599, 140, 543);

//bezier
noFill();
bezier(354, 598, 330, 567, 425, 508, 443, 544);
bezier(443, 544, 416, 494, 501, 437, 520, 474);
bezier(521, 473, 505, 448, 553, 418, 563, 439);

//arc
noFill();
stroke(255, 0, 0);
arc(551, 122, 79, 79, 0.5*PI, 1.5*PI, OPEN);



}

