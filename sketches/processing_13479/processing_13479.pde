
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
stroke(9,22,24);
line(x+2, y-bodyHeight, x+2, ny);
line(x+12, y-bodyHeight, x+12, ny);
line(x+22, y-bodyHeight, x+22, ny);

//Antennea - antena
line(x+23, ny, x-18, ny-43);
line(x+90, ny, x+42, ny-99);
line(x+12, ny, x+78, ny+15);

//Body - cuerpo
noStroke();
fill(144,51,23);
ellipse(x, y-33, 33, 33);
fill(72,151,513);
rect(x-80, y-bodyHeight, 90, bodyHeight-33);
fill(72,34,12);
rect(x-4, y-bodyHeight+17, 90, 6);

//Head - cabeza
fill(60,345,123);
ellipse(x+50, ny, radius, radius);
fill(255);
ellipse(x+24, ny-6, 14, 14);
fill(5,22,22);
ellipse(x+2, ny-6, 3, 3);
fill(15,35,122);
ellipse(x, ny-8, 5, 5);
ellipse(x+30, ny-26, 4, 4);
ellipse(x+1, ny+6, 3, 3);

