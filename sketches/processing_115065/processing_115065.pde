
//HOMEWORK#6; Angeline Chen, Carnegie Mellon University Fall 2013, Pittsburgh PA
float transX;
float rotX;
float rotDeltaX;

float transY;
float rotY;
float rotDeltaY;

float transZ;
float rotZ;
float rotDeltaZ;

void setup( )
{
 size( 600, 600, P3D ); 
 noStroke( );
 lights( );
 
 rotDeltaX = 0;
 rotDeltaY = 0;
 rotDeltaZ = 0;

}

void draw( )
{
 pushMatrix( );
   prepareWindow( );
   //jimsPrepareWindow( );
   drawInitial( );
   pointLight( 255, 255, 255, 60, 40, 40 );
 popMatrix( );
 
 showStats( );
 
}

 void drawInitial ()
 {
 pushMatrix( );
  translate( width/2, height/2, 0 );
  fill( 94, 152, 45 );
  box( 100, 30, 30 );
 popMatrix( ); 
 
 pushMatrix( );
   translate( width/2-60, height/2+30, 0 );
   rotateY( radians( -30 ) );
   box( 30, 170, 30 );
 popMatrix( ); 
 
 pushMatrix( );
   translate( width/2-60, height/2+30, -70 );
   rotateY( radians( -30 ) );
   box( 30, 170, 30 );
 popMatrix( );

pushMatrix( );
   translate( width/2-60, height/2+30, -140 );
   rotateY( radians( -30 ) );
   box( 30, 170, 30 );
 popMatrix( );  
 
 pushMatrix( );
   translate( width/2+60, height/2+30, 0 );
   rotateY( radians( 30 ) );
   box( 30, 170, 30 );
 popMatrix( );
 
  pushMatrix( );
   translate( width/2+60, height/2+30, -70 );
   rotateY( radians( 30 ) );
   box( 30, 170, 30 );
 popMatrix( );
 
  pushMatrix( );
   translate( width/2+60, height/2+30, -140 );
   rotateY( radians( 30 ) );
   box( 30, 170, 30 );
 popMatrix( );
  
 pushMatrix( );
   translate( width/2-50, height/2-65, 0 );
   fill( 97, 155, 47 );
   rotateY( radians( -60 ) );
   box( 30 );
 popMatrix( );
 
  pushMatrix( );
   translate( width/2-50, height/2-65, -70 );
   fill( 97, 155, 47 );
   rotateY( radians( -60 ) );
   box( 30 );
 popMatrix( );
 
  pushMatrix( );
   translate( width/2-50, height/2-65, -140 );
   fill( 97, 155, 47 );
   rotateY( radians( -60 ) );
   box( 30 );
 popMatrix( );
 
  pushMatrix( );
   translate( width/2+50, height/2-65, 0 );
   rotateY( radians( 60 ) );
   box( 30 );
 popMatrix( );
 
   pushMatrix( );
   translate( width/2+50, height/2-65, -70 );
   rotateY( radians( 60 ) );
   box( 30 );
 popMatrix( );
 
   pushMatrix( );
   translate( width/2+50, height/2-65, -140 );
   rotateY( radians( 60 ) );
   box( 30 );
 popMatrix( );
 
  pushMatrix( );
   translate( width/2-35, height/2-100, 0 );
   fill( 69, 124, 22 );
   rotateY( radians( -90 ) );
   box( 30 );
 popMatrix( );
 
   pushMatrix( );
   translate( width/2-35, height/2-100, -70 );
   fill( 69, 124, 22 );
   rotateY( radians( -90 ) );
   box( 30 );
 popMatrix( );
 
   pushMatrix( );
   translate( width/2-35, height/2-100, -140 );
   fill( 69, 124, 22 );
   rotateY( radians( -90 ) );
   box( 30 );
 popMatrix( );
  
  pushMatrix( );
   translate( width/2+35, height/2-100, 0 );
   rotateY( radians( 90 ) );
   box( 30 );
 popMatrix( );
 
   pushMatrix( );
   translate( width/2+35, height/2-100, -70 );
   rotateY( radians( 90 ) );
   box( 30 );
 popMatrix( );
 
   pushMatrix( );
   translate( width/2+35, height/2-100, -140 );
   rotateY( radians( 90 ) );
   box( 30 );
 popMatrix( );
  
  pushMatrix( );
   translate( width/2-15, height/2-120, 0 );
   fill( 46, 88, 10 );
   rotateY( radians( -90 ) );
   box( 30 );
 popMatrix( );
 
 pushMatrix( );
   translate( width/2-15, height/2-120, -70 );
   fill( 46, 88, 10 );
   rotateY( radians( -90 ) );
   box( 30 );
 popMatrix( );
 
 pushMatrix( );
   translate( width/2-15, height/2-120, -140 );
   fill( 46, 88, 10 );
   rotateY( radians( -90 ) );
   box( 30 );
 popMatrix( );
 
 pushMatrix( );
   translate( width/2+15, height/2-120, 0 );
   rotateY( radians( 90 ) );
   box( 30 );
 popMatrix( );
 
  pushMatrix( );
   translate( width/2+15, height/2-120, -70 );
   rotateY( radians( 90 ) );
   box( 30 );
 popMatrix( );
 
  pushMatrix( );
   translate( width/2+15, height/2-120, -140 );
   rotateY( radians( 90 ) );
   box( 30 );
 popMatrix( );
 
 pushMatrix( );
   translate( width/2, height/2-155, 0 );
   fill( 33, 64, 6 );
   box( 30 );
 popMatrix( );
 
 pushMatrix( );
   translate( width/2, height/2-155, -70 );
   fill( 33, 64, 6 );
   box( 30 );
 popMatrix( );
 
 pushMatrix( );
   translate( width/2, height/2-155, -140 );
   fill( 33, 64, 6 );
   box( 30 );
 popMatrix( );
 
 frameRate( 10 );
 
 pushMatrix( );
   translate( random( 600 ) , random( 600 ), -70 );
   fill( 237, 76, 22 );
   sphere( 10 );
 popMatrix( );
 
  pushMatrix( );
   translate( random( 600 ), random( 600 ), -140 );
   fill( 237, 76, 22 );
   sphere( 10 );
 popMatrix( );
 
 pushMatrix( );
   translate( random( 600 ), random( 600 ), 120 );
   fill( 237, 76, 22 );
   sphere( 10 );
 popMatrix( );
 
}

void prepareWindow( )
{
 background( 255, 251, 219 );
 lights( );
 translate( transX, 0, 0 );
 rotateX( radians( rotX ) );
 rotX += rotDeltaX;
 
 translate( 0, transY, 0 );
 rotateY( radians( rotY ) );
 rotY += rotDeltaY;
 
 translate( 0, 0, transZ );
 rotateZ( radians( rotZ ) );
 rotZ += rotDeltaZ;
}

void mouseDragged( )
{
 if (mouseButton == LEFT )
  {
    if ( pmouseX < mouseX )
    {
      transX+=3;
    }
     else if ( pmouseX > mouseX )
    {
      transX-=3;
    }
     else if ( pmouseY > mouseY )
    {
      transY-=3;
    }
     else if ( pmouseY < mouseY )
    {
      transY+=3;
    }
  }
   if (mouseButton == RIGHT )
  {
    if ( pmouseY > mouseY )  transZ-=3;
    else if ( pmouseY < mouseY )  transZ+=3;
  }
}

void keyPressed( )
{
   if ( key == 'X' )  rotDeltaX+=.2;
   else if ( key == 'x' )  rotDeltaX-= 1;
   else if ( key == 'Y' )  rotDeltaY+= 1;
   else if ( key == 'y' )  rotDeltaY-= 1;
   else if ( key == 'Z' )  rotDeltaZ+= 1;
   else if ( key == 'z' )  rotDeltaZ-= 1;
   else if ( key == 's' ) 
   { 
     rotX = 0;
     rotY = 0;
     rotZ = 0;
     
     rotDeltaX = 0;
     rotDeltaY = 0;
     rotDeltaZ = 0;
   }
   else if ( key == ' ' );
     {
     transX = 0;
     transY = 0;
     transZ = 0;
     }
}

void showStats( )
{
 fill( 0 );
 textAlign( LEFT );
 textSize( 10 );
 text( "ROTATION (X " + abs( round( rotX ) ) + ", Y " + abs( round( rotY ) ) + ", Z " + abs( round( rotZ) ) + ")", 20, 560, 0 );
 text( "TRANSLATION (X " + round(transX) + ", Y " + round( transY ) + ", Z " + round( transZ ) + ")", 20, 580, 0 );
}

//void jimsPrepareWindow( )
{
  //background( 20 );
  //translate( width/2, height/2, 0 );
}


