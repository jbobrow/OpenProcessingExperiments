
size(540, 175);
smooth();
stroke(9);
background (random(#ffffff));
int[] x = {50, 175, 300};
int y = 85;
arrayCopy(x);
x = append (x, 445);

color[] c = new color [7];
c[0] = random(#ffffff);
c[1] = random(#ffffff);
c[2] = random(#ffffff);
c[3] = random(#ffffff);
c[4] = random(#ffffff);
c[5] = random(#ffffff);
c[6] = random(#ffffff);
c[7] = random(#ffffff);

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

strokeWeight(20);
stroke(c[6]);
fill(c[7]);
ellipse(x[3], y, 125, 125);
