
PFont font;


void setup()
{
  int a = 800;
  size (800,800);
  noStroke();
  smooth();
  noLoop();
  background(255,127,0);
  
}

int level = 5;

void draw()
{
  int x = width;
  int y = height;
  int diam = width;
  
  drawCircle(x, y, diam, level);

  font=loadFont("SansSerif-60.vlw");

  fill (255,80);
  textAlign(CENTER, CENTER);
  text("CLICK TO INCREASE ITERATION LEVEL", width/2,height/2);

}

void drawCircle(int x, int y, int diam, int level)
{
  noStroke();
  fill(0,60);
  ellipseMode(CENTER);
  
  ellipse(x/2,y/2,diam, diam);
  ellipse(x/2,y/2,6*diam/7,6*diam/7);
  
  fill(255,127,0);
  
  ellipse(x/2,y/2,diam/6,diam/6);
  
  fill(0,80);
  
  ellipse(x/2,y/2,diam/8,diam/8);
  
  if (level>1)
  {
    level = level - 1;
    drawCircle(x-diam/2,y-diam/2,diam/2,level);
    drawCircle(x+diam/2,y-diam/2,diam/2,level);
    drawCircle(x+diam/2,y+diam/2,diam/2,level);
    drawCircle(x-diam/2,y+diam/2,diam/2,level);
  }
}

void mouseClicked()
{
  if (level>= 9)
  {
    level = 0;
  }
  level = level + 1;
  fill(255,127,0);
  rect(0,0,width, height);
  redraw();
  
}


