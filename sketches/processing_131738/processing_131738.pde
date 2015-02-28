
// ICE 6 class code 
// Hyun Doug Kim 2014 copyright
void setup( ) 
{ 
 size( 400, 400, P3D ); 
 background( 0 ); 
} 
 
void draw( ) 
{ 
 prepareWindow( ); 
 placeShapes( ); 
} 
 
void placeShapes( ) 
{ 
  noStroke();
  box(30);
  
  pushMatrix();
  noStroke();
  translate(100, 0, 0);
  sphere(20);
  popMatrix();
  
  pushMatrix();  
  noStroke();
  translate(0, -100, 0);
  sphere(20);
  popMatrix();
  
  pushMatrix();  
  noStroke();
  translate(0, 0, -100);
  sphere(20);
  popMatrix();
} 
 
void prepareWindow( ) 
{ 
 background( 0 ); 
 translate( width/2, height/2, 0 ); //is the point where push and pop are happening. fix height, and width the location of the model changes, give + number to z then the thing will come closer to us, - number to z move away
 
 // rotate +30 degrees around the x Axis 
 rotateX( radians(frameCount ) ); // put number static, put framecount then rotate
 
 // rotate +20 degrees around the y Axis 
 rotateY( radians( 20 ) ); 
 
 // turn on the light 
 lights( ); 
 
 stroke( 255, 0, 0 ); 
 strokeWeight( 5 ); 
 line( -100, 0, 0, 100, 0, 0 ); // RED x axis line 
 stroke( 0, 255, 0 ); 
 line( 0, -100, 0, 0, 100, 0 ); // GREEN y axis line 
 stroke( 0, 0, 255 ); 
 line( 0, 0, -100, 0, 0, 100 ); // BLUE z axis line 

}


