
void setup() {
  size (500, 500); // sets canvas size to 500 by 500 
}
void draw() {
  ellipse(mouseX, mouseY, 150, 150); //this will make the circle follow the mouse everywhere it goes
  if (mouseX< 500) { 
  fill(random(255), random(255), random(255));// fills in the color randomly
  } 
}
void mousePressed() { // when the mouse is clicked 
  rect(0, 0, 500, 500); //it resets the background
}
void keyPressed() {
  rect(mouseX,mouseY,150,150); //when the key is pressed it  makes a square
}
