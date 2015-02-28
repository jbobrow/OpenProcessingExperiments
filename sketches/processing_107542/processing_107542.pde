
//Kairavi Chahal
//kchahal@andrew.cmu.edu

//Copyright Kairavi Chahal | Pittsburgh, PA | August 29, 2013.
//All rights reserved.

size(400, 400);
fill(50, 200, 0);
rect(0, 0, 400, 400);

noFill();
//arc(200, 225, 200, 200, 0, HALF_PI);
strokeWeight(5);
arc(200, 225, 240, 240, HALF_PI, PI);
arc(200, 225, 280, 280, PI, PI+QUARTER_PI);
arc(200, 225, 320, 320, PI+QUARTER_PI, TWO_PI);

stroke(345);
arc(200, 225, 320, 320, HALF_PI, PI);
arc(200, 225, 280, 280, PI, PI+QUARTER_PI);
arc(200, 225, 320, 320, PI+QUARTER_PI, TWO_PI);

stroke(123);
strokeWeight(10);
line(150, 90, 150, 290);
line(150, 190, 250, 90);
line(150, 190, 250, 290);

//saveFrame("hw1.jpg");


