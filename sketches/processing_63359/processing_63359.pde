
int x = 100;
int y = 100;
 
void setup() {
  size(500,500);
  smooth();  
  frameRate(8);
}
 
void draw() {
  noStroke();
  background(0);
  x = x + 5;
  y = y + 5;
   
  fill(random (50,255), random(50,255), random(50,255));
  ellipse(random (500),random(500),x,y);
}

void mousePressed() {
  
  x=0;
  y=0;
 
}

