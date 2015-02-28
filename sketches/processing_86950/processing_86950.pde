
size (640, 480);
background (210, 207, 173);

//COLOR PALETTE LIKE AN ARTISTE
//color warm gray = color(158, 161, 158);
//color lite gray= color (192, 208, 212);
color red = color(188, 45, 49);
//color green = color(58, 93, 60);
color teal = color(27, 90, 118);
//color purp = color(74, 51, 87);
color orange = color(221, 116, 50); 
color orange2 = color(224, 116, 50, 235); 
color blue = color(24, 44, 116);

smooth();

stroke(0);
noFill();
strokeWeight(.8);

//beziers using bezierEditor
beginShape();
vertex(277.0, 477.0);
bezierVertex(277.0, 477.0, 229.0, 314.0, 462.0, 114.0); //thin curve line left ********
endShape();

beginShape();
vertex(277.0, 477.0);
bezierVertex(277.0, 477.0, 279.0, 292.0, 443.0, 160.0); //thin curve line mid ********
endShape();



beginShape(); //teal quad bottom
noStroke();
fill(teal);
vertex(365, 481);
vertex(350, 265);
vertex(497, 278);
vertex(503, 481);
endShape();

stroke(0);
noFill();
strokeWeight(.8);
beginShape();
vertex(277.0, 477.0);
bezierVertex(277.0, 477.0, 299.0, 307.0, 463.0, 175.0); //thin curve line right ********
endShape();

noStroke();
fill(134, 127, 108);
quad(465, 370, 532, 370, 535, 462, 471, 461); //bottom right quad

beginShape(); //red quad middle
fill(red);
vertex(263, 322);
vertex(380, 323);
vertex(404, 364);
vertex(282, 366);
endShape();

fill(172, 133, 73);
noStroke();
beginShape(); //coffee quad
vertex(69, 220);
vertex(204, 241);
vertex(207, 481);
vertex(73, 481);
endShape();

fill(128, 125, 104); //left corner coffee quad
quad(88, 480, 86, 396, -2, 387, -2, 480);

strokeCap(SQUARE);
strokeWeight(7.5);
stroke(blue);
line(401, 80, 480, 360); //blue diagonal line right most


noStroke();
fill(155, 156, 141);
quad(285, 344, 284, 450, 355, 451, 365, 345);

//line party ++++++++

stroke(0);
noFill();
line(323, 98, 471, 107);
line(47, 396, 59, 484); //bottom left black diagonal

noStroke();
fill(224, 116, 50, 210);
ellipse(219, 48, 233, 233); //art center dot left

//green rect ++++++++
beginShape(); 
noStroke();
color green = color(58, 93, 60, 230);
fill(green);
vertex(202, 15);
vertex(206, 381);
vertex(-2, 295);
vertex(-2, -2);
vertex(206, -2);
endShape();





stroke(0);
strokeWeight(5);
line(368, -1, 385, 193);
line(461, 459, -1, 295);
line(44, 395, 637, 418);
line(-1, 305, 637, 320);

stroke(orange);
strokeWeight(38);
noFill();
line(498, 363, 463, 484); //right mini orange diagonal

stroke(0);
strokeWeight(5);
quad(109, 421, 537, 425, 537, 464, 109, 457); //bottom long rect outline 


stroke(0);
strokeWeight(5);
line(82, 445, 178, 484);
line(587, 418, 620, 484);
line(538, 450, 593, 473);
line(636, 282, 1, 263);
line(0, 98, 636, 351);
strokeWeight(6); //top horizontal diagonal line
line(-2, 79, 208, 92);

noStroke();
fill(159, 160, 149);
triangle(485, -1, 639, 91, 639, -1);

//giant art center dot right
stroke(156, 163, 141, 175);
strokeWeight(7);
fill(orange2);
ellipse(578, 107, 219, 224); 

//blue curve
stroke(blue);
noFill();
strokeWeight(6.8);
bezier(-377, 218, 377, 154, 305, 154, 974, 178 );




stroke(orange);
strokeCap(SQUARE);
strokeWeight(36);
line(174, 17, 301, 485); //orange diagonal right line

strokeWeight(16); 
stroke(79, 34, 29);
bezier(-56, 232, 0, 240, 105, 261, 144, 273); //left brown line


stroke(orange);
strokeCap(SQUARE);
strokeWeight(36);
line(72, -5, 201, 485); //orange diagonal left line



//bottom right long rect outline ++++++++
stroke(0);
strokeWeight(5);
noFill();
beginShape(); 
vertex(592, 481);
vertex(593, 477);
vertex(590, 297);
vertex(641, 297);
endShape();

//upper blue rect ++++++++
beginShape(); 
noStroke();
color lightblue = color(36, 123, 174);
fill(lightblue);
vertex(115, -1);
vertex(115, 28);
vertex(244, 28);
vertex(244, -1);
endShape();

//upper diamond vvvvvvv
beginShape(); 
vertex(145, 54);
vertex(170, 39);
vertex(195, 54);
vertex(170, 71);
endShape();

//right diamond vvvvvvv
beginShape(); 
pushMatrix();
translate(37, 20);
vertex(145, 54);
vertex(170, 39);
vertex(195, 54);
vertex(170, 71);
endShape();


//bottom diamond vvvvvvv
beginShape();
fill(116, 163, 191);
translate(-36, 20);
vertex(145, 54);
vertex(170, 39);
vertex(195, 54);
vertex(170, 71);
endShape();
popMatrix();

beginShape(); //PURPLE CROSS
strokeWeight(17);
stroke(74, 51, 87);
strokeCap(SQUARE);
line(532, 163, 640, 163); //horiz
line(601, 94, 602, 233); //vert

stroke(blue); //blue diagonal line left most
strokeWeight(7.5);
line(270, -5, 400, 484);




stroke(orange); 
strokeWeight(35);
line(385, 313, 338, 484); //left mini orange diagonal



stroke(0);
strokeWeight(5);
line(408, -1, 381, 399); //top right black diagonal line

fill(red);
noStroke();
beginShape(); //left red quad
vertex(-2, 329);
vertex(82, 342);
vertex(81, 395);
vertex(-2, 389);
endShape();

fill(39, 69, 147);
quad(-2, 416, 31, 418, 33, 484, -2, 484); //bottom left blue quad

fill(lightblue);
ellipse(-6, 432, 34, 34);

beginShape(); //white quad
fill(187, 208, 212);
vertex(116, 125);
vertex(246, 125);
vertex(246, 170);
vertex(117, 172);
vertex(116, 158);
vertex(120, 152);
vertex(115, 147);
endShape();

beginShape(); //orange weird shape
fill(orange);
vertex(213, 131);
vertex(217, 132);
vertex(222, 127);
vertex(229, 148);
vertex(216, 167);
vertex(208, 167);
vertex(205, 163);
vertex(197, 168);
vertex(192, 147);
vertex(208, 127);
endShape();

stroke(0); //left thick black curve
strokeWeight(11);
noFill();
bezier(8, 715, 42, 244, 7, 292, 651, -292);

fill(red); //bottom red ellipse
noStroke();
ellipse(498, 480, 75, 86);

fill(154, 57, 46, 200); //left translucent red quad
quad(-2, 229, 17, 214, 17, 258, -2, 270);

stroke(0); 
strokeWeight(4);
noFill();
quad(120, 471, 254, 471, 254, 484, 120, 484); //bottom rect outline

pushMatrix();
int xpos = 320;
int ypos = 259;
int sx = width/8;
noStroke();
fill(0, 136, 105);
translate(520, 280);
scale(.3);
beginShape();
vertex(xpos, ypos-sx/2);
vertex(xpos+sx/6, ypos-sx/6);
vertex(xpos+sx/2, ypos-sx/11);
vertex(xpos +sx/4, ypos+sx/8);
vertex(xpos+sx/3, ypos+sx/2);
vertex(xpos, ypos+sx/3);
vertex(xpos-sx/3, ypos+sx/2);
vertex(xpos-sx/4, ypos+sx/6);
vertex(xpos-sx/2, ypos-sx/9);
vertex(xpos-sx/6, ypos-sx/6);
endShape(CLOSE); 
popMatrix();



