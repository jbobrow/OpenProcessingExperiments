
size(400, 400);
smooth();
background(162, 183, 255);
println("my self portrait");

// face contours
noFill();
bezier(264, 128, 240, 156, 290, 200, 220, 250);
noStroke();
line(85, 20, 10, 10);
line(90, 90, 15, 80);

// freckles
stroke(1);
point(150, 175);
point(160, 175);
point(140, 188);
point(145, 173);
point(155, 185);

point(230, 175);
point(240, 175);
point(220, 188);
point(225, 173);
point(215, 185);

// whites of eyes
fill(255);
stroke(1);
ellipse(150, 150, 38, 28); // left eye
ellipse(230, 150, 38, 28); // right eye

// color of eyes
noStroke();
fill(0, 80, 240);
ellipse(153, 152, 18, 18); // left eye
ellipse(233, 152, 18, 18); // right eye

// pupils of eyes
fill(0);
ellipse(155, 152, 12, 12); // left eye
ellipse(235, 152, 12, 12); // right eye

// eyelids
fill(255, 222, 178);
arc(150, 150, 38, 28, TWO_PI-PI, TWO_PI); 
arc(230, 150, 38, 28, TWO_PI-PI, TWO_PI);

// eyelashes
stroke(1);
line(135, 150, 120, 142);
line(140, 150, 125, 139);
line(145, 150, 130, 137);
line(150, 150, 135, 135);

line(245, 150, 260, 142);
line(240, 150, 255, 139);
line(235, 150, 250, 137);
line(230, 150, 245, 135);

// eyebrows
fill(103, 70, 26);
noStroke();
triangle(170, 128, 170, 126, 130, 124);
triangle(132, 124, 115, 128, 110, 127);

triangle(210, 128, 210, 126, 250, 124);
triangle(248, 124, 264, 128, 263, 127);

// nose
stroke(1);
line(193, 144, 193, 173);
line(193, 173, 202, 180);
line(202, 180, 202, 186);

// notrils
fill(0);
ellipse(182, 192, 5, 2); 
ellipse(198, 192, 5, 2);

// mouth
fill(255, 199, 185);
arc(190, 216, 70, 8, TWO_PI-PI, TWO_PI);
arc(190, 224, 60, 8, 0, PI);
fill(255);
quad(150, 216, 160, 224, 220, 224, 230, 216);

// hair
stroke(100, 54, 16);
noFill();
bezier(215, 90, 100, 120, 100, 100, 130, 350);
noStroke();
line(85, 20, 10, 10);
line(90, 90, 15, 80);

// hair
stroke(100, 54, 16);
noFill();
bezier(230, 90, 160, 130, 70, 100, 150, 350);
noStroke();
line(85, 20, 10, 10);
line(90, 90, 15, 80);

// hair
stroke(100, 54, 16);
noFill();
bezier(180, 70, 100, 80, 30, 100, 110, 350);
noStroke();
line(85, 20, 10, 10);
line(90, 90, 15, 80);

// hair
stroke(100, 54, 16);
noFill();
bezier(220, 80, 100, 80, 70, 100, 90, 350);
noStroke();
line(85, 20, 10, 10);
line(90, 90, 15, 80);

// hair
stroke(100, 54, 16);
noFill();
bezier(225, 80, 100, 35, 70, 100, 120, 350);
noStroke();
line(85, 20, 10, 10);
line(90, 90, 15, 80);

// hair
stroke(100, 54, 16);
noFill();
bezier(213, 80, 90, 50, 40, 100, 75, 350);
noStroke();
line(85, 20, 10, 10);
line(90, 90, 15, 80);

// necklace
fill(247, 240, 2);
stroke(1);
line(185, 369, 135, 300);
line(185, 369, 225, 300);
noStroke();
ellipse(185, 375, 15, 15); 


