
//Charlotte Stiles cc 2014
//cstiles
//HW#8

int numLines = 10;
int maxDiam = 20;
int minDiam = 5;
float [] xVals;
float [] yVals;
float [] lineSpeed;
float [] diam;
float [] deltaX = new float [ numLines ];   
float [] deltaY = new float [ numLines ];

color [] colorVals;

void setup(){
size(600,400);
smooth();
noStroke();
frameRate(24);

xVals = new float[numLines];
 initFloatArray (xVals, maxDiam, width-maxDiam);
 
yVals = new float[numLines];
initFloatArray (yVals, maxDiam ,height- maxDiam);

lineSpeed = new float [numLines];
initFloatArray (lineSpeed, 1, 3);

diam = new float [numLines];
initFloatArray (diam, minDiam, maxDiam);

colorVals    = new color[ numLines ];
initColorArray( colorVals );


}
void initFloatArray (float[]anyFloatArray, int minVal, int maxVals)
{
  for (int i =0; i <anyFloatArray.length; i++)
  {
   anyFloatArray[i]=int(random(minVal,maxVals));
       deltaX [ i ] = random( 1, 3 );
    deltaY [ i ] = random( 1, 3 );
  }
 
}


void initColorArray (color[]anyColorArray)
{
for(int i=0; i < anyColorArray.length; i++ )
{
   anyColorArray [i] =  color(random(100,255), random(100,255), random(100,255));
  }
}

void draw(){
fill(0,50);
rect(0,0,width,height);

moveLines();
drawLines();

}

void moveLines()
{
  for ( int i = 0; i<xVals.length; i++ )
  {
    xVals [ i ] = xVals [ i ] - deltaX [ i ];
    yVals [ i ] = yVals [ i ] - deltaY [ i ];

    if ( xVals [ i ] < 0 )
    {
      deltaX [ i ] = -deltaX [ i ];
      deltaY [ i ] = deltaY [ i ];
    }
 
    if ( xVals [ i ] > width)
    {
      deltaX [ i ] = -deltaX [ i ];
      deltaY [ i ] = deltaY [ i ];
    }
 
    if ( yVals [ i ] < 0 )
    {
      deltaX [ i ] = deltaX [ i ];
      deltaY [ i ] = -deltaY [ i ];
    }
 
    if ( yVals [ i ] > height )
    {
      deltaX [ i ] = deltaX [ i ];
      deltaY [ i ] = -deltaY [ i ];
    }
  }
}


void drawLines(){

for( int i = 0; i < yVals.length; i++) {
      fill(colorVals[i]);
    //declare local variables
    float x = xVals [ i ];
    float y = yVals [ i ];
    float wd = diam [ i ];
    float ht = diam [ i ];
ellipse(x,y,wd,ht);
curve (0.0, width+.1, x, y, x+random(width-i), y+(height-i), width/2, height/2);
//beginShape();
//curveVertex(0,  height);
//curveVertex(x,  y);
//curveVertex(x+i*.5,  y);
//curveVertex(x+i,  y+i);
//curveVertex(x+i, y);
//curveVertex(width, height);
//endShape();

}
}


void keyPressed()
{
  if(key == ' '){setup();} else {exit();}
}
