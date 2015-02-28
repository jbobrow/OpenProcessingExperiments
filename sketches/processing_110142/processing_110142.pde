
size(480, 640);
background(0);
smooth();

//face
noStroke();
fill(255);
rect(63,0, 354, 640);

//wrinkle
stroke(0);
line(183,90, 298, 90);

line(147, 101, 333, 101);

strokeCap(SQUARE);
//eyebrow
strokeWeight(15);
//left
line(173, 207, 121, 184);
//right
line(359, 184, 308, 207);

//eye
strokeWeight(1);
//left
ellipse(157, 242, 45,45);
//right
ellipse(323, 242, 45,45);

//eye inside
noStroke();
fill(0);
ellipse(158, 242, 25,25);
ellipse(324, 242, 25,25);

//nose
noStroke();
fill(0);
//left
ellipse(213, 324, 40,40);
//right
ellipse(267, 324, 40,40);

//lips
fill(203, 34,41);
//left
triangle(223, 377, 206, 407, 240, 407);
//right
triangle(240, 407, 274, 407, 257, 377);
//lower
triangle(206, 559, 239, 589, 275, 559);

//mouth
fill(0);
rect(159, 406, 162, 153);

//teeth
fill(255);
stroke(0);
strokeWeight(1);
//left
triangle(161, 406, 206, 406, 183, 444);
//right
triangle(274, 406, 320, 406, 297, 444);

//chin
arc(240, 644, 50, 50, PI+QUARTER_PI, TWO_PI-QUARTER_PI);






