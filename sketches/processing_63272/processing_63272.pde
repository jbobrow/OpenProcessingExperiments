
float x = 0;
float y = 0;
float speedx = random (5);
float speedy = random (5);
float r;
float g;
float b;

 
 
 
void setup() {
  size(400, 400);
  smooth();
  background(255);
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
  rect(x, y, 50, 50);
}
 
void mousePressed () {
   
  saveFrame ("huepfball.png");
   
}


