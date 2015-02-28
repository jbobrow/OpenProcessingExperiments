
size(500, 500);
smooth();
background(255);

//left eye (lopez)
fill(255);
ellipse(143, 180, 144, 216);
fill(1);
ellipse(143, 219, 75, 75);
fill(255);
ellipse(121, 209, 17, 17);


//right eye
fill(255);
ellipse(356, 180, 144, 216);
fill(1);
ellipse(356, 219, 75, 75);
fill(255);
ellipse(337, 209, 17, 17);

//mouth
line(216, 432, 288, 432);

//nose
stroke(1);
strokeWeight(1);
arc(250, 330, 50, 50, radians(70), radians (110));

//saveFrame("comp1.png");


