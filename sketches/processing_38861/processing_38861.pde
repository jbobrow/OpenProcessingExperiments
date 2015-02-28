
int y_position=20;
int y_speed= +15;

void setup ()
{
  size(100,700);
  stroke(255);
}


void draw ()
{  
 background (90,220,220);
 y_position=y_position + y_speed;
 ellipse(50,y_position,20,20);
 
 //if the ball reach to the right side, it changes the direction to back.
  if (y_position>680) {y_speed=-15;}
  
  //if the ball reach to the left side, it changes the direction to right.
  else if (y_position<20) {y_speed=+15;}
}                                                               
