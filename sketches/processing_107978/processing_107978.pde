
void setup() {
  size(800, 600);
  background(0); 
}
float spinner = 0;
float sizeScale = 50; // declaring varaibles
float wheel;
void draw() {
  background(0);
  pushMatrix(); // allows for origin to move
  translate(mouseX, mouseY); // moves origin to mouse curser
  if (mousePressed && mouseButton == LEFT) {
    spinner = spinner - 0.1; // Step to the left (ccw)
  }
  if ( mousePressed && mouseButton == RIGHT) {
    spinner =spinner + 0.1; // Step to the right (cw)
  }
  if (keyPressed) {
    if (key == 'r' || key == 'R') {
      fill(255,0,0); // r is for red
    }
    if (key == 'g' || key == 'G') {
      fill(0,255,0); // g is for green
    }
    if (key == 'b' || key == 'B') {
      fill(0,0,255); // b if for blue
    }
    if (key == 'w' || key == 'W') {
      fill(255);  // w is for white 
    }
  
  }
  sizeScale = sizeScale+(wheel*5); // makes square bigger or smaller
  rotate(spinner); //rotates the square if mouseWheel is moved
  rect(sizeScale/-2, sizeScale/-2,sizeScale, sizeScale); // makin dat square

  popMatrix(); //puts origin back to top left cornor
  wheel = 0.0; //makes it so that scaling stops
}
void mouseWheel(MouseEvent event) {
  wheel = event.getAmount(); // magic that gets the mouseWheel value (-1 or 1)
}




