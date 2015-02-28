
void setup() {
  size(400, 400); // set screen size to 400 x 400
  background(240);
}

void draw() {
  if (mousePressed == true) {
    fill(200, 0, 200); //***this value controls the clicked color
  } 
  else {
    fill (255); //***this fill controls the unclicked color
  }
  /* try changing rect to oval!
   try changing the width and height of the shape 
   (the 3rd and 4th parameters) */

  line(mouseX, mouseY, 90, 100);
}
