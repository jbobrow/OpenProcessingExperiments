
//homework 1
//copyright Kinnari Thakker August 2011, Pittsburgh 15224
size( 400,400);
background(224, 229, 160);

//stem of the "K"
noStroke();
fill(204, 102, 0);
rect(30, 20, 20, 225);

//hands of the "K"
stroke(193, 65, 196);
smooth();
noFill();
strokeWeight(10);
ellipse(160, 140, 225, 225);
//line(40, 120, 120, 0);
//line(40, 120, 140, 230);

//hiding half ellipse
fill(224, 229, 160);
noStroke();
rect(170, 0, 200, 270);

//head of the "A"
fill(204, 102, 0);
stroke(193, 65, 196);
triangle(160, 200, 100, 320, 220, 320);

//legs of the "A"
noStroke();
fill(193, 65, 196);
quad(95, 320, 107, 320, 67, 400, 55, 400);
quad(226, 320, 214, 320, 250, 400, 262, 400);

//stem of the "T"
noStroke();
fill(193, 65, 196);
rect(275, 100, 20, 300);

//hands of the "T"
noStroke();
fill(204, 102, 0);
rect(220, 150, 130, 10);

//saveFrame("hw1.jpg");


