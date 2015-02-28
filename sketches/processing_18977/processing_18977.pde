
// variables II
// make a variable change, and use that variable to control
// position -> you've got motion!

int x = 0;

//--------------------------------------------------------
void setup() {
  size(300, 300);
  smooth();
  noFill();
  stroke(255); // white
  strokeWeight(2);
}

//--------------------------------------------------------
void draw() {
  background(64); // dark gray
  ellipse(x, 150, 100, 100);
  // increase x by 1 every frame
  x = x + 1;
}
