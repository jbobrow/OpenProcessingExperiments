
float x = 150;   
float y = 0;    
 
float speed = 0;   
 

float gravity = 0.2;  
 
void setup() {
  size(300,300);
 
}
 
void draw() {
  background(225,0,100);
 
  
  fill(0,0,225,90);
  stroke(0);
  ellipseMode(CENTER);
  ellipse(x,y,40,40);
   
  // Add speed to location.
  y = y + speed;
   
  // Add gravity to speed.
  speed = speed + gravity;
   
  // If square reaches the bottom
  // Reverse speed
  if (y > height) {
    // Multiplying by -0.95 instead of -1 slows the square down each time it bounces (by decreasing speed).  
    // This is known as a "dampening" effect and is a more realistic simulation of the real world (without it, a ball would bounce forever).
    speed = speed * -0.95;  
  }
}



