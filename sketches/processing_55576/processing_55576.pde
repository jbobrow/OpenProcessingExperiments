



float x = 264;
float y = 420;
int bodyHeight = 180;
int neckHeight = 70;
int radius = 45;


float easing = 0.02;
void setup() {
  size(520, 480);
  smooth();
  strokeWeight(2);
  ellipseMode(RADIUS);
}

void draw() {
  
  int targetX = mouseX;
  x += (targetX - x) * easing;
  
  if (mousePressed) {
    neckHeight = 40;
    bodyHeight = 120;
  } else {
    neckHeight = 70;
    bodyHeight = 180;
  }
  float ny = y - bodyHeight - neckHeight - radius;
  
background(204);

// Neck
stroke(25);
line(x+12, y-bodyHeight, x+12, ny);
line(x+2, y-bodyHeight, x+2, ny);
line(x+22, y-bodyHeight, x+22, ny);

// Antennae
line(x+12, ny, x-18, ny-105);
line(x+12, ny, x+6, ny-75);
line(x+12, ny, x+42, ny-45);
line(x+12, ny, x+78, ny+15);

// Body
noStroke();
fill(0);
ellipse(x+26, y-bodyHeight-15, radius-20, radius-20);
fill(20);
ellipse(x, y-43, radius-12, radius-12);
fill(250);
ellipse(x, y-bodyHeight-7, radius-12, radius-12);
fill(0);
rect(x-45, y-bodyHeight, 90, bodyHeight-43);
fill(200);
rect(x-45, y-bodyHeight+10, 90, 6);
fill(250);
rect(x-84, y-bodyHeight+23, 60, 10);
fill(250);
rect(x+36, y-bodyHeight+33, 60, 10);
fill(250);
ellipse(x+16, y-bodyHeight+43, radius-40, radius-40);
fill(153);
ellipse(x+16, y-bodyHeight+63, radius-40, radius-40);
fill(153);
rect(x-34, y-bodyHeight+33, 20, bodyHeight-93);
fill(240);
rect(x-24, y-70, 20, 20);
fill(250);
ellipse(x-14, y-10, radius-35, radius-35);
fill(250);
ellipse(x+16, y-10, radius-35, radius-35);
fill(0);
arc(x+16, y-10, radius-35, radius-35, QUARTER_PI, PI+QUARTER_PI);
fill(0);
arc(x-14, y-10, radius-35, radius-35, QUARTER_PI, PI+QUARTER_PI);

// Head
fill(0);
ellipse(x+12, ny, radius, radius);
fill(255);
ellipse(x+24, ny-5, radius-31, radius-31);
fill(0);
ellipse(x+24, ny-5, radius-42, radius-42);
fill(153);
ellipse(x-1, ny-7, radius-40, radius-40);
ellipse(x+32, ny-25, radius-41, radius-41);
ellipse(x+41, ny+7, radius-42, radius-42);
}



