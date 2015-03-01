
int x = 60; //x-coordinate
int y = 450; //y-coordinate
int bodyHeight = 245; //body height
int neckHeight = 40; //neck height
int radius = 45; //head height
int ny = y - bodyHeight - neckHeight - radius; //neck y

size(170, 480);
smooth();
strokeWeight(2);
background(200);
ellipseMode(RADIUS);

//floor
noStroke();
fill(125);
rect(0, 350, 170, 200);

//neck
stroke(102);
line(x-2, y-bodyHeight, x+2, ny);
line(x+12, y-bodyHeight, x+12, ny);
line(x+22, y-bodyHeight, x+22, ny);

//antennae
line(x+12, ny, x-18, ny-43);
line(x+12, ny, x+42, ny-99);
line(x+12, ny, x+78, ny+15);

//body
noStroke();
fill(0);
ellipse(x, y-33, 33, 33);
fill(0, 85, 0);
rect(x-45, y-bodyHeight, 90, bodyHeight-33);
fill(255, 229, 136);
rect(x-45, y-bodyHeight+17, 90, 6);

//head
fill(0, 85, 0);
ellipse(x+12, ny, radius, radius);
fill(0);
ellipse(x+24, ny-6, 14, 14);
fill(255, 0, 0);
ellipse(x+24, ny-6, 3, 3);
fill(0, 130, 255);
ellipse(x, ny-8, 5, 5);
fill(134, 255, 0);
ellipse(x+30, ny-26, 4, 4);
fill(145, 81, 212);
ellipse(x+41, ny+6, 3, 3);


