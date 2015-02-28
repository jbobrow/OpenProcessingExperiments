
/**
 I did some change based on "Recursive Tree" by Daniel Shiffman.  
*/
 
float theta;   

void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  background(255);
  frameRate(30);
  stroke(mouseX,mouseY,random(1,255));
  // Let's pick an angle 0 to 90 degrees based on the mouse position
  float a = (mouseX / (float) width) * 130f;
  // Convert it to radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(width/6,height/6);
  // Draw a line 120 pixels
  line(0,0,0,-10);
  // Move to the end of that line
  translate(0,-10);
  // Start the recursive branching!
  branch(500);

}

void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.69;
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 5) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta + 2);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
    
    /*
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    //rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
    */
  }
}

