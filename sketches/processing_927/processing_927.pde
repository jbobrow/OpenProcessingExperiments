
//  mehmet ergün 0343007 Grafik Tasarım  m_ibadeth@hotmail.com
// Cıcekten harflere parcalanan şekil


float theta;   

void setup() {
  size(1000, 500);
  smooth();
}

void draw() {
  background(8000000);
  frameRate(580);
  stroke(255);
  // Let's pick an angle 0 to 90 degrees based on the mouse position
  float a = (mouseX / (float) width) * 90f;
  // Convert it to radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(width/30,height);
  // Draw a line 120 pixels
  line(-1,25,0,-200);
  // Move to the end of that line
  translate(10,-300);
  // Start the recursive branching!
  branch(70);

}

void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.66;
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, +h);
    branch(h);
    popMatrix();
  }
}

