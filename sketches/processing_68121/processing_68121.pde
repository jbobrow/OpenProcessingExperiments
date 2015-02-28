
//Summer Challenge 19
//Bouncing Ball in Cage

int x_direction = 1;
int y_direction = 1;
int x_value;
int y_value;

void setup() 
{
  size(800,400);
  strokeWeight(20);
  x_value = width/2;
  y_value = height/2;
  background(180, 180, 180);
}

void draw()
{ 
 stroke(180, 180, 180);
 point(x_value, y_value);
 if (x_value >= width-10 || x_value < 10)
 { 
   x_direction = x_direction * -1;
 }
 if (y_value >= height-10 || y_value < 10) 
 {
   y_direction = y_direction * -1;
 }

 x_value = x_value + x_direction;
 y_value = y_value + y_direction;

 stroke(0, 0, 250); 
 point(x_value, y_value);
}
 

