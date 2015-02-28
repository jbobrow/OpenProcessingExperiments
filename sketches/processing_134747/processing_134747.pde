
//ICE #6
//Copyright Miranda Jacoby 2014, All Rights Reserved. 
//Contact: majacoby@andrew.cmu.edu

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
//Center Cube
 noStroke();
 fill(0, 200, 200);
 box(30);

//Sphere on Red Line
pushMatrix();
 noStroke();
 fill(0, 200, 200);
 translate(100, 0, 0);
 sphere(15);
popMatrix();

//Sphere on Green Line
pushMatrix();
 noStroke();
 fill(0, 200, 200);
 translate(0, -100, 0);
 sphere(15);
popMatrix();

//Sphere on Blue Line
pushMatrix();
 noStroke();
 fill(0, 200, 200);
 translate(0, 0, -100);
 sphere(15);
popMatrix();
} 
 
void prepareWindow( ) 
{ 
 background( 0 ); 
 translate( width/2, height/2, 0 ); 
 
 // rotate +30 degrees around the x Axis 
 rotateX( radians( frameCount ) ); 
 
 // rotate +20 degrees around the y Axis 
 rotateY( radians( frameCount ) ); 
 
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


