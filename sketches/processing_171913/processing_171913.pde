
int size = 400;
int border = 50;
float h = sqrt(size*size - (size/2)*(size/2));
int depth = 3;
 
void setup()
{ 
  size(size,(int)h);
  smooth();
  noLoop();
   
  fill(0);
  noStroke();
  background(255);
}
 
void draw()
{ 
  background(255);
  drawTris(0, depth, new PVector(border, h-border), new PVector(width/2, border), new PVector(width-border, h-border));
}
 
void drawTris(int level, int maxLevels, PVector left, PVector top, PVector right)
{
   
  level++;
   
  if(level >= maxLevels) {
    triangle(left.x, left.y, top.x, top.y, right.x, right.y);
  }
  else {
    PVector a = PVector.add(left, PVector.div(PVector.sub(top, left), 2));
    PVector b = PVector.add(right, PVector.div(PVector.sub(top, right), 2));
    PVector c = PVector.add(left, PVector.div(PVector.sub(right, left), 2));
     
    drawTris(level, maxLevels, a, top, b);
    drawTris(level, maxLevels, left, a, c);
    drawTris(level, maxLevels, c, b, right);
  }
   
}
 
void mousePressed()
{
  switch(mouseButton) {
   
    case LEFT: depth++; break;
    case RIGHT: depth = max(depth-1, 0); break;   
     
  }
   
  redraw();
}

