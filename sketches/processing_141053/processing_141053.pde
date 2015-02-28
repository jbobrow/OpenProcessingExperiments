
/*
Konkuk University
SOS iDesign

Name: Lim Hyun Seung <<------ Write your full name here!
ID: Hyun Seung<<--------- Write your ID here!

*/

PImage img;

void setup(){
size (600, 600);
// noLoop();
smooth();
colorMode (RGB, 600);
background(545.2, 531.1, 408.9);
// put the image in the same folder as the processing file
}

void draw(){
println(mouseX + " : " + mouseY);
// here you add your code with all shapes and colors. 

//point
noSmooth();
point(234, 175);
point(233, 356);

smooth();
//triangle
noStroke();
fill(599.25, 439.45, 0);
triangle(133, 50, 104, 97, 159, 97);

//*Rect, triangle, quad, bezier Union 
//Number.1 Triangle
noStroke();
fill(599.25, 220.9, 0);
triangle(198, 351, 16, 476, 235, 470);
fill(444.15, 444.15, 444.15);
quad(197, 349, 234, 467, 343, 473, 214, 336);
//Numer.2 Ellipse
strokeWeight(5);
stroke(0, 0, 255);
noFill();
ellipse(195, 403, 78, 78);
noStroke();
fill(600, 600, 600);
ellipse(195, 403, 50 ,50);
fill(0, 0, 0);
ellipse(195, 403, 8, 8);
//Number.3 Quad in Ellipse
noStroke();
fill(255, 255, 0);
quad(152, 400, 154, 414, 159, 414, 158, 402);
quad(178, 434, 175, 440, 190, 443, 191, 436);
fill(255, 255, 0);
quad(232, 393, 233, 406, 235, 407, 234, 393);
//Number.4 Triangle
noStroke();
fill(599.25, 535.8, 0);
triangle(207, 414, 308, 540, 321, 528);
triangle(184, 398, 109, 380, 115, 365);
fill(599.25, 535.8, 0);
triangle(201, 389, 263, 309, 269, 315);
//Quad in Triangle
fill(0, 0, 0);
quad(222, 362, 224, 363, 239, 350, 236, 346);
quad(241, 339, 247, 341, 268, 318, 262, 310);
quad(115, 365, 109, 380, 132, 385, 134, 374);
quad(246, 461, 309, 541, 318, 528, 253, 460);
//Triangle in Triangle
fill(600, 0, 0);
triangle(157, 392, 160, 386, 183, 397);
triangle(200, 389, 213, 375, 212, 375);
triangle(206, 412, 219, 431, 223, 429);
//Line in Triangle
stroke(479.4, 390.1, 143.35);
strokeWeight(2);
noFill();
line(142, 377, 139, 386);
stroke(559.25, 0, 519.35);
line(142, 377, 139, 386);
line(237, 451, 240, 448);
line(242, 457, 248, 453);
line(245.32, 463, 252, 458);
//Number5. Outside(Ellipse)
noStroke();
fill(484.1, 589.85, 472.35);
ellipse(256, 402, 20, 20);
//Nuber6. Bezier
noFill();
stroke(251.45, 359.55, 0);
strokeWeight(4);
bezier(249, 373, 265, 368, 294, 401, 284, 410);
stroke(0, 507.6, 599.25);
bezier(237, 360, 269, 342, 319, 392, 297, 422);

//Ellipse(1)
stroke(128, 65, 217);//Deep Puple
strokeWeight(7);
fill(mouseX+30, mouseY+30, 201);//Yellowish Green
ellipse(463, 143, 50, 50);
strokeWeight(3);
stroke(0, 0, 0);
noFill();
ellipse(312, 172, 82, 82);
stroke(103, 0, 0);
strokeWeight(4);
ellipse(552, 168, 43, 43);
noStroke();
fill(103, 153, 255);//Cobalt Blue
ellipse(360, 369, 81, 81);
stroke(0, 0, 0);
strokeWeight(3);
fill(103, 153, 255);
ellipse(176, 111, 26 ,26);
strokeWeight(4);
stroke(128, 65, 217);//puple
fill(219, 216, 92);//Gold Yellow
ellipse(32, 63, 36 ,36);
noFill();
strokeWeight(3);
stroke(0, 0, 0);
ellipse(94,207, 4, 4);

//LINES
strokeWeight(3);
stroke(0, 0, 0);
line(1, 419, 117, 521);
line(303, 417, 556, 495);
stroke(0, 0, 0);
strokeWeight(4);
line(209,484, 323, 599);
strokeWeight(3);
line(1, 488, 103, 473);
strokeWeight(6);
stroke(255, 0, 0);
line(1, 516, 77, 490);
stroke(445.15, 444.15, 444.15);
strokeWeight(2);
line(192, 205, 1, 125);
line(192, 205, 1, 81);
strokeWeight(3);
line(245, 221, 70, 392);
line(101, 335, 235, 215);
stroke(255, 0, 0);
strokeWeight(3);
line(351, 286, 420, 240);
strokeWeight(2);
line(357, 212, 321, 164);
line(356, 167, 387, 193);
strokeWeight(3);
stroke(0, 0, 0);
line(93, 0, 1, 368);
line(93, 0, 276, 599);
strokeWeight(6);
stroke(255, 0, 0);
line(200, 234, 0, 345);
stroke(255, 0 ,0);
strokeWeight(3);
line(583, 13, 248, 201);
line(587, 37, 261, 219);
line(587, 62, 272, 237);
line(466, 156, 284, 257);
line(340, 244, 263, 298);
line(263, 298, 462, 599);
line(274, 313, 322, 283);
line(286, 332, 330, 302);
line(299, 345, 340, 317);
line(311, 363, 319, 359);
strokeWeight(3);
line(174, 535, 90, 598);
line(179, 543, 105, 599);
strokeWeight(1);
line(153, 562, 134, 599);
line(179, 540, 120, 599);
strokeWeight(4);
stroke(11, mouseY+45, 75);
line(0, 595, 436, 590);
strokeWeight(5);
stroke(mouseX+10, 216, 92);
line(521, 286, 522, 437);
line(551, 283, 554, 437);
line(580, 284, 587, 439);
stroke(mouseY+10, 209, 229);
line(472, 328, 599, 328);
line(469, 356, 598, 356);
line(471, 387, 598, 387);
stroke(0, 0, 0);
strokeWeight(1);
line(212, 0, 216, 147);
line(219, 1, 223, 147);
strokeWeight(3);
line(196, 17, 236, 18);
line(205, 133, 236, 130);
strokeWeight(4);


//Line Triangles
noFill();
stroke(0, 255, 0);
strokeWeight(4);
triangle(248, 201, 270, 189, 476, 541);
noFill();
stroke(0, 102, 255);
strokeWeight(4);
triangle(286, 179, 300, 174, 502, 527);
noFill();
stroke(0, 0, 255);
strokeWeight(4);
triangle(278, 287, 295, 275, 489, 598);
strokeWeight(3);
stroke(0, 0, 0);
fill(0, 63, 100, 0);//Sun Red(CMYk)
fill(255, 94, 0);
triangle(352, 262, 344, 244, 555, 126);


//Line Quad
noStroke();
fill(225, 176, 104);//Brown
quad(248, 200, 261, 218, 279, 206, 269, 188);
fill(255, 0 , 255);//Puple
quad(355, 167, 336, 152, 318, 161, 332, 180 );
fill(255, 228, 0);//Yellow
quad(413, 113, 423, 125, 443, 113, 434, 99);
fill(0, 216, 255);//Sky Blue
quad(514, 56, 522, 71, 544, 56, 536, 44);
fill(255, 0, 127);//Pink
quad(311, 192, 322, 206, 341, 194, 330, 183);
stroke(255, 255, 255);//White-gray
fill(0, 0, 255);//Blue
quad(496, 115, 506, 132, 524, 122, 514, 106);
stroke(255, 255, 255);//White-gray
fill(0, 0, 255);//Blue
quad(495, 169, 503, 178, 516, 172, 507, 157);
stroke(255, 255, 255);//White-gray 
fill(0, 0, 255);//Blue
quad(508, 194, 518, 210, 533, 202, 521, 181);
stroke(255, 255, 255);//White-gray 
fill(0, 0, 255);//Blue
quad(446, 277, 460, 298, 486, 279, 474, 260);
noStroke();
fill(0, 0, 0);//Black
quad(335, 403, 339, 410, 545, 247, 537, 239);
fill(255, 0, 0);//Red
quad(211, 507, 216,510, 335, 413, 332, 407);
fill(0, 0 ,0);//Black
quad(171, 536, 184, 537, 214, 515, 211, 503);
quad(265, 298, 275, 309, 287, 303, 279, 291);
quad(288, 333, 298, 340, 309, 335, 302, 324);
quad(315, 338, 328, 331, 321, 349, 330, 337);
quad(349, 198, 360, 210, 385, 195, 373, 183);
quad(524, 330, 523, 351, 550, 354, 550, 332);
fill(600, 0, 0);
quad(0, 372, 0, 380, 94, 258, 95, 248);
quad(96, 244, 94, 258, 291, 361, 291, 361);

//Rect
noStroke();
rectMode(CORNERS);
fill(217, 65, 140);//Magenta
rect(554, 330, 582, 356);
fill(255, 216, 216);//Incarnadine 
rect(552, 361, 524, 387);
stroke(255, 0, 0);
strokeWeight(4);
noFill();
rectMode(CENTER);
rect(391, 46, 13, 16);
fill(600, 418, 576);
rect(568, 372, 26, 25);

//Bezier(1)
stroke(255, 0, 0);
noFill();
bezier(69, 399, 30, 373, 88, 322, 127, 348);
stroke(0, 255, 0);
strokeWeight(5);
bezier(126, 349, 104, 324, 166, 285, 171, 309);
stroke(0, 255, 0);
strokeWeight(5);
bezier(173, 303, 157, 282, 204, 248, 215, 265);
stroke(0, 255, 0);
strokeWeight(5);
bezier(217, 266, 207, 253, 231, 235, 238, 245);

//Bezier Underground
noFill();
stroke(0, 127, 255);
strokeWeight(4);
bezier(0, 568, 0, 548, 79, 515, 103, 587);
stroke(0, 216, 255);//Sky Blue
strokeWeight(4);
bezier(101, 594, 102, 530, 211, 530, 212, 591);

//Arc
noFill();
arc(270, 592, 112, 112, -180, PI, CHORD);
arc(224, 54, 34, 34, 0.5*PI, 1.5*PI, OPEN);

//rect,ellipse(alpha-Read clolr)
stroke(255, 0, 0);
color c = color(0, 126, 255, 120);
fill(c);
ellipse(466, 219, 56, 56);
float value = alpha(c);  // Sets 'value' to 120
fill(value);
quad(423, 239, 441, 267, 465, 244, 452, 219);


}

void mousePressed() {
  stroke(0);
  fill(175);
  triangle(mouseX,mouseY,30,30,80,80);
}

void keyPressed(){
  background(255, 0, 0);
}






