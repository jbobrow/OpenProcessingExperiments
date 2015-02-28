
int cloudsize = 0;

void setup() {
  size(700, 700);
  
  background(110, 120, 130);
  smooth();
  noFill();
}

void draw() {
noStroke();
  cloudsize = int(random (250)); //random cloud size
  fill(mouseX, 200, mouseY);
  ellipse(mouseY, mouseX, cloudsize, 30); //whimsical mouse behavior
 
}

// function called when mouse is pressed
void mousePressed() {
  background(110, 120, 130);      // clears the background
}


