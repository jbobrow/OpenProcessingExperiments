
void setup ()
{
  size (600, 200);
  smooth();

 
}

void draw ()
{
 background (#57385c);
 
 int numberOfElements = 600;
 
 float steps = (float) width / numberOfElements;
 float angleSteps = TWO_PI / numberOfElements;
 
 int i = 0;
 while (i < numberOfElements) {
 
   float x = steps*i;
   float angle = angleSteps * i;
   float y = height/2 + cos (angle) * 80;
   
   noStroke();
   fill(#ffedbc);
   ellipse (x, y, 10, 10);
   
   y = height/2 + sin (angle) * 80;
   fill(#A75265);
   ellipse (x, y, 10, 10);
   
   i = i +1;
 }
 
}




