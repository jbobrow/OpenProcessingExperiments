
float theta;   

void setup() {
  size(800,800);
  smooth();
}

void draw() {
  background(255);
  stroke(mouseX, 255, 200);
  // Let's pick an angle 0 to 90 degrees based on the mouse position
  float a = (mouseY / (float) width) * 360;
  // Convert it to radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(width/2,height/2);
  // Draw a line 60 pixels
  rect(-16.5,0,33,-100);
  // Move to the end of that line
  translate(0,-100);
  branch(100);
 translate(0,100);
 stroke(mouseX, 255, 200);
 rect(-16,0,33,100);
 translate(0,100);
 branch2(100);
 translate(100,-100);
 stroke(mouseX, 255, 200);
 rect(0,-16.5,-100,33);
 branch3(100);
 translate(-100,0);
 stroke(mouseX, 255, 200);
 rect(0,-16.5,-100,33);
 translate(-100,0);
 branch4(100);
}

void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= .75;
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 5) {
 //   stroke(100,mouseX,mouseY);
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    stroke(mouseX/4, h*3, h*2);
    rotate(theta);   // Rotate by theta
    rect(0,0,-h/3,-h);  // Draw the branch
    translate(0,-h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    stroke(mouseX/4, h*3, h*2);
    rotate(-theta);
    rect(0,0,-h/3,-h);
    translate(0,-h);
    branch(h);
    popMatrix();
  }
}

void branch2(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= .75;
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 5) {
 //   stroke(100,mouseX,mouseY);
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    stroke(mouseX/4, h*3, h*2);
    rotate(theta);   // Rotate by theta
    rect(0,0,h/3,h);  // Draw the branch
    translate(0,h); // Move to the end of the branch
    branch2(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    stroke(mouseX/4, h*3, h*2);
    rotate(-theta);
    rect(0,0,h/3,h);
    translate(0,h);
    branch2(h);
    popMatrix();
  }
}

void branch3(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= .75;
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 5) {
 //   stroke(100,mouseX,mouseY);
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    stroke(mouseX/4, h*3, h*2);
    rotate(theta);   // Rotate by theta
    rect(0,0,h,h/3);  // Draw the branch
    translate(h,0); // Move to the end of the branch
    branch3(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    stroke(mouseX/4, h*3, h*2);
    rotate(-theta);
    rect(0,0,h,h/3);
    translate(h,0);
    branch3(h);
    popMatrix();
  }
}

void branch4(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= .75;
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 5) {
 //   stroke(100,mouseX,mouseY);
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    stroke(mouseX/4, h*3, h*2);
    rotate(theta);   // Rotate by theta
    rect(0,0,-h,-h/3);  // Draw the branch
    translate(-h,0); // Move to the end of the branch
    branch4(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    stroke(mouseX/4, h*3, h*2);
    rotate(-theta);
    rect(0,0,-h,-h/3);
    translate(-h,0);
    branch4(h);
    popMatrix();
  }
}
