
float theta = 0;
float thetaInc = 0.08;
int amp = 6;
float s = 5;
float r = 255;
int rInc = 30; 
int num = 40;
PVector mouse;
float dmouse;
PVector center;


void setup() {
  size(600, 600);
  smooth();
  background(0);
  center = new PVector(width/2, height/2);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  
  if (mousePressed == true) {
    s = amp*sin(theta) + amp;
    r = 255*sin(theta+ PI/3) + 255;
    theta += thetaInc;
  } 
  
   mouse = new PVector(mouseX, mouseY);
  dmouse = mouse.dist(center);
  
   float t = map(mouseX, 0, width, 0, TWO_PI);
  float u = map(mouseY, 0, height, 0, TWO_PI);
  int a = int(map(mouseX, 0, width, 0, 255));
  int b = int(map(mouseY, 0, width, 0, 255));
  int c = int(map(dmouse, 0, 1.7*width/2, 0, 255));
  
  color col = color(a, b, c);
  noFill();
  stroke(col, r);
  strokeWeight(s);
  strokeCap(SQUARE);
  
   for (int i = 0; i < num; i++){
    float radius = i*rInc;
    float angle = i*i*PI/10;;
   pushMatrix();
  rotate(u);
  arc(0, 0, radius, radius, angle, angle + t);
  popMatrix();
   }
}

