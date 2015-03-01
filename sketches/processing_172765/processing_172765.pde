
class Car{

 float x,y;
 float speed;
 color c = color(random(255),random(255),random(255));
 
 Car(float nx, float ny,float nspeed){
   x=nx;
   y=ny;
   speed=nspeed;
 }
 
 void move(){
   x+=speed;
   if(x>width) x=-100;
 }
 
 boolean didHitFrog(float fx, float fy){
   if( dist(x,y,fx,fy) <30){
     return true;
   }
   else return false;
 }
 
 
 void display(){
   noStroke();
   fill(c);
   rect(x,y,60,36);
   fill(0);
   rect(x-25,y-18,7,2);
   rect(x-25,y+18,7,2);
   rect(x+25,y-18,7,2);
   rect(x+25,y+18,7,2);
   stroke(0);
   fill(#93E0DF);
   rect(x+20,y,10,30);
   fill(0);
 }
}

