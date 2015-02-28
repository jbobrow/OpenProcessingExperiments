
//Homework 7
//copyright Maitri Shah Pittsburgh PA

float x,y,dia;
float deltaX, deltaY;


void setup( )
{
 size( 400, 400);
 noStroke ( );
 smooth ( );
 noCursor ( );
 x = width/2;
 y = height/2;
 dia = 50;

}

void draw ( )
{
 prepScreen ( );
 drawCircle ( );
 wrapCircle ( );
 changeSpeed ( );
 showSpeed ( );
 //resetCircle ( );
}

void keyPressed ( )
{
   x = width/2;
   y = height/2;
   dia = 50;
}

void showSpeed ( )//speed is the amount x changes per frame. hence speed is deltaX
{
   fill (0);
   text( "Horizontal Speed" + deltaX , 10,350);
   text( "Vertical Speed" + deltaY , 10, 380 );
}

void changeSpeed ( ) //with help from Jessica Schafer
{
  x = x + 5;
  y = y + 5;

  deltaX = 2 + (mouseX-pmouseX)*0.7 ;
  deltaY = 2 + (mouseY-pmouseY)*0.7 ;
  
  if ( pmouseX != mouseX || pmouseY != mouseY )
   {
     x = x + deltaX ;
     y = y + deltaY ;
   }

}


void wrapCircle ( )
{
   if (x > 400 + dia/2 )
   {
     x = 0;
     y = random(300);

   }

   if ( y > 400 + dia/2)
   {
    y = 0;
    x = random(300);
   }
}

void drawCircle ( )
{

 fill (255, 121, 123);
 rect ( x-dia/2, y-dia/2, dia,dia);
 fill(120, 255, 255);
 ellipse ( x, y, dia, dia );
 fill (255, 121, 123);
 ellipse (x-dia/4, y-dia/4, dia/4, dia/4);
 ellipse (x+dia/4, y+dia/4, dia/4, dia/4);
 ellipse (x-dia/4, y+dia/4, dia/4, dia/4);
 ellipse (x+dia/4, y-dia/4, dia/4, dia/4);

}


void prepScreen ( )
{
 fill (120, 255, 255, 50);
 rect ( 0, 0 , width , height );
}



