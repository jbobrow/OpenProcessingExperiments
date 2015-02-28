
int num = 12;
 int radiusKreis = 140;
 
 int s = 0;
 int h = 0;
 int m = 0;
 
 void setup()  {
   size(400,400);
   rectMode(CENTER);
 }
 
 void draw()  {
   noStroke();
   background(150);
   translate(width/2, height/2);
   for(int i = 0; i < num; i++)  {
     pushMatrix();
     rotate(TWO_PI / num * i);
     translate(0,radiusKreis);
     rect(0, 0, 10,10);
     popMatrix();
   }
   
   stroke(255);
   strokeWeight(3);
   
   //sekunde
   s = second();
   pushMatrix();
   rotate(TWO_PI / 60 * s);
   line(0,0,0,-120);
   popMatrix();
   
   //stunde
   h = hour();
   m = minute();
   pushMatrix();
   rotate(TWO_PI / 12 * h);
   rotate(TWO_PI / 12 / 60 * m);
   line(0,0,0,-80);
   popMatrix();
   
 }
