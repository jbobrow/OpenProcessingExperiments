
float r;
float g;
float b;
float a;
 
float diam;
float x;
float y;
 
void setup() {
  size(250, 250);
  background(255, 204, 0);
  noStroke();
}
  
void draw() {
    
  ellipseMode(CENTER);
 
  r = random(300);
  g = random(300);
  b = random(300);
  a = random(300);
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



