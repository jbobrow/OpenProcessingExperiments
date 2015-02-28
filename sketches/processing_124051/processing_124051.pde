
float theta;   
float diameter; 
float angle = 0;
float st = 0;
float st1 = 0;


void setup() {
  background(0);
  size(750,700, P2D);
  diameter = 3800;
  colorMode(HSB,255,255,255);
  noSmooth();
  
}

void draw() {
  
  
  float d1 = (sin(angle) * diameter/2) + diameter/8;
  angle += 0.0001;


  st = st+0.5 ;
  
  if(st > 255){
    st = 0 ;
  }
  
  st1 = st1+0.3;
  
  if(st1 > 255){
    st1 = 0;
  }
  
  //background(0);
  fill(0,75);
  rect(0,0,width, height);
  frameRate(30);
  stroke(255-st,255,255,152);
  // Let's pick an angle 0 to 90 degrees based on the mouse position
  float a = d1;
  // Convert it to radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(width/2,height);
  // Draw a line 120 pixels
  //line(0,0,0,-600);
  // Move to the end of that line
  translate(0,-350);
  // Start the recursive branching!
  branch(350);
  

}

void branch(float h) {
  
 float AZ = map(mouseX, 0, width, 0, 5);

  
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.70;
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 1) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    stroke(255-st,255,255,152);
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    theta = theta+AZ;
    
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    stroke(255-st1,255,255,152);
    translate(0, -h);
    branch(h);
    popMatrix();
    

    
    theta= theta-AZ;
  }
}

