
float x = 264;  // x-coordinate
float y = 410;  // y-coordinate
float radius = 80;  //Head Radias
float bodyHeight = 153;  //Body Height
float neckHeight = 47;  //Neck Height
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
stroke(102);
line(x+2, y-bodyHeight, x+2, ny);
line(x+12, y-bodyHeight, x+12, ny);
line(x+22, y-bodyHeight, x+22, ny);

//Antennae
line(x+12, ny, x-18, ny-99);
line(x+12, ny, x+42, ny-99);

//Body
noStroke();
fill(102);
ellipse(x, y-33, 33, 33);
fill(0);
rect(x-45, y-bodyHeight, 90, bodyHeight-33);
fill(102);
rect(x-45, y-bodyHeight+17, 90, 6);

//Head
fill(0);
rect(x-34, ny, 80, 80);
fill(255);
ellipse(x+24, ny+20, 14, 14); // right eye
fill(0);
ellipse(x+24, ny+20, 3, 3); // right pupil
fill(153);
ellipse(x-14, ny+20, 14, 14); // left eye
fill(0);
ellipse(x-14, ny+20, 3, 3); // nose
fill(255);
ellipse(x+6, ny+40, 8, 8); // nose
ellipse(x-19, ny-95, 8, 8); // left antennae dot
ellipse(x+41, ny-95, 8, 8); // right antennae dot
}


