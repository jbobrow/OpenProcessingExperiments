
// Set the beginning and end locations of horizontal ellipses
void keyPressed() {
  if (keyCode == 39) {
    frog.move(20, 0);
  } 
  if (keyCode == 37) {
    frog.move(-20, 0);
  }
  if (keyCode == 38) {
    frog.move(0, -20);
  }
  if (keyCode == 40) {
    frog.move(0, 20);
  }
} 


