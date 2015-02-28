
class Rect {

float x=0;
float y=x;

float r=0;
float g=random(200);
float b=random(200,255);
float a1= random(-50,800);
float a2= random(-50,800);

   void display()
   {
     x=+x;
     y=x;
     fill (r,g,b);
     ellipse (a1,a2,x,y);
   }
   
   
 void update() {
      if (x*y> random(100,1000000)) {
     x=0;
     y=x;
      }
 else { x=x+1;}
   }
   
   
}
   
  

