
color[] rainbow = {#CC5C54, #85A562, #FFFFCD};

size(600, 200);
background(rainbow[0]);
smooth();
noSmooth();

strokeWeight(15);
stroke(rainbow[1]);
strokeCap(SQUARE);
line(10, height/2, 500, height/2);

noFill();
strokeJoin(ROUND);
rect(20, 100, 20, 75);
