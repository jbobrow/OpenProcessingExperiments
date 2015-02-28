
// using transformations to create an articulated "arm"
// based on the Processing example 'Arm'

void setup() {
  size(400, 300);  
  stroke(255, 128);
  strokeWeight(20);
  smooth();
}

void draw() {
  background(64);
  
  // use the mouse to generate two different angles
  float angle1 = map(mouseX, 0, width, PI/4,  -PI/4);
  float angle2 = map(mouseY, 0, height, PI/2, -PI/2);
  
  pushMatrix();
    // first segment
    translate(50, height/2);
    rotate(angle1);
    line(0, 0, 100, 0);

    // second segment
    translate(100, 0);
    rotate(angle2);
    line(0, 0, 100, 0);

    // ect..
    translate(100, 0);
    rotate(angle2);
    line(0, 0, 100, 0);
    
    // notice the pattern?
    // could the 3 lines defining each segment be 
    // represented as a function?
  popMatrix();  
}
