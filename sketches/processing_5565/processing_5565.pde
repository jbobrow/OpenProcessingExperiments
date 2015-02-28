
float theta = 22.0;                   // branch deformation per recursive loop
float minLength = 2.0;                // minimum branch length (connected to exit maneuvre)
int firstBranch = 250;                // length of first branch
float reduction = 0.64;               // reduce next step by amount (0.0 - 1.0)

PFont font;

void setup() {
  size(900, 800);
  smooth();
  stroke(1, 255, 40);
  strokeWeight(1);
  noLoop();
  background(0);
  font = loadFont("garamond.vlw");    // load font from data-folder
  textFont(font);                     // set current font
}

void draw() {
  theta = radians(theta);             // convert to angle input to radians
  translate(width/2, height);         // make new (0, 0) at the bottom, middle of the screen
  line(0, 0, 0, -firstBranch);        // draw first line
  translate(0, -firstBranch);         // make new (0, 0) at the end of first line
  branch(firstBranch);                // call function 'branch' (which contains recursive function (calling 'itself'))
  
  resetMatrix();
  text("angle each step: " + round(degrees(theta)) + " degrees", width-200, height-100);
  text("branch reduct. / step: " + reduction, width-200, height-80);
  text("minimum branch length: " + minLength, width-200, height-60);
  
  save("l-system.jpg");
}

void branch(float h) {
  
  h *= reduction;                     // each branch will be 2/3rds the size of previous one
    
  if (h > minLength) {                // all recursive functions must have an exit maneuvre

    // make branches to the right
    pushMatrix();                     // save the current state of tranformation (i.e. where we are now)
    rotate(theta);                    // rotate by theta
    line(0, 0, 0, -h);                // draw the branch, based on branch(*input*) from draw()
    translate(0, -h);                 // move to the end of the new branch
    branch(h);                        // call myself to draw to new branches
    popMatrix();                      // whenever we get back here, we "pop" in order to restore to previous matrix state
    
    // make branches to the left
    pushMatrix();                     // save the current state of tranformation (i.e. where we are now)
    rotate(-theta);                   // rotate by theta
    line(0, 0, 0, -h);                // draw the branch, based on branch(*input*) from draw()
    translate(0, -h);                 // move to the end of the new branch
    branch(h);                        // call myself to draw to new branches
    popMatrix();                      // whenever we get back here, we "pop" in order to restore to previous matrix state
  }
}



