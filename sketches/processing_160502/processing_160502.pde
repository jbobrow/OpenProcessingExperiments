
float r;
float g;
float b;
float a;

float diam;
float x;
float y;

void setup() {
  size(700, 700);
  background(255);
  noStroke();
}
 
void draw() {
   
  ellipseMode(CENTER);

  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(100);
  x = random(width);
  y = random(height);
  
  if (mousePressed) {
     
    float x = random(mouseX-50,mouseX+50);
    float y = random(mouseY-50,mouseY+50);
   
    fill(r,g,b,a);
    ellipse (mouseX,mouseY,diam,diam);
  }
}



