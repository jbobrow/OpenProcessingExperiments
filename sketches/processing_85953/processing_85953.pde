
// Joseph Oak joak
// © Joseph Oak 2013

size(400, 400);
background(230);
smooth();

// concentric_circles

noFill();
strokeWeight(.25);
stroke(0);
ellipse(200, 200, 190, 190);
ellipse(200, 200, 180, 180);
ellipse(200, 200, 170, 170);

// JO_1

noFill();
strokeWeight(.25);
stroke(0);
line(240, 210, 240, 190);
arc(220, 210, 40, 40, 0, PI);
arc(220, 190, 40, 40, PI, TWO_PI);
line(200, 190, 200, 210);
arc(180, 210, 40, 40, 0, PI);

// JO_2

noFill();
strokeWeight(.25);
line(235, 210, 235, 190);
arc(215, 210, 40, 40, 0, PI);
arc(215, 190, 40, 40, PI, TWO_PI);
line(195, 190, 195, 210);
arc(175, 210, 40, 40, 0, PI);

// JO_3

noFill();
strokeWeight(.25);
line(245, 210, 245, 190);
arc(225, 210, 40, 40, 0, PI);
arc(225, 190, 40, 40, PI, TWO_PI);
line(205, 190, 205, 210);
arc(185, 210, 40, 40, 0, PI);

//saveFrame("hw1.jpg");

