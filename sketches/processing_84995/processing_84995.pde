
// SIZE AND MOVEMENT
  
float w = 80;
float y = 95;
float x = 65;
float h = 65;

// Speed
  
float speedX = 5;
float speedY = 4.5;
  
  
void setup() {
  
  size(550, 600);
  smooth();
  
  // circles
  ellipseMode(CORNERS);
  
}
  
void draw() {
    
  // colour and fill
  background(65, 221, 234);
  fill(255, 200, 0);
  
  // POSITION OF CIRCLE
  ellipse(x, y, w, h);
 
   
  x = x + speedX;
  y = y + speedY;
  
  // Impact Hits
  if ((x > width - w) || (x <= 0)) {
    speedX = -speedX;
  }
  
  //
  if ((y > height - h)||(y <= 0)) {
 
    speedY = -speedY;
  }
}




