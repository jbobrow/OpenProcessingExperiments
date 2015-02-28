
/*
L SYSTEM TREE 

s = decrease branch reduction ratio ("shrink")
w = increase branch reduction ratio ("grow")
a = decrease branch angle
d = increase branch angle

too small a minLength or too big a maxReduction causes lag
*/

float angle = 30.0;        // default tree branch angle
float reduction = 0.0;     // default length reduction for a branch

int startLength = 400;     // length of first branch/trunk
float minLength = 5.0;     // length of smallest branch/leaf
float maxAngle = 180.0;    // max branch angle user can input
float maxReduction = 0.6;  // max branch reduction user can input


void setup() {
  size(600,600);
  stroke(0,255,100);
  noLoop();  
}


void draw() {
  background(0);
  translate(width/2,height);   // set the origin (0,0) to the bottom middle
  pushMatrix();                // save origin state and push it onto the stack
  line(0,0,0,-startLength);    // draw first branch/trunk
  branch(startLength);         // call recursive function to make branches
  popMatrix();                 // recall last saved origin state and pop it off the stack
  
}


void branch(float branchLength) {
  branchLength *= reduction;       // make this branch smaller than the parent branch
  
  
  if (branchLength > minLength) {  // only grow if the branch is bigger than the minimum
                                           
                                           // left branch
    pushMatrix();                          // save origin state and push it onto the stack
    translate(0,-branchLength/3.0);        // translate origin 1/3 of the way along the branch and 
    rotate(radians(-angle));               //    rotate counterclockwise
    line(0,0,0,-branchLength);             // draw branch
    branch(branchLength);                  // repeat procedure with this branch acting as the parent 
    popMatrix();                           // recall last saved origin state and pop it off the stack
    
                                          // right branch
    pushMatrix();
    //translate(0,-2*h/3.0);
    translate(0,-branchLength/3.0);      // translate origin 1/3 of the way along the branch and 
    rotate(radians(angle));              //    rotate clockwise
    line(0,0,0,-branchLength);
    branch(branchLength);
    popMatrix();
    
                                          // middle branch
    pushMatrix();
    translate(0,-branchLength);           // translate to the end of the branch
    line(0,0,0,-branchLength);
    branch(branchLength);
    popMatrix();
  }
  
}

void keyPressed() {
  // s = decrease branch reduction ratio
  // w = increase branch reduction ratio
  // a = decrease branch angle
  // d = increase branch angle
  
  if ((key == 's' || key == 'S')&&(reduction>0)) {
    reduction = reduction - 0.01;
    print("reduction: " + reduction + "   angle: " + angle + "\n");
    redraw();
  }
  else if ((key == 'w' || key == 'W')&&(reduction<0.6)) {
    reduction = reduction + 0.01;
    print("reduction: " + reduction + "   angle: " + angle + "\n");
    redraw();
  }
  else if ((key == 'a' || key == 'A')&&(angle>0)) {
    angle = angle - 0.5;
    print("reduction: " + reduction + "   angle: " + angle + "\n");
    redraw();
  }
  else if ((key == 'd' || key == 'D')&&(angle<180)) {
    angle = angle + 0.5;
    print("reduction: " + reduction + "   angle: " + angle + "\n");
    redraw();
  }
}


