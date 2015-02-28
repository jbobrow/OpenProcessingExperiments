
//Sharon Rubin
//srrubin@andrew.cmu.edu
//copyright sharon rubin

//general
size(400, 400);
smooth();
background(67);

//S
fill(255, 252, 252);
noStroke();
ellipse(80, 120, 100, 100);
noStroke();
ellipse(80, 220, 100, 100);

//dots
ellipse(125, 120, 50, 50);
ellipse(170, 120, 30, 30);
ellipse(210, 120, 20, 20);
ellipse(250, 120, 10, 10);
ellipse(295, 120, 8, 8);
ellipse(345, 120, 6, 6);

//S
strokeWeight(9);
strokeCap(PROJECT);
stroke(20);
arc(80, 120, 100, 100, PI/2, 7*PI/4);
arc(80, 220, 100, 100, -PI/2, PI);

//R
stroke(255, 252, 252);
strokeWeight(22);
line(120, 120, 350, 400);

//R
stroke(30);
noFill();
strokeWeight(2);
arc(250, 120, 35, 35, 0, 2*PI);
line(232, 120, 232, 400);
line(232, 125.5, 400, 315);

//saveFrame("hw1.jpg");


