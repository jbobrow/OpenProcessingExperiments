
int op = 255;
float theta;   
int quantity = 600;
float [] xPosition = new float[quantity];
float [] yPosition = new float[quantity];
int [] flakeSize = new int[quantity];
int [] direction = new int[quantity];
int minFlakeSize = 1;
int maxFlakeSize = 5;

void setup() {
  size(640, 360);
    frameRate(30);
  noStroke();
  smooth();
  rectMode(CORNERS);
  
    for(int i = 0; i < quantity; i++) {
    flakeSize[i] = round(random(minFlakeSize, maxFlakeSize));
    xPosition[i] = random( 0, width);
    yPosition[i] = random(0, height);
    direction[i] = round(random(0, 1));
  }
  
}

void draw() {
  frameRate(30);
  stroke(255);
  
  //boxes
  fill(255);
  rect(0,0,640,350);
  fill(190,229,237);
  rect(0,0,315,175);
  fill(128,195,144);
  rect(325,0,640,175);
  fill(255,198,74);
  rect(0,185,315,360);
  fill(237,230,123);
  rect(325,185,640,360);
  fill(230,230,255);
  
  //if statements for tree
  // angle 0 to 90 degrees based on the mouse position
  float a = 0.5*(mouseX / (float) width) * 90f;
  
  
  if (mouseY < 180) {
    if(mouseX < 320)  {
      a = 0.5*(mouseX / (float) width) * 20f;
    }
    else {
      a = (mouseX / (float) width) * 20f;
    }
  }
  
  if (mouseY > 180) {
    if(mouseX > 320)  {
      a = (mouseX / (float) width) * -20f;
    }
    else {
      a = 0.5*(mouseX / (float) width) * -20f;
    }
  }
  
  stroke(115,100,100);
  // convert into radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(width/2,height);
  // Draw a line 120 pixels
  line(0,0,0,-120);
  // Move to the end of that line
  translate(0,-120);
  // Start the recursive branching
  branch(120);
  stroke(255);
 
  // The for loop that houses all of the movement among the snowflakes
  translate(-width/2, -height + 120);
  if(mouseY < height/2 && mouseX < width/2)
  for(int i = 0; i < xPosition.length; i++) {
    
    // Change X based on mouse movement
    
    ellipse(xPosition[i], yPosition[i], flakeSize[i], flakeSize[i]);
    
    yPosition[i] += flakeSize[i] + direction[i]; 
    
    // If x pos is way off to the right, x pos is way off to the left, or if y pos is off the screen, then set the x position to anywhere and the y to the top.
    
    if(xPosition[i] > width + flakeSize[i] || xPosition[i] < -flakeSize[i] || yPosition[i] > height + flakeSize[i]) {
      xPosition[i] = random(0, width);
      yPosition[i] = -flakeSize[i];
    } 
  }
}


void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.66;


//2 pixels or less
  if (h > 2) {
    pushMatrix();    // save state of transformations
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // new branches
    popMatrix();     //pop to restore push
    // repeat
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }  
}


