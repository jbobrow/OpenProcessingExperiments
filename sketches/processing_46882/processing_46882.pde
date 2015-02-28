
Pic myPic;
PImage img;
PImage img2;
  
void setup() {
 size(400, 400);
 img = loadImage("ball.gif");
 img2 = loadImage("room.gif");
 smooth();
 fill(0);
 background(255);
 myPic = new Pic(0,0);
 background(255);
}
   
void draw()
{
  background(255);
  image(img2,0,0);
  myPic.run();
}
 
  
class Pic {
  float x = 0;
  float y = 0;
  float speedX = 4;
  float speedY = 0.5;
   
 Pic(float _x, float _y){
     
   x = _x;
   y = _y;
     
 }
   
 void run(){
   display();
   move();
   bounce();
   gravity();
 }
   
 void gravity(){
   speedY+= 0.2;
 }
   
 void bounce(){
   if(x > (width-100)){
     speedX = speedX * -1;
   }
   if(x < 0){
     speedX = speedX * -1;
   }
   if(y > (height-100)){
     speedY = speedY * -1;
   }
   if(y < 0){
     speedY = speedY * -1;
   }
 }
   
 void move(){
     
   x += speedX;
   y += speedY;
 }
   
 void display(){
    
 image(img,x,y);
  
 }
}
 
 
//http://www.openprocessing.org/visuals/?visualID=38993
//"Bouncing Bounce" by Anupriy Kanti


