
float x = 0;
float y = 0;
float speedx = random (5);
float speedy = random (5);
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
  
  r = random(125);
  g = 100;
  b = 100;
   
  
  stroke(45,2,245 );
  fill(r,g,b);
  ellipse(x, y, 250, 250);
}
  
void keyPressed () {
    
  saveFrame ("shed.png");
    
}

