
//Homework 8
//Copyright Miranda Jacoby 2014 All Rights Reserved
//"Pidgey" is a Pokemon and property of GameFreak
//Program may take a second or so to start due to loading .png files

//arrays: xVal, yVal, dimVal, deltaVal, colorVal
//Look at cc11 Demo 3

final int MAX_FIGS = 50;

float  [ ] xVals;
float  [ ] yVals;
float  [ ] deltaxVals;
float  [ ] deltayVals;
float  [ ] dimVals;

color  [ ] colorVals;

//figure out how to implement a .gif, or array of two images that loop to create an animated object
//Image array will be called PIC
//tint will determine the color of the animated object
color  [ ] tintRed;
color  [ ] tintBlue;
color  [ ] tintGreen;

PImage pidgey;
PImage [ ] picArray;
int frame;
int xspeed;
int yspeed;

void setup()
{
  //Open Processing
  size(600,400);
  //handin
  //size(displayWidth, displayHeight-50);
  //frameRate( 24 );
  smooth();
  imageMode(CENTER);

//SET MIN AND MAX VALUES ACCORDINGY
xVals        = new float[ MAX_FIGS ];
initFloatArray( xVals, width/3, width - width/3 );//( xVals, 50, width - 50 );
 
yVals        = new float[ MAX_FIGS ];
initFloatArray( yVals, height/3, height - height/3 );//( yVals, 50, height - 50 );

deltaxVals   = new float[ MAX_FIGS ];
initFloatArray( deltaxVals, -5, 5 );
 
deltayVals   = new float[ MAX_FIGS ];
initFloatArray( deltayVals, -5, 5 );
  
dimVals      = new float[ MAX_FIGS ];
initFloatArray( dimVals, 30, 50);///FIX
  
colorVals    = new color[ MAX_FIGS ];
initColorArray( colorVals ); 


tintRed    = new int[ MAX_FIGS ];
initIntArray( tintRed, 0, 255 ); 

tintBlue    = new int[ MAX_FIGS ];
initIntArray( tintBlue, 0, 255 ); 

tintGreen   = new int[ MAX_FIGS ];
initIntArray( tintGreen, 0, 255 ); 

picArray    = new PImage[ 2 ];
initImageArray( picArray );

}


//Initilize float arrays
void initFloatArray( float [] anyArray, int minVal, int maxVal )
{
    for ( int i = 0; i < anyArray.length; i++)
  {
     anyArray[ i ] =  random(minVal, maxVal);
  }
}

//Initilize int arrays
void initIntArray( int [] intArray, int minVal, int maxVal )
{
    for ( int i = 0; i < intArray.length; i++)
  {
     intArray[ i ] =  int(random(minVal, maxVal));
  }
}

//Initialize color array
void initColorArray( color [] col )
{
    for( int i = 0; i < col.length; i++ )
 {
     col[ i ] = color( int( random(255 ) ),
                       int( random(255 ) ),
                       int( random(255 ) ) );
 } 
}

//Initialize image array
void  initImageArray( PImage [ ] picArray )
{
  for(int i = 0; i < picArray.length; i++)
  {
    String imageName = "pidgey" + i + ".png" ;
    picArray[i] = loadImage( imageName );
  }
}

void draw()
{
  background(0);
  //drawFigure(); //draws circles
  drawPidgey(); //draws pidgey
  moveFigure(); //moves figures (pidgey included) but does not retain velocity
  animatePidgey(); //animates pidgey
  //newMoveFigure(); //moves pidgey but does not retain velocity
  //retainSpeedMoveFigure(); //NOT FUNCTIONAL, spposed to move pidgey while maintaining velocity
  //collide();
  
}

void drawPidgey()
{
  for( int i = 0; i < xVals.length; i++)
  {
      tint( tintRed[i], tintBlue[i], tintGreen[i] );
      
      if(random(10) < 4)
      {
        image( picArray[0], xVals[i], yVals[i], dimVals[i], (dimVals[i] * (37/35)) );    
      }
      
      else
      {
        image( picArray[1], xVals[i], yVals[i], dimVals[i], (dimVals[i] * (37/35)) ); 
      }
      
      
      xVals [i] += deltaxVals [i];
      yVals [i] += deltayVals [i];
  }
}

void animatePidgey()
{
  //for( int i = 0; i < picArray.length; i++ )
  
  if( frameCount%24 == 0 )
  {
    frame++;
    if (frame >= picArray.length)
    {
       frame = 0; 
    }
  }
// {
//   for ( i = 1; i = picArray.length; i = 0 )
//   {
//   }
// } 
}

//Leftover from early stages of program, draws circles. 
void drawFigure()
{
  for( int i = 0; i < xVals.length; i++)
  {
    //flip();
    fill( colorVals[i] );
    ellipse( xVals[i], yVals[i], dimVals[i], dimVals[i] );
    
    xVals [i] += deltaxVals [i];
    yVals [i] += deltayVals [i];
    
    //height for pidgey is dimVals [i], dimVals [i] * (37/35)
    
    //tinting for animated figure
    //tint(tintRed [i], tintBlue [i], tintGreen [i]);
    
   //image(PIC [i], xVals [i], yVals [i], 37, 35); //37 and 35 are the width and height of the image. 
   //Is there a way to get the values of the image's width and height without using magic numbers? 
  }
}

//void flip()
//{
//    if (deltaxVals [i] <= -1);
//     {
//      scale( -1, 1);
 //    }
// 
//    if (deltaxVals [i] >= 1);
//     {
 //     scale( 1, 1);
//     }
//   
//    if (deltayVals [i] <= -1);
//     {
//      scale( -1, 1);
//     }
// 
//    if (deltayVals [i] >= 1);
//    {
//     scale( 1, 1);
//    }
//}

//Not Used
void newMoveFigure()
{
    
    for( int i = 0; i < xVals.length; i++)
  {
  
  if (xVals [i] + dimVals [i] <= 0)
    {
      deltaxVals [i] = deltaxVals [i] * 1;
    }
  if (yVals [i] + (dimVals [i] * (37/35)) <= 0)
    {
      deltayVals [i] = deltayVals [i] * 1;
    }
  if (xVals [i] + dimVals [i] >= width)
    {
      deltaxVals [i] = deltaxVals [i] * -1;
    }
  if (yVals [i] + (dimVals [i] * (37/35)) >= height)
    {
      deltayVals [i] = deltayVals [i] * -1; 
    }
  }
}

//NOT FUNCTIONAL, spposed to move pidgey while maintaining velocity
//void retainSpeedMoveFigure()
//{   
//    for( int i = 0; i < deltaxVals.length; i++)
//  {
//    
//    deltaxVals [i] = deltaxVals [i] * xspeed;
//    deltayVals [i] = deltayVals [i] * yspeed;
//    
//  if (xVals [i] + dimVals [i] <= 0)
//    {
//      xspeed = 1;
//    }
//  if (yVals [i] + (dimVals [i] * (37/35)) <= 0)
//    {
//      yspeed = 1;
//    }
//  if (xVals [i] + dimVals [i] >= width)
//    {
//      xspeed = -1;
//    }
//  if (yVals [i] + (dimVals [i] * (37/35)) >= height)
//    {
//      yspeed = -1;
//    }
//  }
//}

void moveFigure()
{
    for( int i = 0; i < xVals.length; i++)
  {
  
  if (xVals [i] - dimVals [i] <= 0)
    {
      deltaxVals [i] = 1;
    }
  if (yVals [i] - dimVals [i] <= 0)
    {
      deltayVals [i] = 1;
    }
  if (xVals [i] + dimVals [i] >= width)
    {
      deltaxVals [i] = -1;
    }
  if (yVals [i] + dimVals [i] >= height)
    {
      deltayVals [i] = -1;
    }
  }
}


//void collide()
//{
  
//}

void keyPressed()
{
    if (key == ' ')
    {
      int i = 0;

      //Re-initialize ALL OF THE THINGS! 
      initFloatArray( xVals, width/3, width - width/3 );
       
      initFloatArray( yVals, height/3, height - height/3 );
      
      initFloatArray( deltaxVals, -5, 5 );
       
      initFloatArray( deltayVals, -5, 5 );
        
      initFloatArray( dimVals, 30, 50);
        
      initColorArray( colorVals ); 
      
      initIntArray( tintRed, 0, 255 ); 
      
      initIntArray( tintBlue, 0, 255 ); 
      
      initIntArray( tintGreen, 0, 255 ); 
      
      initImageArray( picArray );

    }
    else
    {
      exit();
    }
}



