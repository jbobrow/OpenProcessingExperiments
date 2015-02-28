
class Cana {
  float posX;
  float posY;
  
  color col;
  
  int speedX = 5;
  int speedY = 5;
  
  
   Cana(float x, float y, int blueValue)
   {
     posX = x;
     posY = y;
     
     col = color(0,0,blueValue);
   }
   
   void moveAndDraw()
   {
     fill(col);
     strokeWeight(1);

     if (posY > height) {
       posY = 0;
       col = color(0,0,int(random(0,256)));
     }
     
     posY = posY + speedY;
     if (posX > width) {
       posX = 0;
     }
     posX = posX + speedX;
     
     ellipse(posX,posY,10,10);
     return;
   }
   
   void setPos(float X, float Y)
   {
     posX = X;
     posY = Y;
   }
   
}

