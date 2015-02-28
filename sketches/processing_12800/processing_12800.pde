
int x = 60;
int y = 420;
int bodyHeight = 110;
int neckHeight = 140;
int radius = 45;
int ny = y - bodyHeight - neckHeight - radius;

size(170, 480);
smooth();
strokeWeight (2);
background (204);
ellipseMode (RADIUS);


// Neck - cuello
stroke(102);
line(x+2, y-bodyHeight, x+2, ny);
line(x+12, y-bodyHeight, x+12, ny);
line(x+22, y-bodyHeight, x+22, ny);

//Antennea - antena
line(x+12, ny, x-18, ny-43);
line(x+12, ny, x+42, ny-99);
line(x+12, ny, x+78, ny+15);

//Body - cuerpo
noStroke();
fill(255,0,128);
ellipse(x, y-33, 33, 33);
fill(0);
rect(x-45, y-bodyHeight, 90, bodyHeight-33);
fill(11,21,224);
rect(x-45, y-bodyHeight+17, 90, 6);

//Head - cabeza
fill(0);
ellipse(x+12, ny, radius, radius);
fill(255);
ellipse(x+24, ny-6, 14, 14);
fill(60,0,255);
ellipse(x+24, ny-6, 3, 3);
fill(255,0,128);
ellipse(x, ny-8, 5, 5);
ellipse(x+30, ny-26, 4, 4);
ellipse(x+41, ny+6, 3, 3);

