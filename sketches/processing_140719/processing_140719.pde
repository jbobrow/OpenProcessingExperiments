
color c1, c2, c3; 
 
void setup( ) 
{ 
 size( 400, 400 ); 
 c1 = color( 200, 0, 0 ); // red 
 c2 = color( 0, 200, 0 ); // green 
 c3 = color( 0, 0, 200 ); // blue 
 strokeWeight( 3 ); 
 ellipseMode( CORNER ); 
} 
 
void draw( ) 
{ 
 background( 200 ); 
 design( 100, 100, 90, c1, c2 ); // smaller design 
 design( 180, 200, 165, c1, c3 ); // larger design 
 noLoop( ); 
} 

void design(float xCoor, float yCoor, float rectSize, color square, color circle){
      fill(square);
      rect(xCoor, yCoor, rectSize, rectSize);
      fill(circle);
      ellipse(xCoor, yCoor, rectSize/2, rectSize/2);
      line(xCoor+rectSize, yCoor, xCoor, yCoor+rectSize);
} 


