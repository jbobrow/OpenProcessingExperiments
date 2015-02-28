
// SIMONE ROTH - PS3_3 REMIX //
// ORIGINAL TAKEN FROM: http://processing.org/learning/topics/tree.html //

float theta;   

void setup() {
  size(640, 360);
  smooth();
}

void draw() {
  background(0);
  // changed frameRate from 30 --> 15. 
  frameRate(15);
  // changed stroke from white to random colors 
  stroke(random(233), random(232), random (54));
 
  // Changed angle at which tree turns into puzzle pieces from 90 to 80.
  
  // Changes mouse position from X movement to Y movement. Now, 
  // we have to move our mouse up/down. 
  
  float a = (mouseY / (float) width) * 80f;

  theta = radians(a);

  translate(width/2,height);

  line(0,0,0,-120);

  translate(0,-120);

  branch(120);
}

void branch(float h) {
  // Each branch will 50% less. Changed this from .66 to .50
  h *= 0.50;
  

  if (h > 2) {
    pushMatrix();    
    rotate(theta);  
    line(0, 0, 0, -h);  
    translate(0, -h); 
    branch(h);      
    popMatrix();     
    

    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}


