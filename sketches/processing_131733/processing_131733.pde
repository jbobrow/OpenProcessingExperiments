
// James Robe
// Feb, 2, 2014
// circle exersizes

// 
float x = 95;

// angle controls 
float angle = 0;
float angle2 = 0;
float radius = 40;
float inc = 2;
float inc2 = 2;
float y = sin(radians(angle)) * radius;
float y2 = sin(radians(angle)) * radius;
float x1 = cos(radians(angle)) * radius + 50; 
float x2 = 0;
float circe1 = 90;



void setup()
{
 size(1000, 300); 
}

void draw()
{
  smooth();
    background(255);
    fill(0, 255, 0);
    
// larger static circle that the smaller circle revolves around
ellipse(50, 150, circe1, circe1);
// resets the angle to be zero once the angle value has exceeded 360
  if (angle >= 360)
  {
    angle = 0;
  }
// resets the circle that moves laterally along the sine function to be zero 
  if ( x >= 1000)
  {
    x = 140;
    angle = 0;
     y = sin(radians(angle)) * radius;
  }
  
  // increases the angle by the incrimint every cycle
   angle += inc;
  // resets y and x to be equal to the new circulat position
    y = sin(radians(angle)) * radius + 150;
    x1 = cos(radians(angle)) * radius + 50; 
    
  x = x + 1;  // moves the smaller circle latterally. 
    ellipse(x, y, 10, 10);
    ellipse(x1, y, 10, 10);
    angle2 = 0;
    // this segment is what draws the line and moves it
    // along an incrementing x path
     for (int i = 0; i< width; i++){
    y2 = 150 + sin(radians(angle2))*(radius);
    point(95 + i, y2);
    angle2 += inc2;
  }
 // this creates the line between the two moving circles 
  line(x1, y, x, y);
  

}


