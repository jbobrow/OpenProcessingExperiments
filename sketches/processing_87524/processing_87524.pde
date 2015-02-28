
// prisca ohito, pohito, copyright by prisca a ohito 1.31.13

size(400, 400);
PImage b;
b = loadImage("imgres.jpg");
image(b, 0, 0, 400, 400);
strokeWeight(4);  // Thicker
stroke(255, 204, 0);
noFill();
arc(200, 100, 100, 80, PI, TWO_PI-PI/2);
//noFill();
arc(200, 100, 100, 80, TWO_PI-PI/2, TWO_PI);
//noFill();
arc(200, 250, 100, 300, PI/2, 100+PI/2);
//noFill();
stroke(255, 204, 0);
arc(125, 150, 100, 300, PI/2, 100+PI/2);
//noFill();
line(75, 0, 75, 375);
stroke(255, 204, 0);
arc(200, 100, 100, 80, PI, TWO_PI-PI/2);
//noFill();
arc(200, 100, 100, 80, TWO_PI-PI/2, TWO_PI);
//noFill();
arc(200, 250, 100, 300, PI/2, 100+PI/2);
//noFill();
line(250, 100, 250, 400);
stroke(255, 204, 0);
ellipse(275, 200, 100, 300);
//saveFrame("hw1.jpg");
