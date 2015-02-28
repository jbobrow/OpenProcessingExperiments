
// luis gonzalez lgonza@cmu.edu  ©lgonza 2013

size (400,400);
background (200, 200, 0);
stroke(250, 0, 0);

// letter L
line (20, 20, 20, 380);
line (20, 380, 120, 380);

// Letter D
line (140, 20, 140, 380);
line(140, 20, 220, 20);
line(140, 380, 220, 380);
noFill();
arc(220, 45, 50, 50, TWO_PI-PI/2, TWO_PI);
line(245, 45, 245, 355);
arc(220, 355, 50, 50, 0, PI/2);

// Letter G
arc(290, 45, 50, 50, PI, TWO_PI-PI/2);
line(265, 45, 265, 360);
arc(290, 355, 50, 50, PI/2, PI);
line(290, 20, 350, 20);
line(290, 380, 350, 380);
arc(345, 45, 50, 50, TWO_PI-PI/2, TWO_PI);
arc(345, 355, 50, 50, 0, PI/2);
line(370, 40, 370, 140);
line(370, 200, 370, 360);
line(370, 200, 320, 200);


