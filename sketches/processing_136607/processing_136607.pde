
// Copyright Shannon Impellicceiri 2014
// Computer Arts with Processing T/H 11:30-1:30
// ICE #11
// 2/27/14

// declare variables
float shapeSize;
float circX;
float circY;

void setup() {
  size(800,400);
  
  // declare variables
  shapeSize = width/40;
  circX = width/2;
  circY = 0;
  
  // draw background
  // left half of window
  fill(0);
  rect(0,0,width/2,height);
  
  // right half of window
  fill(255);
  rect(width/2,0,width/2,height);
}

void draw() {
  // draw red squares
  int i=0;
  fill(255,0,0);
  
  while (i<20){
    // top side
    rect(i*shapeSize,0,shapeSize,shapeSize);
    
    // bottom side
    rect(i*shapeSize,height-shapeSize,shapeSize,shapeSize);
    
    // left side
    rect(0,i*shapeSize,shapeSize,shapeSize);
    
    // right side
    rect((width/2)-shapeSize,i*shapeSize,shapeSize,shapeSize);
    
    // increment variables
    i++;
  }
  
  // draw blue circles
  fill(0,0,255);
  for(int j = 0; j<21; j++){
    
    // left side of x
    ellipse(circX,circY,shapeSize,shapeSize);
    
    // right side of x
    ellipse(width-(circX-width/2),circY,shapeSize,shapeSize);
    
    // update position
    circX = circX + shapeSize;
    circY = circY + shapeSize;
  }
  
  noLoop();
}


