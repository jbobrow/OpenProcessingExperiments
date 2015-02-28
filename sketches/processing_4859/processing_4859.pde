
PShape s;
size(200,200);
background(0);
s = loadShape("Star.svg");
smooth();
shapeMode(CENTER);
fill(255,0,0);
shape(s, width/2,height/2, 100,100);

