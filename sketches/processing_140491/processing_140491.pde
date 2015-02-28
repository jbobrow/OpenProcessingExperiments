
//HW_8
//copyright 2014 Joanne Lo jylo

int objNum=10;
float [ ] xVals = new float [objNum];
float [ ] yVals = new float [objNum];
float [ ] dim = new float [objNum];
color [ ] objColor = new color [objNum];
float [ ] deltaX = new float [objNum];
float [ ] deltaY = new float [objNum];
float [ ] objDirection = new float [objNum];
float [ ] deltaDir = new float [objNum];
void setup ()
{
  size (600, 400);
  noStroke();

  fill(0);
  rect(0, 0, width, height);
  rectMode(CENTER);
  noFill( );
  for (int i = 0; i<xVals.length; i++) {
    xVals[i] = width/8;
    yVals[i] = height/8;

    objColor[i] = color(random( 200, 255 ), random(200, 255), random(200, 255));

    deltaX[i] = random( 1, 3);
    deltaY[i] = random( 1, 3 );

    dim[i] = random( 100, 300 );
    objDirection[i] = 0;
    deltaDir[i] = random( 60 );
  }
  
}
void draw()
{
  background( 0 );


  moveObj();
  drawObj();
}

void moveObj()
{
  for ( int i=0; i<xVals.length; i++ )
  {
    xVals [i] = xVals [i] + deltaX [i];
    yVals [i] = yVals [i] + deltaY [i];

    //bouncing the object
    if ( xVals [i] < 0 || xVals [i] > width - dim [i]  )
    {
      deltaX [i] = - deltaX [i];
      deltaY [i] =  deltaY [i];
      
    }
    if ( yVals [i] < 0 || yVals [i] > height - dim [i] )
    {
      deltaY [i] = - deltaY [i];
      deltaX [i] =  deltaX [i];
    }
  }
}

void drawObj()
{
  for ( int i=0; i<xVals.length; i++ )
  {

    obj(i);
  }
}

void obj(int index)
{
  float x= xVals [index];
  float y= yVals [index];
  float wd= dim [index];
  float ht= dim [index];

  stroke(objColor [index]);
  triangle( x, y, x + wd*.5, y + ht, x + wd, y );
  line( x+wd*.5, y, x+wd*.5, y+ht);
  line( x+wd*.25, y+ht*.5, x+wd*.75, y+ht*.5 );
} 

void keyPressed( )
{
  if(key == ' ')
  {
    setup();
  }
  else
  {
    exit();
  }
}


