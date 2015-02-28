
// Copyright 2014 Jacklynn Pham
// HW 10

//press any key to exit

final int MAX = 50;

int [] xDelta = new int [MAX];
int [] yDelta = new int [MAX];

int [] xVals = new int [MAX];
int [] yVals = new int [MAX];
int [] zVals = new int [MAX];

color [] colorVals = new color [MAX];

String [] txt;
float delta, x, y, z;
float transZ;

int index = 0;

void setup()
{
  textAlign(CENTER);
  size(900, 900, P3D);
  txt = loadStrings("text.txt");
  x = width/2;
  y = height/2;
  z = 0;

  for (int i = 0; i < MAX; i++) {
    xDelta[i] = int( random(-5, 5) ); 
    yDelta[i] = int( random(-5, 5) );
    xVals[i] = int(random( 0, width-100 ) );
    yVals[i] = int(random( 0, height-100));
//    xVals[i] = int(random( x-50, x+50 ) );
//    yVals[i] = int(random(y-50, y+50));
    zVals[i] = int (random( -50, 0));
  }

  transZ= 0;
  delta = 3;
  
   initColorArray( colorVals );
  
}


void draw()
{
  moveText();
  writeText();
}

void initColorArray (color [] colorVals)
{
  for (int i = 0; i < colorVals.length; i++)
    colorVals [i] = color( random( 255 ), random( 255 ), random( 255 ) );
}

void moveText()
{
  background(0);
  
  for (int i = 0; i < MAX; i++)
  {
    //println(txt);
    zVals[i] += delta;
    xVals[i] +=  xDelta[i];
    yVals[i] += yDelta[i];
//    x = x + xDelta[i];
//    y = y + yDelta[i];
    
    if (zVals[i] > width) {
      zVals[i] = 0 ;
      xVals[i] = width/2;
      yVals[i] = height/2 ;
    }
    
  }
}

void writeText()
{
  

  for (int i = 0; i < MAX; i++)
  {
fill(colorVals[i]);
//  println(txt);
   
   String joinedtxt = join(txt, " ");  
  
    textSize(16);
     text("["+joinedtxt+ "]", xVals[i], yVals[i], zVals[i]);

  }
}

void keyPressed(){
  if(keyPressed == true){
    exit();
  }
}




