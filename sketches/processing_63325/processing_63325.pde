
float x = 0;
float y = 0;
float speedx = random (4);
float speedy = random (4);
float r;
float g;
float b;
 
  
  
  
void setup() {
  size(500, 500);
  smooth();
  background(25);
}
void draw() {
  
  
  x = x + speedx;
  y = y + speedy;
  
  if ((x > height) || (x < 0)) {
    speedx = speedx * -1;
  }
  
  if ((y > width) || (y < 0)) {
    speedy = speedy * -1;
  }
  
  r = random(255);
  g = 0;
  b = 0;
   
  
  stroke(255);
  fill(r,g,b);
  line(x, y, 250, 250);
}
  
void keyPressed () {
    
  saveFrame ("shed.png");
    
}

