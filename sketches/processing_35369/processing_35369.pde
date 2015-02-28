
// homework 1
// copyright Emily So
background(0, 10, 130);
//"E"
fill(60, 10, 80);
size(400, 400 );
rect(10, 10, 80, 15);
rect(10, 10, 15, 150);
rect(10, 75, 80, 15);
rect(10, 145, 80, 15);
//dimension
fill(100, 175, 150);
rect(25, 25, 5, 50);
rect(25, 25, 65, 5);
rect(25, 90, 5, 55);
rect(25, 90, 65, 5);
rect(10, 160, 80, 5);
//"J"
noFill();
strokeWeight(15);
stroke(80, 10, 80);
arc(160, 120, 70, 70, 0, PI/2);
arc(160, 120, 70, 70, PI/2, PI);
line(195, 10, 195, 120);
//dimension
strokeWeight(5);
stroke(100, 175, 150);
arc(160, 120, 90, 90, 0, PI/2);
arc(160, 120, 90, 90, PI/2, PI);
line(205, 10, 205, 120);
//"S"
noFill();
strokeWeight(15);
stroke(100, 0, 100);
arc(275, 50, 70, 70, PI, TWO_PI-PI/2);
arc(275, 50, 70, 70, TWO_PI-PI/2, TWO_PI);
arc(275, 50, 70, 70, PI/2, PI);
arc(275, 120, 70, 70, TWO_PI-PI/2, TWO_PI);
arc(275, 120, 70, 70, 0, PI/2);
arc(275, 120, 70, 70, PI/2, PI);
//dimension
strokeWeight(5);
stroke(100, 175, 150);
arc(275, 50, 50, 50, PI, TWO_PI-PI/2);
arc(275, 50, 50, 50, TWO_PI-PI/2, TWO_PI);
arc(275, 50, 90, 90, PI/2, PI);
arc(275, 120, 50, 50, TWO_PI-PI/2, TWO_PI);
arc(275, 120, 90, 90, 0, PI/2);
arc(275, 120, 90, 90, PI/2, PI);
//triangles
stroke(80, 100, 80);
triangle(255, 255, 200, 200, 175, 255);
stroke(90, 150, 90);
triangle(300, 350, 200, 240, 175, 380);
stroke(20, 10, 20);
triangle (100, 330, 150, 180, 92, 200);
stroke(10, 100, 80);
triangle(300, 360, 280, 175, 380, 268);
stroke(20, 110, 90);
triangle(350, 88, 399, 140, 330, 120);
stroke(10, 190, 140);
line(310, 300, 290, 180);
line(315, 360, 380, 290);
stroke(20, 110, 90);
line(80, 210, 90, 300);
saveFrame("hw1.jpg");   
