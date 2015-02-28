
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
   int y = height;
   
   fill(0); // black gun color
   rect(width-50, y/2, 40,10); // barrel
   rect(width-20, y/2, 10,25); // grip
   //Possible suggestion for trigger guard: use quad() instead of draw three lines
   line(width-30, y/2+10, width-20, y/2+20); // fill of trigger guard
   line(width-31, y/2+10, width-20, y/2+21); // low part of trigger guard
   line(width-29, y/2+10, width-20, y/2+19); // high part of trigger guard
   
   //'Nother suggestion: since the trigger has width, might want to use rect()
   line(width-23, y/2+10, width-23, y/2+14); //left side of trigger
   line(width-22, y/2+10, width-22, y/2+14);// right side of trigger
   
   if (keyPressed) {
     if (key == CODED) {
       if (keyCode == UP) {
         y -= 1;
       }
     }    
     if (key == CODED) {
       if (keyCode == DOWN) {
         y += 1;
       }
     }
   }
 }
