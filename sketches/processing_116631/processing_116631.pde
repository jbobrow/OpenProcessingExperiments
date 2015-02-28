
Bullet bullet1;
boolean go = false;
int gunX = 450;
int gunY = 250;

 
 void setup(){
   size(500,500);
   
   bullet1 = new Bullet(  color(30),  width-30,  height/2+5,  -40, 8);
   
 }
 
 void draw(){
   background(255);
   
   
   if(keyPressed){
     go = true;
     fill(255,255,0);
     ellipse ( width-60,height/2+5,25,25);
   }
   
   
   if(go == true){
     
   bullet1.move();
   bullet1.display();
   }
   
   gun();
 
   
   
 }
 
 class Bullet{
   color c;
   float xpos;
   float ypos;
   float bSize;
   float xspeed;
    
   Bullet(color tempC, float tempXpos,float tempYpos, float tempXspeed, float tempBsize) {
     c = tempC;
     xpos = tempXpos;
     ypos = tempYpos;
     xspeed = tempXspeed;
     bSize = tempBsize;
   }
   
   void display(){
     
     fill(c);
     ellipse(xpos,ypos,2*bSize,bSize);
   }
   
   void move(){
     xpos=xpos+xspeed;
     if (xpos > width){
       xpos = 0;
   }
   
  
   if (xpos < 0){
     xpos = width-30;
     go = false;
     
       
     }
     
   
   }
 
 
 
 }
 
 
 void gun(){ 
   rectMode(CORNER);
   fill(0); 
   rect( gunX, gunY, 40,10); 
   rect( gunX + 30, gunY, 10,25); 
   line( gunX + 20, gunY + 10, gunX + 30, gunY + 20); 
   line( gunX + 19, gunY + 10, gunX + 30, gunY + 21); 
   line( gunX + 21, gunY + 10, gunX + 30, gunY + 19); 
   line( gunX + 27, gunY + 10, gunX + 27, gunY + 14); 
   line( gunX + 28, gunY + 10, gunX + 28, gunY + 14);
 } 
