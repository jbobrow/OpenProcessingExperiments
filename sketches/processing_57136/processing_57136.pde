

float x = 250;
float y = 300;
float bodyHeight = 60;
float neckHeight = 10;
float radius = 100;
float angle = 0.0;

void setup() {
  size(500, 480);
  smooth();
  strokeWeight(2);
  background(120, 20, 115);
}

void draw() {
  x += random(-4, 4);
  y += random(-1, 1);
  
  neckHeight = 80 + sin(angle) * 30;
  angle += 0.05;

float ny = y - bodyHeight - neckHeight - radius;


stroke(0);
line(x+4, y-bodyHeight, x+4, ny);
line(x+14, y-bodyHeight, x+14, ny);
line(x+24, y-bodyHeight, x+24, ny);

line(x, ny+25, 193, ny+95); // left arm
line(x+20, ny+25, 334, ny+95); // right arm

line(x-5, 380, x-5, y-40); // leg
line(x+30, 380, x+30, y-40); // leg

// Body
noStroke();
fill(240, 195, 237);
arc(x-16, 385, 33, 33, 3.14259, 3.14259*2); // foot
fill(240, 195, 237);
arc(x+44, 385, 33, 33, 3.14259, 3.14259*2); // foot
fill(37, 0, 255);
rect(x-16, y-bodyHeight-28, 60, bodyHeight); // main body
fill(102);
rect(x-20, y-bodyHeight-5, 67, 10); // grey rectangle
fill(240, 195, 237);
ellipse(x+14, y-bodyHeight, 45, 45); // ball

// Head
fill(240, 195, 237);
ellipse(x+15, ny-35, 40, 40); // little head on the top
fill(37, 0, 255);
ellipse(x+14, ny+25, radius, radius); // head
fill(240, 208, 160);
ellipse(x+14, ny+25, radius-20, radius-20); // face
fill(0);
rect(x-35, ny, 40, 6); // left eyebrows
fill(0);
rect(x+24, ny, 40, 6); // right eyebrows
fill(0);
ellipse(x+38, ny+20, 15, 15); // right eye
fill(255);
ellipse(x+36, ny+17, 7, 7); // right eye 1
fill(0);
ellipse(x-10, ny+20, 15, 15); // left eye
fill(255);
ellipse(x-12, ny+17, 7, 7); // left eye 1
fill(240, 195, 237);
ellipse(x-50, ny+90, 20, 20); // left hand
fill(240, 195, 237);
ellipse(x+80, ny+90, 20, 20); // right hand
}

