
// Jugando Con Numeros
// Seminario de Matematicas
// Jan 24, 2011: Chris Sugrue.

ArrayList linesX;
ArrayList linesY;
int lineLimit= 400;

void setup()
{
  size(400,400);

  linesX = new ArrayList();
  linesY = new ArrayList();
}


void draw()
{
  background(255);


  if( mouseX != 0 && mouseY != 0)
  {
    // create two variables scaled to maximum value of 1
    float x = mouseX / float(width);
    float y = mouseY / float(width);
    linesX.add(x);
    linesY.add(y);

    if(linesX.size() > lineLimit ) linesX.remove(0);
    if(linesY.size() > lineLimit ) linesY.remove(0);
  }

  drawLines(0,0,400,400);
  
  rect(20,20,100,100);
  drawLines(20,20,100,100);
  
  rect(130,20,50,40);
  drawLines(130,20,50,50);
  
  rect(190,20,100,60);
  //drawLines(190,20,100,60); // pass x,y offset, xscale, yscale
  drawLinesMapped(190,20,290,60); // pass min x vale, min y, max x, max y
}


void drawLines( int offX, int offY, float scaleX,float scaleY )
{
  for( int i = 0; i < linesX.size()-1; i++)
  {
    float x1 =  offX + (Float)linesX.get(i)*scaleX;
    float y1 =  offY + (Float)linesY.get(i)*scaleY;
    float x2 =  offX + (Float)linesX.get(i+1)*scaleX;
    float y2 =  offY + (Float)linesY.get(i+1)*scaleY;
    line( x1,y1,x2,y2);
  }
}

void drawLinesMapped( float xMin, float yMin, float xMax, float yMax )
{
  for( int i = 0; i < linesX.size()-1; i++)
  {
    float x1 = map( (Float)linesX.get(i), 0,1,xMin,xMax);
    float y1 = map( (Float)linesY.get(i), 0,1,yMin,yMax);
    float x2 = map( (Float)linesX.get(i+1),0,1,xMin,xMax);
    float y2 = map( (Float)linesY.get(i+1),0,1,yMin,yMax);
    line( x1,y1,x2,y2);
  }
}

