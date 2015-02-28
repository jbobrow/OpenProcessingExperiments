
size(375, 150);
smooth();
stroke(9);
background (random(#ffffff));
int[] x = {50, 175, 300};
int y = 65;

color[] c = new color [5];
c[0] = random(#ffffff);
c[1] = random(#ffffff);
c[2] = random(#ffffff);
c[3] = random(#ffffff);
c[4] = random(#ffffff);
c[5] = random(#ffffff);

strokeWeight(15);
stroke(c[0]);
fill(c[1]);
ellipse(x[0], y, 65, 65);

strokeWeight(5);
stroke(c[2]);
fill(c[3]);
ellipse(x[1], y, 85, 85);

strokeWeight(10);
stroke(c[4]);
fill(c[5]);
ellipse(x[2], y, 105, 105);
