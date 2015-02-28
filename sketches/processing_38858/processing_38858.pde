
size(500, 500);
smooth();
background(218,215,180);

// background elements =========================

// blue stripe ---------
noStroke();
fill(199,207,184);
quad(284,154, 466,165, 406,232, 302,224);

//gray thin lines --------------
stroke(170,176,151,80);
strokeWeight(2);
//upper section --------
line(448,  0, 433,199);
line(341,303, 340, 92);
line(344, 86, 343,289);
line(397,243, 338,198);
line(342,193, 306,173);
line(328,220, 307,212);
line(255,306, 255,284);
//upper section ---------
line(235,343, 144,343);
line(198,369, 156,369);
line(156,369, 156,332);
line(217,405, 217,300);
line(198,424, 198,300);
line(198,318, 161,318);
line(188,314, 188,410);
line(152,411, 188,410);
//lower section ---------
line(  0,465,  30,463);
line(  0,476,  50,477);
line( 25,499,  26,440);

noFill();
beginShape();
vertex(471, 152);
vertex(473,  86);
vertex(335,  55);
vertex(337, 272);
endShape();

beginShape();
vertex(403, 241);
vertex(404, 138);
vertex( 85,  75);
vertex(286, 161);
vertex(341, 193);
endShape();

//black rectangles -------------
fill(43,46,45);
noStroke();
quad(308,130, 308,297, 244,286, 240,170);
quad(318,301, 318,349, 233,407, 233,301);



//foreground canvas ====================
fill(180,188,178);

//shape 01
beginShape();
vertex(  0,  0);
vertex(403,  0);
bezierVertex(292,152, 184,362,   0,459);
endShape();
//control points
/*
stroke(0);
point(217,262);
point(308,137);
point(116,375);
*/

//shape 02
beginShape();
vertex(375, 499);
vertex(  7, 499);
bezierVertex(267,423, 392,262, 499,106);
vertex(499,424);
bezierVertex(466,462, 414,486, 375,499);
endShape();
//control points
/*
stroke(0);
point(442,469);
*/

//foreground shapes -------------------

//grey quad
fill(161,153, 135);
quad(171,417, 171,500,  65,500,  65,417);

// red shapes
fill(201, 47, 50);
beginShape();
vertex( 82, 475);
vertex( 30, 474);
vertex( 33, 376);
vertex(152, 379);
vertex(153, 420);
vertex( 82, 419);
endShape();

beginShape();
vertex(119, 469);
vertex(238, 472);
vertex(238, 438);
vertex(121, 435);
endShape();

//light stroke over red
stroke(185,183,160);
noFill();
bezier(  7, 499, 267,423, 392,262, 499,106);
noStroke();

fill(201, 47, 50);


beginShape();
vertex(302, 402);
vertex(418, 403);
vertex(417, 430);
vertex(332, 428);
vertex(331, 487);
vertex(301, 487);
endShape();

// blue shape
fill( 40, 78, 149);
quad(171,197, 303,202, 232,316, 120,309);

//small green triangle
fill(  1,143,104);
triangle(302,307, 302,364, 257,337);

//big green triangle
fill( 41, 80, 59);
triangle(470,195, 500,335, 409,332);

//yellow circle
fill(236, 199, 93);
ellipse(498,335,  23, 23);

//light blue rect
fill(209, 226, 220);
quad(500,305, 500,325, 470,325, 470,306);

//medium blue rect
fill( 91,126,186);
rectMode(CORNER);
rect(470,345, 40,20);

//yellow quad
fill(236, 199,  93);
quad(500,113, 462,113, 492,132, 500,132);






