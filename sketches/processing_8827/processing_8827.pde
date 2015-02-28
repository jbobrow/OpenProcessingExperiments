
// Original scirpt and Spring-Physics 
// By Asher Salomon 2010
// AsherSalomon@gmail.com
// see openprocessing.com

// The script was then modified by Bejoscha to compute pseudo-collisions and some minor changes.

int num = 1000;          // Biggest number of Points per Spring

int whichOnes;
ArrayList sprs;
Spring S;
PGraphics buffer;
int count=0;
boolean showBuffer=false;
boolean collide=true;
boolean drawFill=true;
boolean pause=false;
boolean useGravity=true;
int VertexDraw=0;
int LineDraw=1;

void setup() {
  size(400, 300,JAVA2D);
  sprs = new ArrayList();
  smooth();
  buffer = createGraphics(width,height,JAVA2D);
  buffer.smooth();
  buffer.background(0);
}

void draw() 
{
  background(230);
  if (!pause)
    {
    if (sprs.size()>0){
      if (drawing) whichOnes=sprs.size()-1;
      else         whichOnes=sprs.size();
       for (int j=0; j<whichOnes; j++)
        {
          S = ( Spring ) sprs.get(j);
          if (collide)  S.drawBuffer(VertexDraw,LineDraw,drawFill,true);
          S.Tick();
          if (collide)  S.drawBuffer(VertexDraw,LineDraw,drawFill,false);
        }
      }
    }
  buffer.beginDraw();
  buffer.background(0);
  if (sprs.size()>0){
    for (int j=0; j<sprs.size(); j++){
       S = ( Spring ) sprs.get(j);
       S.draw(VertexDraw,LineDraw,drawFill);
    }
    if (collide)   for (int j=0; j<sprs.size(); j++)
                  {
                     S = ( Spring ) sprs.get(j);
                     S.drawBuffer(VertexDraw,LineDraw,drawFill,false);
                  }
  }
  buffer.endDraw();
  if (showBuffer) set(0,0,buffer);
}

boolean drawing = false;
void mousePressed() {
  if (drawing == false){
    if (mouseButton == LEFT){
        S = new Spring();
        if (!useGravity) S.gravity=0;
        sprs.add( S );
        S.firstPoint(new PVector(mouseX,mouseY));
        drawing = true;
      }
    }
    if (mouseButton == RIGHT){
      if (sprs.size()>0){
        for (int j=0; j<sprs.size(); j++){
          S = ( Spring ) sprs.get(j);
          S.testGrab();
        }
      }
    }
}
void mouseDragged() {
  if (drawing) 
  {
    S = ( Spring ) sprs.get(sprs.size()-1);
    S.addPoint(new PVector(mouseX,mouseY));
  }
}

boolean cleared = true;
void mouseReleased() {
  if (mouseButton == LEFT){
    if (drawing) {
      S = ( Spring ) sprs.get(sprs.size()-1);
      S.lastPoint(new PVector(mouseX,mouseY),false);
      S.CloseGap(10);
      drawing = false;
    }
  }
  if (mouseButton == RIGHT){
    if (sprs.size()>0){
      for (int j=0; j<sprs.size(); j++){
      S = ( Spring ) sprs.get(j);
      S.hold = false;
      }
    }
  }
}

void keyReleased(){
  switch (key)
  {
    case ' ':
    sprs = new ArrayList();
    break;
    case 'c':
    collide=!collide;
    break;
    case 'b':
    showBuffer=!showBuffer;
    break;
    case 'p':
    pause=!pause;
    break;
    case 'g':
      useGravity=!useGravity;
      for (int j=0; j<sprs.size(); j++)
      {
      S = ( Spring ) sprs.get(j);
      if (useGravity) S.gravity = 0.00001;
      else S.gravity=0;
      }
    break;
    case 's':
          for (int j=0; j<sprs.size(); j++)
      {
      S = ( Spring ) sprs.get(j);
      if (!S.closed) S.straighten=true;
      }
    break;
    case '+':
    VertexDraw++;
    break;
    case '-':
    VertexDraw = max(0,VertexDraw-1);
    break;
  }
}

