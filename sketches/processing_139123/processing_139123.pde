
float x = 100;   // x location of square
float y = 0;     // y location of square

float speed = 0;   // speed of square

float gravity = 0.1;  

void setup() {
  size(400,400);

}

void draw() {
  background(255);

  // Display the square
  fill(189,mouseY+39,mouseX);
  stroke(0);
  ellipseMode(50);
  ellipse(x-50,y,50,50);
  
  fill(189,mouseY+39,mouseX);
  stroke(0);
  ellipseMode(350);
  ellipse(x+200,y,50,50);
  

  
  fill(189,mouseY+39,mouseX);
  stroke(0);
  ellipseMode(200);
  ellipse(x+75,y+125,50,50);
  
    fill(189,mouseY+39,mouseX);
  stroke(0);
  ellipseMode(350);
  ellipse(x+200,y+250,50,50);
  
  fill(189,mouseY+39,mouseX);
  stroke(0);
  ellipseMode(50);
  ellipse(x-50,y+250,50,50);
  
  
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

