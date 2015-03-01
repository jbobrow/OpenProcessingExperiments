
float r;
float g;
float b;
float a;

int minDiam = 1;
int maxDiam = 50;
int diam;
int increment = 5;

void setup() {
  size(800,800);
  background(255);
  diam = minDiam;
  smooth();    
}

void draw() {
  r = random(150);
  g = random(150);
  b = random(150);
  a = random(255);
// set to 150 to avoid really harsh colors
}
 void mouseDragged() {
  frameRate(30);
  r = random(200);
  g = random(200);
  b = random(200);
  a = random(255);
  noStroke();
  fill(r,g,b,a);
  ellipse(mouseX, mouseY, diam, diam);
  diam = diam + increment;
  if (diam > maxDiam || diam < minDiam) {
    increment = -increment;

  float speed = (abs(mouseX-pmouseX/2)+abs(mouseY-pmouseY/2));
   
  strokeWeight(speed);
   
   float transparency = speed*5;
    
  transparency = constrain(transparency ,0,10);
   
  stroke(0, transparency);
  line(pmouseX, pmouseY, mouseX, mouseY);

  }
 }

void keyPressed() {
  if (key == 'c') {
    background(255);
  }
}

