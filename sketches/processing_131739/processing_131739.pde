
// ICE 6 class code 
// The usual comment goes here... 
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

translate(0, 0, 0); 
noStroke ();
fill(255,255,255);
lights();
box(40);

pushMatrix ();
translate(100,0,0);
noStroke();
lights();
sphere(10);
popMatrix ();

pushMatrix ();
translate(0,0,-100);
noStroke();
lights();
sphere(10);
popMatrix ();
 
pushMatrix ();
translate(0,-100,0);
noStroke();
lights();
sphere(10); 
popMatrix ();

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




