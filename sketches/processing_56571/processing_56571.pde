
float x = 264;  // x-coordinate
float y = 344;  // y-coordinate
float radius = 45;  //Head Radias
float bodyHeight = 87;  //Body Height
float neckHeight = 57;  //Neck Height 
float angle = 0.0;  //Angle for motion

PImage landscape;

void setup() {
size(720, 480);
smooth();
ellipseMode(RADIUS);
landscape = loadImage("alpine.png");
smooth();
}


void draw() {
  
  background(landscape);
  
  x += random(-4, 4);
  y += random(-1, 1);
  
  neckHeight = 80 + sin(angle) * 30;
  angle += 0.05;
  
  float ny = y - bodyHeight - neckHeight - radius;  //Neck Y
  

//Neck
stroke(10);
line(x+2, y-bodyHeight, x+2, ny);
line(x+7, y-bodyHeight, x+7, ny);
line(x+12, y-bodyHeight, x+12, ny);
line(x+22, y-bodyHeight, x+22, ny);

//Antennae
line(x+12, ny, x-18, ny-43);
line(x+12, ny, x+42, ny-99);
line(x+12, ny, x+56, ny-65);
line(x+12, ny, x+116, ny-55);
line(x+12, ny, x+136, ny-135);
line(x+12, ny, x+60, ny+45);

//Body
noStroke();
fill(102);
ellipse(x, y+33, 33, 33);
fill(0);
rect(x-45, y-bodyHeight, 90, bodyHeight+33);
fill(102);
rect(x-45, y-bodyHeight+17, 90, 6);
fill(255);
rect(x-84, y-bodyHeight+73, 90, 6);
fill(255);
rect(x-84, y-bodyHeight+93, 90, 6);

//Head
fill(0);
ellipse(x+12, ny, radius, radius);
fill(255);
ellipse(x+24, ny-5, 14, 14);
fill(0);
ellipse(x+24, ny-5, 3, 3);
fill(255);
ellipse(x-6, ny-15, 12, 12);
fill(0);
ellipse(x-6, ny-15, 2, 2);
fill(153);
ellipse(x+32, ny-25, 4, 4);
ellipse(x+41, ny+7, 3, 3);
}

