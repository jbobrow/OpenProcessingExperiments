
//class tree(...) {

float theta; 

void tree(int parameter, int xLoc, int yLoc) {
  stroke(-20, -10, -100);
  strokeWeight(90);
  float a = (parameter / (float) width) * 90;
  // Convert it to radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(xLoc,yLoc);
  // Draw a line 120 pixels
  line(0,0,0,-120);
  // Move to the end of that line
  translate(0,-120);
  // Start the recursive branching!
  branch(200);

}

void branch(float h) {
  // h is the ratio of the length of a child branch to that of it's parent
  h *= 0.77;
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    strokeWeight(h / PI);
    stroke((-h)+70, (-h)+180, (-h)+90, (h)+00);
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    strokeWeight(h/2);
    stroke((-h)+80, (-h)+190, (-h)+100, (h)+100);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}


