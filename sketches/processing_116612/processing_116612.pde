
Bullet bullet1;
 boolean go = false;

 
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
  
   fill(0);
   rect( width-50, height/2, 40,10);
   rect( width-20, height/2, 10,25);
   
   line( width-30, height/2+10, width-20, height/2+20);
   line( width-31, height/2+10, width-20, height/2+21);
   line( width-29, height/2+10, width-20, height/2+19);
   line( width-23, height/2+10, width-23, height/2+14);
   line( width-22, height/2+10, width-22, height/2+14);
   
 }
