
PShape tree;

float x, y, w, h;

void setup()
{
  size(840, 360);
  tree = loadShape("tree.svg");
  
  x = random(width, 0);
  y = random(height/4, height);
  w = random(width);
  h = random(height);
}

void draw()
{
  background(255);
  fill(210);
  
  x -= 1;
  if( x < -w )
  
  x = width + w;
  shape(tree, x, y, 100, 100);
  shape(tree, -x, y, 250, 250);
  
}



