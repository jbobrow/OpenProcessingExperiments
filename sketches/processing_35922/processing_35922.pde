
size(500,500);
background(255,0,0);
smooth();
fill(0, 0, 255);
noStroke();
//shoulders
ellipse(150, 400, 400, 400);
ellipse(350, 400, 400, 400);
//face
fill(255, 255, 0);
ellipse(250, 230, 300, 400);
ellipse(230, 425, 70, 70);
ellipse(265, 425, 70, 70);
strokeWeight(2);
stroke(0, 0, 0);
//lips
fill(255, 0, 255);
arc(250, 358, 150, 30, PI, 2*PI);
arc(250, 360, 150, 30, 0, PI);
//eyebrow
line(175, 359, 325, 359);
//nostril curves
fill(255, 255, 0);
arc(220, 300, 25, 25, PI/2, 3*PI/2);
arc(280, 300, 25, 25, 0, PI/2);
arc(280, 300, 25, 25, TWO_PI-PI/2, TWO_PI);
//nostril holes
fill(0, 0, 0);
ellipse(230, 300, 20, 20);
ellipse(270, 300, 20, 20);
//white eyeballs
fill(255, 255, 255);
arc(150, 250, 90, 100, 0, PI);
arc(350, 250, 90, 100, 0, PI);
line(105, 250, 195, 250);
line(305, 250, 395, 250);
//pupils
fill(0, 0, 0);
rect(140, 250, 20, 45);
rect(340, 250, 20, 45);
ellipse(150, 290, 20, 20);
ellipse(350, 290, 20, 20);
rect(105, 240, 290, 5);

strokeWeight(2);
line(300, 35, 300, 45);
line(247, 32, 247, 22);
line(260, 50, 260, 60);
line(274, 32, 274, 42);
line(230, 40, 230, 50);
line(209, 46, 209, 36);
line(200, 44, 200, 34);
line(280, 40, 280, 50);
