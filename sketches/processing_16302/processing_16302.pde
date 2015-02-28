
float x=600;
float y=0;


float speed=6;
float grav=0.60;
 void setup(){
   size(600,600);
 }
 void draw(){
   frameRate(15);
   background(0);
   noStroke();
  
  
   rectMode(CENTER);
    fill(255,3,19);
     if(mouseX>=100&&mouseX<500&&mouseY>=100&&mouseY<500){
    fill(44,209,23);
   ellipse(random(x-30),y,80,80);
   ellipse(random(x-30),y-5,50,50);
   ellipse(random(x-30),y+5,20,20);
  
   y=y+speed;
   speed=speed+grav;
   if(y>height){
     speed=speed*-0.95;
   }}}

