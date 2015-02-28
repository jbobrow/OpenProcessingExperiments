
void setup() {
  size(300, 300);
  smooth();
  background(0);
  noStroke();
}
//This changes the background color when the mouse is clicked
void draw() {
  if (mousePressed) {
    background(250);
  } 
  //This states the normal colorof the ellipse when the mouse is not clicked
  else {
    fill(255, 255, 255);
    background(0);
  }
  //This is the measurements for the ellipse
  ellipse(mouseX, mouseY, 80, 80);

  //This statement calls out what portion of the screen that will be affected
  if (mouseY<height/2) {
    rect(150, 150, 300, 150);
  }
  //When the mouse is not affected by conditions stated above it is this color
  else {
    fill(0, 255, 80, 50);
  }
  //This statement calls out what portion of the screen that will be affected
  if (mouseX<height/2) {
    rect(0, 150, 150, 150);
  }
  //When the mouse is not affected by conditions stated above it is this color
  else {
    fill(0, 0, 255, 40);
  }
}


