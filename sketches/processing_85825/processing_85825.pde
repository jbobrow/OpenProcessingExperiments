
//© LAURA TJHO, LTJHO
size(400, 400);
background(243, 232, 224);
smooth();

stroke(138, 197, 191);
strokeWeight(5);
line(125, 255, 160, 150);
line(125, 255, 200, 255);
line(200, 255, 200, 150);
line(160, 150, 250, 150);

strokeWeight(1);
noStroke();
fill(234, 118, 118, 80);
ellipse(260, 150, 6, 6);
ellipse(280, 150, 9, 9);
ellipse(300, 150, 13, 13);
ellipse(200, 265, 6, 6);
ellipse(200, 290, 11, 11);
ellipse(200, 340, 20, 20);
ellipse(166, 142, 6, 6);
ellipse(169, 130, 10, 10);
ellipse(175, 115, 15, 15);
ellipse(200, 55, 35, 35);

stroke(138, 197, 191);
strokeWeight(0.5);
fill(138, 197, 191, 50);
triangle(125, 255, 160, 150, 200, 255);
triangle(200, 255, 160, 150, 240, 150);

stroke(138, 197, 191);
strokeWeight(1);
line(65, 255, 400, 255);
line(0, 150, 335, 150);

noFill();
strokeWeight(0.5);
arc(150, 210, 200, 250, PI/2, PI-PI/6);
arc(250, 200, 200, 250, TWO_PI-PI/2, TWO_PI-PI/6);
strokeWeight(1);
arc(150, 210, 250, 300, PI/2, PI-PI/6);
arc(250, 200, 250, 300, TWO_PI-PI/2, TWO_PI-PI/6);

//saveFrame("hw1.jpg");



