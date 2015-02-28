

void setup()
{
  frameRate = 30;
  size(600,600);
  colorMode(HSB);
  background(0);
}

void draw()
{
  
  crazyShape(100,100);
  crazyShape(100,300);
  crazyShape(100,500);
  
  crazyShape(300,100);
  crazyShape(300,300);
  crazyShape(300,500);
  
  crazyShape(500,100);
  crazyShape(500,300);
  crazyShape(500,500);
}

public void crazyShape(float x, float y)
{
  float w = random(0,200);
  float h = random(0,200);
  pushMatrix();
  translate(x,y);
  rotate(random(0,TWO_PI));
  fill(random(0,255),random(50,255),random(100,255));
  rect(-w/2,-h/2,w,h);
  popMatrix();
}

