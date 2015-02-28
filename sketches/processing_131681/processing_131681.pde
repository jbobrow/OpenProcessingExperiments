
float x = 140;
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

ellipse(50, 150, circe1, circe1);

  if (angle >= 360)
  {
    angle = 0;
  }
  
  if ( x >= 1000)
  {
    x = 140;
    angle = 0;
     y = sin(radians(angle)) * radius;
  }
   angle += inc;
    y = sin(radians(angle)) * radius + 150;
    x1 = cos(radians(angle)) * radius + 50; 
  x = x + 1;
    ellipse(x, y, 10, 10);
    ellipse(x1, y, 10, 10);
    angle2 = 0;
    
     for (int i = 0; i< width; i++){
    x2 = cos(radians(angle2))*(radius);
    y2 = 150 + sin(radians(angle2))*(radius);
    point(140 + i, y2);
    angle2 += inc2;
  }
  
  line(x1, y, x, y);
  

}


