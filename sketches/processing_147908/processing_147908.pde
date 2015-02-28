
//Stephanie Jeong yujeongj copyright 2014

float rotX;
float rotDeltaX;
float rotY;
float rotDeltaY;
float rotZ;
float rotDeltaZ;
void setup( )
{
   size( 600, 600, P3D );
   textSize( 24 );
   textAlign( CENTER );
    
   rotDeltaX=0;
   rotDeltaY=0;
   rotDeltaZ=0;
}
 
 
void draw( )
{
   pushMatrix( );
     PrepareWindow( );
     yourPrepareWindow( );
     drawInitial( );
   popMatrix( );
   showStats();
}
 
 
// Initial
 
void drawInitial( )
{ 
  background(0);
  fill(random(0,255), random(0, 255), random(0, 255), 100);
   noStroke();
   box( 10 );  
   
   pushMatrix();
   box(20);
   popMatrix();
    
   pushMatrix();
   box(30);
   popMatrix();
    
   pushMatrix();
   box(40);
   popMatrix();
    
   pushMatrix();
   box(60);
   popMatrix();
    
   pushMatrix();
   box(70);
   popMatrix();
    
   pushMatrix();
   box(80);
   popMatrix();
    
   pushMatrix();
   box(90);
   popMatrix();
    
   pushMatrix();
   box(100);
   popMatrix();
    
   pushMatrix();
   box(50);
   popMatrix();
   
   
   
   
   pushMatrix();
   translate(-100, -100,10);
   box( 10 ); 
   popMatrix(); 
   
   pushMatrix();
   translate(-100, -100,20);
   box(20);
   popMatrix();
    
   pushMatrix();
   translate(-100, -100,30);
   box(30);
   popMatrix();
    
   pushMatrix();
   translate(-100, -100,40);
   box(40);
   popMatrix();
    
   pushMatrix();
   translate(-100, -100,50);
   box(50);
   popMatrix();
   
      pushMatrix();
   translate(100, 100,-10);
   box( 10 ); 
   popMatrix(); 
   
   pushMatrix();
   translate(100, 100,-20);
   box(20);
   popMatrix();
    
   pushMatrix();
   translate(100, 100,-30);
   box(30);
   popMatrix();
    
   pushMatrix();
   translate(100, 100,-40);
   box(40);
   popMatrix();
    
   pushMatrix();
   translate(100, 100,-50);
   box(50);
   popMatrix();
   
   
   
      pushMatrix();
   translate(100, -100,-10);
   box( 10 ); 
   popMatrix(); 
   
   pushMatrix();
   translate(100, -100,-20);
   box(20);
   popMatrix();
    
   pushMatrix();
   translate(100, -100,-30);
   box(30);
   popMatrix();
    
   pushMatrix();
   translate(100, -100,-40);
   box(40);
   popMatrix();
    
   pushMatrix();
   translate(100, -100,-50);
   box(50);
   popMatrix();
   
   
      pushMatrix();
   translate(-100, 100,10);
   box( 10 ); 
   popMatrix(); 
   
   pushMatrix();
   translate(-100, 100,20);
   box(20);
   popMatrix();
    
   pushMatrix();
   translate(-100, 100,30);
   box(30);
   popMatrix();
    
   pushMatrix();
   translate(-100, 100,40);
   box(40);
   popMatrix();
    
   pushMatrix();
   translate(-100, 100,50);
   box(50);
   popMatrix();
}
 
 
 
void yourPrepareWindow( )
{
  translate( mouseX-300, 0, 0 );
  rotX += rotDeltaX;
  rotateX( radians( rotX ) );
   
  translate( 0, mouseY-300, 0 );
  rotY += rotDeltaY;
  rotateY( radians( rotY ) );
   
  rotZ += rotDeltaZ;
  rotateZ( radians( rotZ ) );

}
 

void mousePressed( )
{
       rotDeltaX += 1;
       rotDeltaY += 1;
       rotDeltaZ += 1;
    }
     
void keyPressed(){
    if ( key == 's' )
    {
       rotDeltaX = 0;
       rotDeltaY = 0;
       rotDeltaZ = 0;
    }
     
} 

void PrepareWindow( )
{
 
    background(255); 
    translate( width/2, height/2, 0 );
    lights();
}

void showStats( )
{
   fill(255);
   textSize ( 15 ) ;
   text("click to rotate the figure faster!",  width*.5, 100);
   text("move your mouse up or down to have the figure rotate with a bigger diameter!", width*.5, 120);
}



