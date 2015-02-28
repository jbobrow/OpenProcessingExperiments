
float x = 0;
float y = 0;
float xSpeed = 4;
float ySpeed = 2;
float explode = 32;

void setup() {
  size(300, 300);
  smooth();
}

void draw() {
  background(255);

  x = x + xSpeed;
  y = y + ySpeed;

  if ((x > width) || (x < 0)) {
    
    // When ball hits screen, turn it around.
    xSpeed = xSpeed * -1;
    // Make ball explode
    explode = 70;   
  }
  
  if ((y > height) || (y < 0)) {
   
    ySpeed = ySpeed * -1;
    explode = 70;
  }

  stroke(0);
  fill(175);
  ellipse(x, y, explode, explode);
  
  explode = constrain(explode-2, 30, 70);
  
}

