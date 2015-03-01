
int x = 60;
int y = 420;
int bodyHeight = 150;
int neckHeight = 60;
int radius = 40;
int ny = y - bodyHeight - neckHeight - radius;

size(170, 480);
smooth();
strokeWeight(2);
background(204);
ellipseMode(RADIUS);

//Neck
stroke(102);
line(x+2, y-bodyHeight, x+20, ny);
line(x+12, y-bodyHeight, x+30, ny);
line(x+22, y-bodyHeight, x+40, ny);

//Antennae
line(x+30, ny, x-18, ny-43);
line(x+30, ny, x+42, ny-99);
line(x+30, ny, x+78, ny+15);

//Body
noStroke();
fill(39, 192, 240);
//ellipse(x, y-33, 33, 33);
arc(x-30, y-30, 15, 15, radians(0), radians(180)); //hover orb 1
arc(x+30, y-30, 15, 15, radians(0), radians(180)); //hover orb 2
fill(255);
rect(x-45, y-bodyHeight, 90, bodyHeight-33);
fill(102);
rect(x-45, y-bodyHeight+17, 90, 6);


//Head
fill(255);
ellipse(x+30, ny, radius, radius);
fill(0);
ellipse(x+42, ny-6, 14, 14);
fill(74, 102, 150);
ellipse(x+42, ny-6, 4, 10); //iris
fill(74, 155, 150); 
ellipse(x+42, ny-6, 2, 5); //pupil
fill(153);
ellipse(x+18, ny-8, 5, 5);
ellipse(x+48, ny-26, 4, 4);
ellipse(x+59, ny+6, 3, 3);

