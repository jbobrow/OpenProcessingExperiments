
int     depth    = 2;
int     maxDepth = 7;
boolean changed  = true;

void setup() {
  size(720, 600, P2D);
  fill(128);
  stroke(255);
}

void draw() {
  if(changed) {
    background(0, 0, 0);
    fill(128);
    drawFractal(new PVector(360, 300), 55, 0, depth);
    
    changed = false;
  }
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
    ellipse(pos.x, pos.y, size, size);
  } else {
    float darkness = 255 - (depth  * (255 / maxDepth));
    
    //above
    drawFractal(top, newSize, newDepth, maxDepth);
    //below
    drawFractal(bottom, newSize, newDepth, maxDepth);
    //left
    drawFractal(left, newSize, newDepth, maxDepth);
    //right
    drawFractal(right, newSize, newDepth, maxDepth);

    // Color according to the depth(foremost items are lighter, further items are darker)    
    fill(darkness);
    stroke(darkness);
    
    // Lines from the center point to its four outer points
    line(pos.x, pos.y, top.x,    top.y);
    line(pos.x, pos.y, bottom.x, bottom.y);
    line(pos.x, pos.y, left.x,   left.y);
    line(pos.x, pos.y, right.x,  right.y); 
    
    // Lines from connecting the four outer points
    line(left.x,  left.y,  top.x,    top.y);
    line(left.x,  left.y,  bottom.x, bottom.y);
    line(right.x, right.y, top.x,    top.y);
    line(right.x, right.y, bottom.x, bottom.y);
  
    // Draw a white outline around the center circles
    stroke(255);
    
    //self
    ellipse(pos.x, pos.y, size, size);
  }
}

void mousePressed() {
  changed = true;
  if(depth >= maxDepth) {
    depth = 2;
  } else {
    depth++;
  }
}
