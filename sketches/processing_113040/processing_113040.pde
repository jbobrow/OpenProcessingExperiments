
import processing.opengl.*;
//Yingri Guan
//HW6

int transXDelta, transYDelta, transZDelta;
int transX, transY, transZ;
int rotX, rotY, rotZ;

PFont f;
PImage p, p1, p2;

int depth;
int edge;

void setup( )
{
  size( 600, 600, OPENGL  );
  frameRate( 30 );
  f = loadFont( "f.vlw" );
  textFont( f );
  
  background( 255, 95, 199); 
  depth = 0;
  edge = (int)(.08*width);     
}

void draw( )
{
   background( 255, 95, 199);
   directionalLight(255, 255, 255, 1, 0, -1);
   directionalLight(255, 255, 255, 0, 0, -1);
   directionalLight(255, 255, 255, 0, -1, 0);
   
   showStatus( );
   
   translate( width/2, height/2, 0 );  
   
   translate( transX, transY, transZ);

   rotateX( radians(rotX) );
   rotateY( radians(rotY) );
   rotateZ( radians(rotZ) );
   
   drawAxis ( );
   //translate( 200, 200, 0 );  
   drawInitial( );
}

void drawAxis( )
{
      fill( 255 );
      box( 400, 2, 2 );
      box( 2, 400, 2 );
      box( 2, 2, 400 );
      sphere( 20 );
}


void showStatus( )
{

   textAlign( LEFT );
   textFont( f, 14 );
   fill( 255);
   text("Distance:",                     5, height*.1 +20 );
   text("  L/R:    " + int(transX),      5, height*.1 +40 );
   text("  U/D:    " + int(transY),      5, height*.1 +60 );
   text("  I/O:    " + int(transZ),      5, height*.1 +80 ); 
   text("Trans Rates: ",                 5, height*.1 +100);
   text( "   X:    " + (transXDelta), 5, height*.1 +120);
   text( "   Y:    " + (transYDelta), 5, height*.1 +140);
   text( "   Z:    " + (transZDelta), 5, height*.1 +160);
   text("Rotation:",                     5, height*.1 +200 );
   text("    X:    " + int(rotX%360),        5, height*.1 +220 );
   text("    Y:    " + int(rotY%360),        5, height*.1 +240 );
   text("    Z:    " + int(rotZ%360),        5, height*.1 +260 );     
}

void keyPressed( )
{
      if (key == 'x')
      {
         rotX--;
      }
      else if (key == 'X')
      {
         rotX++;
      }
      else if (key == 'y')
      {
         rotY--;
      }
      else if (key == 'Y')
      {
         rotY++;
      }
      else if (key == 'z')
      {
         rotZ--;
      }
      else if (key == 'Z')
      {
         rotZ++;
      }
  
   else if ( key == ' ' )
   {
      transX = transY = transZ = 0;
      rotX = rotY = rotZ = 0;
      transXDelta = transYDelta = transZDelta = 0;
   } 
   else if ( key == 'S' || key == 's' )
   {
        transXDelta = transYDelta = transZDelta = 0;
   } 
}

void mouseDragged( )
{
  if (mouseButton == LEFT )
  {
     if (pmouseX < mouseX )
     {
        transX+=2;
     }
     if (pmouseX > mouseX) {
       transX-=2;
     }
     if (pmouseY > mouseY) {
      transY-=2;
     }
     if (pmouseY < mouseY){
      transY+=2;
     }
  }
  if (mouseButton == RIGHT){
    if (pmouseY > mouseY){
     transZ-=2;
    }
    if (pmouseY < mouseY){
     transZ+=2;
    }
  }
}

void drawInitial(  )
{
     fill( 196,255,5 );
     noStroke();
    
    // front row of Y
    pushMatrix( );
      translate( width*-.2, height*-.3, depth + edge + 5);
      fill( 196,255,5 );
      box( edge);
    popMatrix( );
    
    pushMatrix( );
      translate( width*-.15, height*-.2, depth + edge + 5);
      fill( 196,255,5 );
      box( edge);
    popMatrix( );
    
    pushMatrix( );
      translate( width*-.1, height*-.1, depth + edge + 5);
      fill( 196,255,5 );
      box( edge);
    popMatrix( );

   pushMatrix( );
      translate( width*.1, height*-.1, depth + edge + 5);
      fill( 196,255,5 );
      box( edge);
    popMatrix( );

   pushMatrix( );
      translate( width*.15, height*-.2, depth + edge + 5);
      fill( 196,255,5 );
      box( edge);
    popMatrix( );
    
    pushMatrix( );
      translate( width*.2, height*-.3, depth + edge + 5);
      fill( 196,255,5 );
      box( edge);
    popMatrix( );
    
    //back row of Y
      pushMatrix( );
      translate( width*-.2, height*-.3, depth - edge - 5);
      fill( 196,255,5 );
      box( edge);
    popMatrix( );
    
    pushMatrix( );
      translate( width*-.15, height*-.2, depth - edge - 5);
      fill( 196,255,5 );
      box( edge);
    popMatrix( );
    
    pushMatrix( );
      translate( width*-.1, height*-.1, depth - edge - 5);
      fill( 196,255,5 );
      box( edge);
    popMatrix( );

   pushMatrix( );
      translate( width*.1, height*-.1, depth - edge - 5);
      fill( 196,255,5 );
      box( edge);
    popMatrix( );

   pushMatrix( );
      translate( width*.15, height*-.2, depth - edge - 5);
      fill( 196,255,5 );
      box( edge);
    popMatrix( );
    
    pushMatrix( );
      translate( width*.2, height*-.3, depth - edge - 5);
      fill( 196,255,5 );
      box( edge);
    popMatrix( );
    
    
    // middle vertical of Y
    pushMatrix( );
      translate( 0, height*-.1, depth);
      fill( 196,255,5 );
      box( edge);
    popMatrix( );
    
    pushMatrix( );
      translate( 0, 0, depth );
      fill( 196,255,5 );
      box( edge);
    popMatrix( );
    
    pushMatrix( );
      translate( 0, height*.1, depth );
      fill( 196,255,5 );
      box( edge);
    popMatrix( );
    
    pushMatrix( );
      translate( 0, height*.2, depth );
      fill( 196,255,5 );
      box( edge);
    popMatrix( );
    
    pushMatrix( );
      translate( 0, height*.3, depth );
      fill( 196,255,5 );
      box( edge);
    popMatrix( );

}


