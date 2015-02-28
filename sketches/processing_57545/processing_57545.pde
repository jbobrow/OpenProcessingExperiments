
class Circle 
{

float x;
float y;
int diameter;
float speed = 0.5;

 Circle(float tempX, float tempY, int tempDiameter)
 {
  x = tempX; 
  y = tempY; 
  diameter = tempDiameter;
 }

 void move() 
 { 
  x += random(-speed, speed); 
  y += random(-speed, speed); 
 } 
  
 void display()
  { 
   PShape eli00;
   eli00 = loadShape("eli00.svg");
   smooth();
   shape(eli00, x, y, diameter, diameter);
  }

}

