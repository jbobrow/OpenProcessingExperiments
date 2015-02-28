
int sw = 960;

// grid with
int gwFrac = 10;
int gwSubFrac = 6;
int gwBack = 255;
int gwFore = 0;
int gwSubFore = 230;

// scene part
int spWidth = gw/2;
int spHeight = gw/5;

void setup() {
  size(spWidth, spHeight);
}

void draw() {
  // drawGrid();

  // textFont(createFont("",10));

  PFont fontA = loadFont("courier");
  textFont(fontA, 14);  
  text("hello world", 100, 100);
}

void drawGrid()
{
  int xMax = spWidth;
  int yMax = spHeight;
  int step = sw/gwFrac;
  int subStep = step/gwSubFrac;

  // background(255);
  rect(0,0,xMax,yMax);

  noFill();
  for(int v=0; v<xMax; v+=subStep)
  {
    color fore = v%step==0? gwFore: gwSubFore;
    stroke(fore);
    line(v,0,v,yMax);
  }

  for(int v=0; v<yMax; v+=subStep)
  {
    color fore = v%step==0? gwFore: gwSubFore;
    stroke(fore);
    line(0,v,xMax,v);
  }
}

int toScreen(v,vSub)
{
  return v*gwFrac + vSub*gwSubFrac;
}
