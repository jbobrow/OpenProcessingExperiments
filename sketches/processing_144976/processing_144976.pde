
float y = 0;    

float speed = 0;   

float gravity = 0.1;  

void setup() {
  size(600,600);

}

void draw() {
  background(0);

  // Display the square
  fill(250,243,20);
  stroke(0);
  rectMode(CENTER);
  for(int x = 0; x<=width; x = x +40){
  rect(x,y,20,20);
  }
  fill(247,30,201);
  for(int j = 20; j<=width; j = j +40){
  ellipse(j,y,20,20);  
  }
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

