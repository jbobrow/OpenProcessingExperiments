
// homework 1
// copyright Erica Gatts August 2011 Pittsburgh, PA 15214
size(400, 400);
background(250, 126, 215);

stroke(145, 206, 33); //this is my "E"
strokeWeight(3);
strokeCap(SQUARE);
noFill();
arc(75, 60, 100, 70, PI, TWO_PI-PI/2);
arc(75, 60, 100, 70, TWO_PI-PI/2, TWO_PI);
line(25, 60, 25, 160);
arc(75, 160, 100, 70, 0, PI/2);
arc(75, 160, 100, 70, PI/2, PI);
fill(247, 107, 12);
stroke(145, 206, 33);
strokeWeight(2);
rect(25, 105, 50, 8);


stroke(247, 107, 12); //this is my "G"
strokeWeight(2);
strokeCap(SQUARE);
noFill();
arc(315, 60, 100, 70, PI, TWO_PI-PI/2);
arc(315, 60, 100, 70, TWO_PI-PI/2, TWO_PI);
line(265, 60, 265, 160);
arc(315, 160, 100, 70, 0, PI/2);
arc(315, 160, 100, 70, PI/2, PI);
line(365, 160, 365, 115);
fill(145, 206, 33);
rect(315, 105, 50, 8);

noStroke();//this is my "A"
fill(209, 20, 252);
triangle(100, 380, 295, 380, 195, 50);
fill(247, 107, 12);
triangle(157, 200, 236, 200, 195, 66);

//saveFrame("hw1.jpg");


