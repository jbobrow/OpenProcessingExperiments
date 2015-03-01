

// Task 6 3-D
// Copyright Jim Roberts Pittsburgh, PA 15221  July 2014

/***************************************
<H3>  Flying Around My Initial </H3><BR>
Translation Controls:<BR>
----------------- [ up arrow ] move up ------------------<BR>
-- [left arrow]  move left -- move right [right arrow] --<BR>
--------------- [ down arrow ] move down ----------------<BR>
-- [c] key - to move closer --- to move away - key [a] --<BR>
Rotation Controls:<BR>
-- Move sliders for x, y and z axis rotation<BR>
Other Controls:<BR>
-- [s] key or stop button to stop translation<BR>
-- [space] key or reset button to return to zero positions<BR>
***************************************/


// Global Variables

int transXDelta, transYDelta, transZDelta;
int transX, transY, transZ, tempTransZ;
int rotX, rotY, rotZ;

PFont f;
PImage p, p1, p2;

int depth;
int edge;

void setup( )
{
  size( 500, 500, P3D  );
  f = loadFont( "f.vlw" );
  textFont( f );
  
  //background( 0 );
  
  depth = 0;
  edge = (int)(.08*width);     
}

void draw( )
{
   background( 255 );
   directionalLight(255, 255, 255, 0, 1, -1);

   drawControls( );
   showStatus( );
   
   translate( width/2, height/2, 0 );  
   
   adjustCoordinates( );
   trackMouse( ); 
   
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
      box( 400, 10, 10 );
      fill( 0, 0, 255);
      box( 10, 400, 10 );
      fill( 255, 0, 0 );
      box( 10, 10, 400 );
      fill( 0, 255, 0 );
      sphere( 20 );
}


void adjustCoordinates( )
{
   transX += transXDelta;
   transY += transYDelta;
   transZ += transZDelta;
}

void showStatus( )
{
   textAlign( LEFT );
   textFont( f, 14 );
   fill( 255, 255, 0 );
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

void drawZAxisRotateControl( )
{   
   textAlign( CENTER );
   rectMode( CENTER );
   stroke( 255, 0, 0 );
   strokeWeight( 10 );
   fill( 255, 255, 0 );
   text( "Z Axis Rotation ", width/2, 15 );
   line( width*.2, 30, width*.8, 30 );
   noStroke( );
   fill( 255, 255, 0 );
   rect( map(  rotZ, -360, 360, width*.2, width*.8) ,  30, 10, 30 );
}

void drawYAxisRotateControl( )
{   
   textAlign( CENTER );
   rectMode( CENTER );
   stroke( 255, 0, 0 );
   strokeWeight( 10 );
   fill( 255, 255, 0 );
   text( "Y Axis Rotation ", width/2, height - 10 );
   line( width*.2, height-30, width*.8, height-30 );
   fill( 255, 255, 0 );
   noStroke( );
   rect( map(  rotY, -360, 360, width*.2, width*.8) ,  height-30, 10, 30 );
 
}

void drawXAxisRotateControl( )
{   
   textAlign( CENTER );
   rectMode( CENTER );
   stroke( 255, 0, 0 );
   strokeWeight( 10 );
   text( "X\nAxis\nRotation ", width-20, height*.85 );
   line( width-20, height*.2, width-20, height*.8 );
   fill( 255, 255, 0 );
   noStroke( );
   rect( width-20, map( rotX, -360, 360, height*.2, height*.8) ,  20, 10 );
 
}

void drawResetButton( )
{
    noStroke( );
    textAlign( CENTER );
    rectMode( CORNER );
    fill( 255, 0, 0 );
    //rect( width-65, height-30, 65, 30 );
    fill (  0 );
    text( "RESET", width-30, height-10 );  
}

void drawStopButton( )
{
    noStroke( );
    textAlign( LEFT );
    rectMode( CORNER );
    fill( 255, 0, 0 );
    //rect( 2, 2, 50, 30 );
    fill (  0 );
    text( "STOP", 9, 25 );  
}

void drawTranslationControlText( )
{
  fill(0, 255, 0 );
  text("Tranlation Controls:\n X axis: [left-arrow]  [right-arrow]\n Y axis: [up-arrow] [down-arrow] \n Z axis: [c-key] [a-key] \n stop: [s-key] \n reset: [space-bar]", 5, height*.8 );
}

void drawControls( )
{
   drawResetButton( );
   drawYAxisRotateControl( );
   drawXAxisRotateControl( );
   drawZAxisRotateControl( );
   drawStopButton( );
   drawTranslationControlText( );
   
}

void keyPressed( )
{
   if ( key == CODED )
   {
      if (keyCode == UP)
      {
         transYDelta--;
      }
      else if (keyCode == DOWN)
      {
        transYDelta++;
      }
      else if (keyCode == LEFT)
      {
         transXDelta--;
      }
      else if (keyCode == RIGHT)
      {
       transXDelta++;
      }
   }
  
   else if ( key == ' ' )
   {
      transX = transY = transZ = 0;
      rotX = rotY = rotZ = 0;
      transXDelta = transYDelta = transZDelta = 0;
   }  
   else if ( key == 'C' || key == 'c' )
   {
     transZDelta++;
   }
   else if ( key == 'A' || key ==  'a' )
   {
     transZDelta--;
   } 
   else if ( key == 'S' || key == 's' )
   {
        transXDelta = transYDelta = transZDelta = 0;
   } 
   else if ( key == 'z' )
   {
       tempTransZ = transZ;
       transZ = -500; 
   }
   else if ( key == 'x' )
   {
      transZ = tempTransZ; 
   }
   
   else if ( key == 'p' )
   {
      saveFrame( "hw7.jpg"); 
   }
}


void trackMouse(  )
{  
   if (mousePressed)
   {
      // check the Y axis rotation bar
      if (mouseY >= height-35 && mouseY <= height-25 )
      {    
        rotY = int(map( mouseX , width*.2, width*.8 , -360, 360 ) );
        if ( rotY < -360 ) rotY = -360;
        if ( rotY >  360 ) rotY =  360;
      } // check the X axis rotation bar
      else if (mouseX >= width-35 && mouseY <= width-25 )
      {
         rotX = int(map( mouseY , height*.2, height*.8 , -360, 360 ) );
        if ( rotX < -360 ) rotX = -360;
        if ( rotX >  360 ) rotX =  360;
      } // check the Z axis rotation bar
      else if ( mouseY > 25 && mouseY < 35 )
      {   
        rotZ = int(map( mouseX , width*.2, width*.8 , -360, 360 ) );
        if ( rotZ < -360 ) rotZ = -360;
        if ( rotZ >  360 ) rotZ =  360;
      }
   }
}

void mousePressed( )
{
    if ( mouseX > width-30 && mouseY > height-30 )
    { 
      transX = transY = transZ = 0;
      rotX = rotY = rotZ = 0;
      //rotXDelta = rotYDelta = rotZDelta = 0;
      transXDelta = transYDelta = transZDelta = 0;
    } 
    else if ( mouseX < 60 && mouseY < 50 )
    {
           transXDelta = transYDelta = transZDelta = 0;
    }
}



void drawInitial(  )
{
     fill( #F5ED07 );
     stroke( 0 );
     strokeWeight(3);


    // Cap of J
    // back row of blocks
    pushMatrix( );
      translate( width*-.1, height*-.3, depth - edge - 5);
      fill( #F5ED07 );
      box( edge);
    popMatrix( );
    
    pushMatrix( );
      translate(0, height*-.3, depth - edge - 5);
      fill( #F5ED07 );
      box( edge);
    popMatrix( );
    
    pushMatrix( );
      translate( width*.1, height*-.3, depth - edge - 5);
      fill( #F5ED07 );
      box( edge);
    popMatrix( );
    
    
    // middle row of blocks
    pushMatrix( );
      translate( width*-.1, height*-.3, depth);
      fill( #F5ED07 );
      //box( edge);
    popMatrix( );
    
    pushMatrix( );
      translate( 0, height*-.3, depth);
      fill( #F5ED07 );
      box( edge);
    popMatrix( );
    
    pushMatrix( );
      translate( width*.1, height*-.3, depth);
      fill( #F5ED07 );
     // box( edge);
    popMatrix( );
    
    // front row of blocks
    pushMatrix( );
      translate( width*-.1, height*-.3, depth + edge + 5);
      fill( #F5ED07 );
      box( edge);
    popMatrix( );
    
    pushMatrix( );
      translate( 0, height*-.3, depth + edge + 5);
      fill( #F5ED07 );
      box( edge);
    popMatrix( );
    
    pushMatrix( );
      translate( width*.1, height*-.3, depth + edge + 5);
      fill( #F5ED07 );
      box( edge);
    popMatrix( );
    
    
    // right vertical of J
    pushMatrix( );
      translate( 0, height*-.2, depth );
      fill( #F5ED07 );
      box( edge);
    popMatrix( );
    
    pushMatrix( );
      translate( 0, height*-.1, depth);
      fill( #F5ED07 );
      box( edge);
    popMatrix( );
    
    pushMatrix( );
      translate( 0, 0, depth );
      fill( #F5ED07 );
      box( edge);
    popMatrix( );
    
    pushMatrix( );
      translate( 0, height*.1, depth );
      fill( #F5ED07 );
      box( edge);
    popMatrix( );
    
    // bottom of J
    pushMatrix( );
      translate( width*-.1, height*.2, depth );
      fill( #F5ED07 );
      box( edge);
    popMatrix( );
    
    pushMatrix( );
      translate( width*-.2, height*.2, depth );
      fill( #F5ED07 );
      box( edge);
    popMatrix( );
    
    // left end of J
    pushMatrix( );
      translate( width*-.3, height*.1, depth - edge - 5 );
      fill( #F5ED07 );
      box( edge);
    popMatrix( );
    
    pushMatrix( );
      translate( width*-.3, height*.1, depth );
      fill( #F5ED07 );
      box( edge);
    popMatrix( );
    
    pushMatrix( );
      translate( width*-.3, height*.1, depth  + edge + 5 );
      fill( #F5ED07 );
      box( edge);
    popMatrix( );

}


