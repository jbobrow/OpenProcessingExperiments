
// float is a real number
float angle = 0;
float radius = 0;

float stepangle = radians(10);
float stepradius = 3;

size(500,500);
// sets the spiral to start in the centre of the window
translate(height/2,width/2);

// sets the thickness of the stroke
strokeWeight(8);

//for loop will count from 0 to a number for the amount of steps taken
for(int n=0 ; n<50 ; n++)
{
  // adds the angle to the step angle
  angle  += stepangle;
  // adds the radius to the stepradius
  radius += stepradius;
  
  // declares the x and y coordinate as a real number using trig
  float x = radius*cos(angle);
  float y = radius*sin(angle);
  
  // creates a dot at (x,y)
  point(x,y);
  
  
}




