
class Cloud{
  
 float xpos;
 float ypos;
 float speed;
 PImage p;
 
 Cloud(float x, float y, float speed_, PImage p_){
   
   xpos=x;
   ypos=y;
   speed = speed_;
   p = p_;
   
 }
 
 void move(){
   xpos =  xpos+speed;
   if(xpos > width+p.width){
     xpos = 0-p.width;//how to control x
     ypos  = ypos+random(50,100);//update y each time cloud leaves the screen
     println(ypos);
   }

   
 }
 
 void display(){
   image(p,xpos, ypos);
   
   
 }
}

