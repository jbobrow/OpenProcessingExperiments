
// Copyright Risa Hiyama 2014
// Computer Arts with Processing T/H 11:30-1:30
// 257/757  Spring 2014
// HW #8
// 3/4/14

final int MAX_FIGS = 15;

//declared the array  
float  [ ] xVals;
// float is a type ( declared what the data is ) 
// [] is indicating that its an array p.s. array is a object. You use array when you want to make something a lot
// name can be anything but it is xVals for now
// Not here but you can put like "Plane" as a name of the type you created
float  [ ] yVals;
float  [ ] dimVals;
  //size of the circle 
float  [ ] deltaDimVals;
  //dirction 
color  [ ] colorVals;

void setup(){
  size(600,400);
  //size(displayWidth ,displayHeight-50);
  noStroke();
  rectMode( CENTER );
  frameRate( 24 );
  smooth( );
  
  //initiallizing the array, not declaring. It is actually giving a number 
  // this box is still empty spaces
  xVals = new float[ MAX_FIGS ];
  // then fly to funtion initFloatArray();
  initFloatArray( xVals, 50, width-50 );
   
  yVals  = new float[ MAX_FIGS ];
  initFloatArray( yVals, 50, height-50 );
   
  dimVals      = new float[ MAX_FIGS ];
  initFloatArray( dimVals, 1, 3 );
   
  deltaDimVals = new float[ MAX_FIGS ];
  initFloatArray( deltaDimVals, 5, 50 );
   
  colorVals    = new color[ MAX_FIGS ];
  initColorArray( colorVals );
}

void initFloatArray ( float [ ] anyFloatArray, int minVal, int maxVal)
{
  for (int i = 0; i < anyFloatArray.length; i++)
  {
    anyFloatArray[i] = int(random(minVal,maxVal));
    //this is where its putting the numbers 
  }
}

void initColorArray( color [ ] anyColorArray)
{
  for (color i = 0; i < anyColorArray.length; i++)
  {
    anyColorArray[i] = color(random(255));
  }
}

void draw(){
  background( 176, 226, 255 );
  moveFigures( );
  drawFigures( );  
}

void moveFigures()
{
  for( int i = 0; i < dimVals.length; i++)
 {
   xVals[i] += dimVals[i];
   if(xVals[i]+dimVals[i] > width || xVals[i] <0 )
   {
     dimVals[i] =- dimVals[i]; 
   }
   yVals[i] += deltaDimVals[i]/4;
   if(yVals[i]+deltaDimVals[i] > height || yVals[i] <0 )
   {
     deltaDimVals[i] =- deltaDimVals[i]; 
   } 
 }
}

void drawFigures( )
{
  for( int i = 0; i < xVals.length; i++)
  //this is going through your array and doing something to all of them 
  //i <= xVals.length-1 this is to pass it on because it starta at 0
  
  { 
    fill( colorVals[i] );
    //ellipse( xVals[i], yVals[i], dimVals[i], dimVals[i] );
    triangle(xVals[i]+4*dimVals[i], yVals[i], xVals[i]-3*dimVals[i], yVals[i]+15*dimVals[i], xVals[i]-3*dimVals[i], yVals[i]-15*dimVals[i]);
    triangle(xVals[i]-10*dimVals[i], yVals[i], xVals[i]-18*dimVals[i], yVals[i]+5*dimVals[i], xVals[i]-18*dimVals[i], yVals[i]-5*dimVals[i]);
    ellipse(xVals[i],yVals[i],30*dimVals[i],10*dimVals[i]);

  }
}


void keyPressed()
{
  if (key == ' ')
  {
    setup();
  }
  else
  {
    exit();
  }
}


