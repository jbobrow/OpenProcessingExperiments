
int     depth    = 2;
int     maxDepth = 4;
float   rotation = 0;

void setup() {
  size(720, 600, P2D);
  fill(128, 0, 0);
  stroke(255, 0, 0);
}

void draw() {
  if(rotation > 360) {
    rotation = 0;
  } 
  
  background(0, 0, 0);
  fill(128, 0, 0);  

  text("Click to sub-divide", (width / 2) - 50, height / 8);
  
  // Begin drawing rotated fractal
  pushMatrix();
  
  translate(width / 2, height / 2);
  rotate(rotation);
  
  drawFractal(new PVector(0, 0), 55, 0, depth); 
  
  popMatrix();
  // End drawing rotated fractal
  
  rotation += .025;
}

void drawFractal(PVector pos, int size, int depth, int maxDepth) {
  int   newDepth = depth + 1;
  int   newSize  = size  / 2;
  float spacing  = size  * (maxDepth * .5);
  
  PVector top    = new PVector(pos.x, pos.y - spacing);
  PVector bottom = new PVector(pos.x, pos.y + spacing);
  PVector left   = new PVector(pos.x - spacing, pos.y);
  PVector right  = new PVector(pos.x + spacing, pos.y);
  
  if(depth >= maxDepth) {
    
    
    
    line(pos.x, pos.y, size, size);
  } else {
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
    fill(darkness, 0, 0);
    stroke(darkness, 0, 0);
    
    // Lines connecting the center point to its four outer points
    line(pos.x, pos.y, top.x,    top.y);
    line(pos.x, pos.y, bottom.x, bottom.y);
    line(pos.x, pos.y, left.x,   left.y);
    line(pos.x, pos.y, right.x,  right.y); 
    
    // Lines from connecting the four outer points to each other
    line(left.x,  left.y,  top.x,    top.y);
    line(left.x,  left.y,  bottom.x, bottom.y);
    line(right.x, right.y, top.x,    top.y);
    line(right.x, right.y, bottom.x, bottom.y);
  
    // Draw a dark red outline around the center 
    
    s
    stroke(64, 40, 40);
    
    // Draw the center circle
    line(pos.x, pos.y, size, size);
  }
}

void mousePressed() {
  if(depth >= maxDepth) {
    depth = 2;
  } else {
    depth++;
  }
}
