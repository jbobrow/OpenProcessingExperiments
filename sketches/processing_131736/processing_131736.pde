
//ICE6
//Scott Alberstein, 2014

void setup( ) 
{ 
 size( 400, 400, P3D );  
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
    translate( 0, 0, -100);
    box(30);
  popMatrix();
  
  pushMatrix();
    translate( 0, 100, 0);
    box(30);
  popMatrix();
  
  pushMatrix();
    translate(100, 0, 0);
    box(30);
    
    
} 
 
void prepareWindow( ) 
{ 
 background( 0 ); 
 translate( width/2, height/2, 0 ); 
 
 // rotate +30 degrees around the x Axis 
 rotateX( radians( 30 ) ); 
 
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
 



