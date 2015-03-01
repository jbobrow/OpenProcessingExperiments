
void setup()
{
  size (500, 500);
  background (0);
}
 
 void draw()
 {
   pushMatrix();
   translate (250, 250);
   fill ( 255);
   rotate (radians(millis())*2);
   quad (0, 0, 200, 0, 200, 10, 0, 10);
   popMatrix();
   
   pushMatrix();
   translate (250, 250);
   fill (0);
   rotate (radians(millis())*2);
   quad (0, 0, 100, 0, 100, 5, 0, 5);
   popMatrix();
 
 pushMatrix();
 translate(250, 250);
 fill(110);
 rotate (radians (millis())*-2);
 quad (0, 0, 50, 0, 50, 5, 0, 5);
 popMatrix();
 }
   
