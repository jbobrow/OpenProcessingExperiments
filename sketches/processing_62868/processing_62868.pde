
int num = 12;
 int radiusKreis = 140;
 
 void setup()  {
   size(600,400);
   rectMode(CENTER);
   noStroke();
 }
 
 void draw()  {
   translate(width/2, height/2);
   for(int i = 0; i < num; i++)  {
     //fill(255 / num * i );
     pushMatrix();
     rotate(TWO_PI / num * i);
     translate(0,radiusKreis);
     rect(0, 0, 10,10);
     popMatrix();
   }
 }
