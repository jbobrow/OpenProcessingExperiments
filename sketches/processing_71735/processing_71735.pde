
void setup() {
  size(800, 800);
  noLoop();  // draw() will not loop
}

float y = 800;
float x = 0;
float z = 0;
float a = 0;
float b = 800;
float c = 400;
float d = 400;
float g = 0;
float e = 0;
float r = 0;
float s = 0;


void draw() {
  //background (random(255),random(255),random(255),random(100));
  r = r + .5;
  if (r > 30) {
    r = 0;
    background (random(255),random(255),random(255),(r));
  }
  
  x = x + .5;
  if (x > width) {
    x = 0;
  }
  noStroke();
  fill(random(255),random(255),random(255),random(50));
  rect(mouseX, random(800), mouseX, mouseY); 
  
  y = y - 1;
if (y > width) {
    y = 800;
  }
  fill(random(255),random(255),random(255),random(50));
  rect(y, random(800), y, mouseX); 
  
    z = z - 1;
if (z > width) {
    z = 400;
  }
  fill(random(255),random(255),random(255),random(70));
  rect(mouseX, random(800), random(800), mouseY); 
  
  a = a - 1;
if (a > width) {
    a = 400;
  }
  fill(random(255),random(255),random(255),random(60));
  rect(random(800), mouseX, random(800), mouseY); 
  
 b = b - 1;
if (b > width) {
    b = 0;
  }
  fill(random(255),random(255),random(255),random(90));
  quad(random(800), random(800), mouseX,random(800), mouseY, random(800),random(800), mouseY);
  
  s = s + .1;
  if (s > 40) {
    s = 0;
    background (random(255),random(255),random(255),(s));
  }
 
  c = c - 1;
if (c > width) {
    c = 0;
  }
  fill(random(255),random(255),random(255),random(40));
  quad(random(800), mouseX, random(800),random(800), random(800), mouseY,random(800), mouseY);
 
  d = d - 1;
if (d > width) {
    d = 0;
  }
  fill(random(255),random(255),random(255),random(30));
  quad(random(800), random(800), random(800),random(800), random(800), random(800),random(800), mouseX);
 
  e = e - 1;
if (e > width) {
    e = 0;
  }
  fill(random(255),random(255),random(255),random(20));
  quad(random(800), random(800), random(800),random(800), random(800), random(800),random(800), mouseY);
 
  g = g - 1;
if (b > width) {
    g = 0;
  }
  quad(random(800), random(800), random(800),random(800), random(800), random(800),random(800), mouseX); 
}

void mousePressed() {
  loop();  // Holding down the mouse activates looping
}

void mouseReleased() {
  noLoop();  // Releasing the mouse stops looping draw()
}

