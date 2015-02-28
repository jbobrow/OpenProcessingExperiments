
int circleX = 50; 
int circleXSpeed= 5;
int circleY = 100;
int circleYSpeed= 3;
int circleZ = 80;
int circleZSpeed= 7;
int circleY1 = 300;
int circleY1Speed= 4;
int circleY2 = 100;
int circleY2Speed= 3;



void setup() {
   size(600, 350);
   
} 

void draw() {
   background(0);
   smooth();
   noStroke();
   fill(255,0,0);
   ellipse(circleX, mouseY, 50, 50);
   fill(255,245,69);
   ellipse(circleZ, mouseY+20,30, 30);
   fill(0,255,235);
   ellipse(mouseX,circleY, 30, 30);
   fill(10,230,10);
   ellipse(mouseX+50, circleY1, 40, 40);
   fill (252,76,235);
   ellipse(mouseX+10, circleY2, 60, 60);
   
   
   circleX = circleX + circleXSpeed;
   circleY = circleY + circleYSpeed;
   circleZ = circleZ + circleZSpeed;
   circleY1 = circleY1 + circleY1Speed;
   circleY2 = circleY2 + circleY2Speed;
   if ((circleX > width) && (circleZ > width) && (circleY2 > height) && (circleY1 > height) && (circleY > height)) {
     circleXSpeed = -5;
     circleYSpeed = -3;
     circleZSpeed = -4;
     circleY1Speed = -2;
     circleY2Speed = -1;
     
     
 
 }
   if ((circleX < 0) && (circleZ < 0)  && (circleY2 > 0) && (circleY1 >= 0) && (circleY < 0)) {  
     circleXSpeed = 5;
     circleYSpeed = 3;
     circleZSpeed = 4;
     circleY1Speed = 2;
     circleY2Speed = 1;
     
     
       
       
       
       
   }
   
  
   

   
   
   
}
