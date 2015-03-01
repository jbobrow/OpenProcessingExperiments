
float x=1000;
float y=0.98;
 
 
float speed=6;
float grav=0.60;
 void setup(){
   size(600,600);
   background(255);
  
 }
 void draw(){
   fill(0);
   line(600,600,600,600);
   
   fill(255,3,1);
   rectMode(CENTER);
 
     
    fill(44,209,23,random(19));
    stroke(random(290),random(27),random(21));
   ellipse(random(x+30),y,80,80);
   ellipse(random(x+30),y-50,50,50);
   ellipse(random(x+30),y+5,20,20);
   
   y=y+speed;
   speed=speed+grav;
   if(y>height){
     speed=speed*-0.95;
 if(x>height){
   speed=speed+-0.98;
   }
   }
 }

