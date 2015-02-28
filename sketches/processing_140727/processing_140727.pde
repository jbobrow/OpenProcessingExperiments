
color c1, c2, c3; //c1 red, c2 green and  c3 blue
float xRect; //xcoordinate of rectangle
float yRect; //ycoordinate of rectangle
float sRect; // size of rect

void setup( ) 
{ 
 size( 400, 400 ); 
 
 c1= color(200,0,0); //red
 c2 = color( 0, 200, 0 ); // green 
 c3 = color( 0, 0, 200 ); // blue 
 strokeWeight( 3 ); 
 ellipseMode( CORNER ); 
} 
 
void design(float xRect, float yRect, float sRect, color c1, color onecolor)
{
fill (c1);
rect(xRect, yRect, sRect, sRect);
line(xRect+sRect, yRect, xRect, yRect+sRect);
fill (onecolor);
ellipse(xRect, yRect, sRect/2, sRect/2);

} 

void draw( ) 
{ 
 background( 200 ); 
 design( 100, 100, 90, c1, c2 ); // smaller design 
 design( 180, 200, 165, c1, c3 ); // larger design 
 noLoop( ); 
}





