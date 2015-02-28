
//Move the cursor around the screen to produce dots.
//The faster the cursor moves, the lighter it becomes.
//Click and move the cursor to make white dots.
//The faster the cursor moves while pressed, the larger the dots become.
//While pressed, different areas on the screen produce different colors!

float x;
float y;
//float easing = 0.1;

void setup() {
  size(screen.width, screen.height);
  smooth();
  //fill(0, 204);
  cursor(HAND);
}

void draw() { 
  float speed = dist (mouseX, mouseY, pmouseX, pmouseY);
  if (mousePressed) {
  noStroke();
  //fill(255);
  fill(mouseX, mouseY, pmouseX, pmouseY);
  ellipse(mouseX, mouseY, speed, speed);
  //line(mouseX, mouseY, pmouseX, pmouseY);
  } else {
    fill(speed * 5);
    ellipse (mouseX, mouseY, 10, 10); 
  }
}

