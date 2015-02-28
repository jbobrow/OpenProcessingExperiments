
size(500, 500);
smooth();
color[] oceanSunset = {#405952, #9C9B7A, #FFD393, #FF974F, #F54F29};
background(oceanSunset [2]);

noFill();
strokeWeight(50);
strokeJoin(ROUND);
stroke(oceanSunset[0]);
rectMode(CENTER);
rect(250, 250, 350, 350);

noStroke();
fill(oceanSunset[4]);
ellipse(250, 250, 100, 100);

rotate(PI*.25);
noFill();
strokeWeight(50);
strokeJoin(MITER);
stroke(oceanSunset[1]);
rect(350, 0, 200, 200);

rotate(PI*.75);
scale(.65);
noFill();
strokeWeight(40);
stroke(oceanSunset[3]);
rect(-385, -385, 350, 350);
