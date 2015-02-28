
float x = 20;
float y = 20;
float speed = 1;
 
void setup() {
  size(200, 200);
  smooth();
}
void draw() {
  background(255);
  x = x + speed;
  
  noStroke();
  fill(175);
  ellipse(x, y, 32, 32);
  
  if (x >= 180) {
    x = x - speed;
    y = y +1;
    
  }
  
  if (y >= 180) {
    y = y - speed;
    
    x = x + speed;
   speed = -speed; 
  }
  
  if (x == 19) {
    x = x - speed;
    
    y = y + speed;
  } 
  
  if (y == 20) {
    x = x - speed;
    y = y+1;
    speed = -speed;
  }
  
}


