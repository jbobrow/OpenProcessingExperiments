
int x = 55;
int y = 420;
int bodyHeight = 110;
int neckHeight = 140;
int radius = 45;
int ny = y - bodyHeight - neckHeight - radius;

size(170, 480);
smooth();
strokeWeight(2);
background(204);
ellipseMode(RADIUS);

//Neck
fill(145, 81, 210);
stroke(0, 85, 0);
strokeWeight(8);
line(x+2, y-bodyHeight, x-1, ny);
stroke(0);
line(x+12, y-bodyHeight, x+12, ny);
stroke(145, 81, 210);
line(x+22, y-bodyHeight, x+22, ny);

//Antennae
fill(145, 81, 210);
line(x+12, ny, x-18, ny-43);
stroke(0, 85, 0);
line(x+12, ny, x+42, ny-99);
stroke(0, 130, 255);
line(x+12, ny, x+78, ny+15);
line(x+12, ny, x-30, ny-43);

//Body
noStroke();
fill(0, 130, 255);
ellipse(x, y-33, 33, 33);
fill(0);
rect(x-33, y-bodyHeight-10, 67, 48);
fill(145, 81, 210);
rect(x-33, y-bodyHeight-30, 67, 48);
fill(0, 85, 0);
rect(x-33, y-75, 67, 48);

//Head
fill(0);
ellipse(x+12, ny, radius, radius);
fill(0, 130, 255);
ellipse(x+20, ny-6, 3, 3);   //Center Eye
fill(0, 85, 0);
ellipse(x, ny-8, 5, 5);
fill(145, 81, 210);
ellipse(x+30, ny-26, 4, 4);
fill(145, 81, 210);
ellipse(x+41, ny+6, 3, 3);
fill(0, 85, 0);
ellipse(x+18, ny+15, 5, 5);
