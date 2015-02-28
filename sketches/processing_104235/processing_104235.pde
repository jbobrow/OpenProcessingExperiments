
/**
 * Recursive Tree
 * by Daniel Shiffman.  
 * 
 * Renders a simple tree-like structure via recursion. 
 * The branching angle is calculated as a function of 
 * the horizontal mouse location. Move the mouse left
 * and right to change the angle.
 */
 
 ///edit by Cameron Breze @ pgss 2013
 //my initials? see if you can find them
 
 
float theta;   

void setup() {
  size(400, 600);
}

void draw() {
  background(0);
  frameRate(30);
  // Let's pick an angle 0 to 90 degrees based on the mouse position
  float a = (mouseX / (float) width) * 90f;
  // Convert it to radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(5,height);
  // Draw a line 120 pixels
  line(0,0,0,-300);
  // Move to the end of that line
  translate(0,-300);
  // Start the recursive branching!
  //branch(510);
  //stroke(40, 120, 70, 40);
  //branch(270);
  //stroke(100, 80, 215, 40);
  //branch(60);
  //stroke(20, 205, 180, 40);
  //branch(150);
  //stroke(150, 175, 10, 40);
  //branch(90);
  stroke(30, 200, 180, 40);
  branch(110);
  //translate(width/2, height);
  line(0,0,0,-300);
  //translate(0, 100);
  //stroke(30, 200, 180, 40);
  //branch(40);

}

void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.76;
  
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
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(-theta);   // Rotate by theta
    line(0, 0, 0, h);  // Draw the branch
    translate(0, h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     //

    
  }
}




