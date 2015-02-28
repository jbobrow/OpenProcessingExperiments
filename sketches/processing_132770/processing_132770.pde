
size(400, 400);
background(171, 57, 216);
smooth();

//outer C
strokeWeight(15);
//strokeCap(SQUARE);
stroke(255);
noFill();
arc(150, 200, 265, 300, HALF_PI, PI+HALF_PI);

//inner C
strokeWeight(7);
strokeCap(SQUARE);
stroke(232, 152, 54);
noFill();
arc(150, 200, 265, 300, HALF_PI, PI+HALF_PI);

//outer A
strokeWeight(15);
strokeCap(ROUND);
stroke(255);
line(200, 360, 285, 40);
line(285, 40, 360, 360);
line(230, 265, 330, 265);

//inner A
strokeWeight(7);
strokeCap(SQUARE);
stroke(232, 152, 54);
line(200, 360, 285, 40);
line(285, 40, 360, 360);
line(230, 265, 330, 265);



