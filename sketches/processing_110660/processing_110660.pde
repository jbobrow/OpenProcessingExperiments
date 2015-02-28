
int posX= 5;
int speedX = 10;
int posY = 10;
int speedY = 5;


void setup () {
  size (500,500);
  }
  
 void draw () {
   background (0,150,150);
   noStroke();
   
   posX = posX + speedX;
   posY = posY + speedY;
   println (posY);
   
   if (posX >= width || posX <=0) {
     speedX *= -1;
 
 }
 
    if (posY >= height || posY <=0) {
     speedY *= -1;
     
   }
   
 fill (255,255,255);
 ellipse(posY, posX, 20,20);


 fill (0,0,0);
 
 ellipse(posX, posY, 20,20);
 }
 


