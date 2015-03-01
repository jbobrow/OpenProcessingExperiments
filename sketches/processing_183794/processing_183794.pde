
float speed = 10;
int diameter = 50;
float x;
float y;
float px;
float py;

void setup() {
  
 size(600, 600);
 background(0);
 smooth();
 x = width/2;
 y = height/2;
 
}

void draw() {
  x += random (-speed, speed);
  y += random (-speed, speed);
 
  x = constrain(x, 0, width);
  y = constrain(y, 0, height);
  
ellipse(x, y, diameter, diameter);
// line(px, py, x, y);
// px = x;
// py = y;
  fill(255, 20);
  
 
  
}


