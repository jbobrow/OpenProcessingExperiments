
int     depth    = 2;
int     maxDepth = 5;
float   rotation = 0;

void setup() {
  size(720, 600, P2D);
  noFill();
  stroke(255, 0, 0);
}

void draw() {
  //Clear the screen from the last frame
  background(0);
      
  if(rotation <= 0) {
    rotation = 360;
  }
  
  pushMatrix();
      translate(width / 2, height / 2);
      rotate(rotation);
  
      drawFractal(new PVector(0, 0), 55, 0, depth); 
  popMatrix();
  
  rotation -= 0.002;
  
  // Draw white text
  stroke(255);
  text("Click to sub-divide", (width / 2) - 50, height / 8);
}

void drawFractal(PVector pos, int size, int depth, int maxDepth) {
  int   newDepth = depth + 1;
  int   newSize  = size  / 2;
  float spacing  = size  * (maxDepth * .5);
  
  PVector top    = new PVector(pos.x, pos.y - spacing);
  PVector bottom = new PVector(pos.x, pos.y + spacing);
  PVector left   = new PVector(pos.x - spacing, pos.y);
  PVector right  = new PVector(pos.x + spacing, pos.y);
  
  if(depth < maxDepth) {
    float darkness = 255 - (depth  * (255 / maxDepth));
    
    //draw the top
    drawFractal(top, newSize, newDepth, maxDepth);
    //draw the bottom
    drawFractal(bottom, newSize, newDepth, maxDepth);
    //draw the left side
    drawFractal(left, newSize, newDepth, maxDepth);
    //draw the right side
    drawFractal(right, newSize, newDepth, maxDepth);

    // Color according to the depth(foremost items are lighter, further items are darker)    
    stroke(darkness);
    
    // Draw the lines connecting the center circle to each of the outer circles
    line(pos.x, pos.y, top.x,    top.y);
    line(pos.x, pos.y, bottom.x, bottom.y);
    line(pos.x, pos.y, left.x,   left.y);
    line(pos.x, pos.y, right.x,  right.y); 
    
    // Lines from connecting the four outer points to each other
    line(left.x,  left.y,  top.x,    top.y);
    line(left.x,  left.y,  bottom.x, bottom.y);
    line(right.x, right.y, top.x,    top.y);
    line(right.x, right.y, bottom.x, bottom.y);
  }
  
  // Draw the circle with a randomly colored outline
  stroke(random(255), random(255), random(255));
    
  // Draw the center circle
  ellipse(pos.x, pos.y, size, size); 
}

void mousePressed() {
  if(depth >= maxDepth) {
    depth = 2;
  } else {
    depth++;
  }
}
