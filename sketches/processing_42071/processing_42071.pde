
//Homework_10
//copyright Maitri Shah, Pittsburgh, PA


void setup ( )
{
 size(500, 500, P3D ) ;
 background(255);
 noStroke( );

}

void draw ( )
{
  letterS( );
  noLoop( );
   
}

void letterS( )
{
 translate(width/2, height/2, 0);
 
  pushMatrix( );
    translate(100, -100, -400);
    drawSphere( ); 
  popMatrix( );
 
  pushMatrix( );
    translate(75, -175, -370);
    drawSphere( );
  popMatrix( );
  
  pushMatrix( );
    translate(0, -200, -340);
    drawSphere( );
  popMatrix( );
 
 pushMatrix( );
   translate(-75,-175, -310);
   drawSphere( );
 popMatrix( );
 
 pushMatrix( );
   translate(-100, -100, -280);
   drawSphere( );
 popMatrix( );
 
 pushMatrix( );
   translate(-75, -25, -250);
   drawSphere( );
 popMatrix( );
 
 pushMatrix( );
   translate(0, 0, -220);
   drawSphere( );
  popMatrix( );
 
 pushMatrix( );
   translate(75, 25, -190);
   drawSphere( );
 popMatrix( );
 
 pushMatrix( );
   translate(100, 100, -160);
   drawSphere( );
 popMatrix( );
 
 pushMatrix( );
   translate(75, 175, -130);
   drawSphere( );
 popMatrix( );
 
 pushMatrix( );
   translate(0, 200, -100);
   drawSphere( );
 popMatrix( );
 
 pushMatrix( );
   translate(-75, 175, -70);
   drawSphere( );
 popMatrix( );
 
 pushMatrix( );
   translate(-100, 100, -40);
   drawSphere( );
 popMatrix( );  
}

void drawSphere( )
{
 color col;
 col = color(random(255), random(255), random(255), 50);
 fill(col);
 sphere(height/10); 
}

