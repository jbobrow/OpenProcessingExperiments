
float theta;   
float xoff = 0.0;

void setup() {
  size(800,650);
  smooth();
}

void draw() {
  
  xoff=xoff+.01;
  background(0);
  frameRate(30);
  stroke(255);
  // Let's pick an angle 0 to 90 degrees based on the mouse position
  float a = (mouseX / (float) width) * 90f;
  // Convert it to radians
  theta = radians(a*sqrt(xoff));
  // Start the tree from the bottom of the screen
  //translate(width/2,height);
  // Draw a line 120 pixels
  ellipse(0,0,0,0);
  // Move to the end of that line
  translate(0,0);
  // Start the recursive branching!
  branch(120);

}

void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.66;
//  xoff=xoff+50;
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    ellipse(height/2, width/2, -h, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta*sqrt (xoff));
    ellipse(h, xoff, -h, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}

