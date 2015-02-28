
class Circle
{

float radius;
float  x,y;//positions
float speed_x;//speed in  x-axis
float speed_y;//spedd in y-axis

Circle( )
{
  
  x=(random(0,width)); 
  y=(random(0,height));
  
  speed_x=(random(0,2));
  speed_y=(random(0,2));

}//end 

void update( float _r)
{
  
 
   x+=speed_x;
   y+=speed_y;

  if ( x < 0 || x > width ) 
  {
  speed_x = -speed_x;
  
  }


  if ( y < 0 || y > height ) 
  {
  speed_y= -speed_y;
  }



radius = constrain( _r, 2, 100 )*2;
fill( random(255), random(255), random(255) );
//stroke( random(100), random(100), random(100) );
//noStroke();
ellipse( x, y, radius, radius );
}//end update

}//end class Circle

