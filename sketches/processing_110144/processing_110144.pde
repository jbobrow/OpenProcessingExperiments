
size(640, 540);
colorMode(RGB);


background(255);

//pink face

noStroke();
fill(252, 199, 199);
rect(80, 50, 500, 400, 10, 40, 0, 200);


//eyebrows

fill(167, 114, 42);
noStroke();
rect(120, 180, 400, 5, 30);

//eyes

//left eyes
strokeWeight(4);
stroke(167, 114, 42);


strokeWeight(6);
line(135, 183, 170, 207);
line(170, 207, 200, 183);

//Right eye

strokeWeight(4);
line(430, 183, 470, 200);
line(470, 200, 496, 183);
noStroke();
ellipse(453, 188, 14, 14);

//left eye ball
noStroke();
ellipse(158, 188, 16, 16);

//mouth
arc(320, 280, 35, 10, 40,80);

//nostrils
stroke(167, 114, 42);
strokeWeight(7);
point(300,210);
strokeWeight(10);
point(320,208);






