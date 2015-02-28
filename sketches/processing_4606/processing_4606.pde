
float r;
float g;
float b;
float a;

float diam;
float x;
float y;

int value = 255;


void setup() {
  size(400,400);
  background(0);
  smooth();
  
}
void draw() {
   fill (value);
   noStroke();
 
  stroke(r,g,b,a);
  strokeWeight(10);
  line(pmouseX,pmouseY,mouseX,mouseY);
  r = random(111,255);
  g = random(111,255);
  b = random(111,255);
  a = random(111,255);
  diam = random(20);
  x = random(width);
  y = random(height);
  //ellipse confetti
  //noStroke();
  //fill(r,g,b,a);
  //ellipse(x,y,diam,diam);
  
}
void mousePressed() {
  if (mouseButton == LEFT){
  background(255);
} else if (mouseButton == RIGHT) {
  background(r,g,b,a);
  
  
  
  
  

  
}
}
 
  
  




