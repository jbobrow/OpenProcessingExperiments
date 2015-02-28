
class Star {
   
  float x, y;
  float radius;
   color c;
   
   
  float angle;
  float angleInc;
  float s;
  float r;
  float sR;
  float sRa;

     Star(){
      r= random (.5,2.5);
      x = 30;
      y = 50;
      c = color(255);
          angle = random(TWO_PI/45);
      angleInc = random(PI/15);
      s=.1;
      sR = random(.1, .5);
      sRa = random(.3, .7);
      
      
      
   }


   void setPos(float x_, float y_){

      x = x_;
      y = y_;
   }

   
  
   void display(){

     fill(c);
     noStroke();

     ellipse(x, y, radius, radius);
     radius = r + random(.1,5);
     float circleX = cos(angle/2)*sR;
    float circleY = sin(angle/2)*sRa;
    angle -= angleInc;
    this.x -= circleX;        
    this.y -= circleY;
    
    if(this.x > mouseX)                   //how it follows the mouse
     {
     this.x = this.x - s;
     
     }
     
     if(this.x < mouseX)
     {
     this.x = this.x + s; 
     }
     
     if(this.y > mouseY)
     {
     this.y = this.y - s;
     }
     if(this.y < mouseY)
     {
     this.y = this.y + s;
     
     }
   }
}


