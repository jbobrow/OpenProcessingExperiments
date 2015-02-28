
/* ======================================================
Aurthor: Farbod Fathalipouri, 
Student ID: 373457, 
Natural System Studio, University of Melbourne
  
NO COPYRIGHT!
welcome to copy, modify and distribute any way you want!
======================================================  */
class Pint {

  //============= declare the variables =============  
  color c;
  float Xpos;
  float Ypos;
  float speed;
  float w;
  float difX;
  float difY;
  
//============= The constructor and initializing variables =============
  Pint(color tempc, float tempX, float tempY, float tempw, float tempsp){
    c = tempc;
    Xpos = tempX;
    Ypos = tempY;
    w = tempw;
    speed = tempsp;
  }
  
 //============= Methods and Functions =============
 
 // we want to make the point move towards the mouse pointer any where it goes
 
 void attractor(){
  difX= mouseX - Xpos;
  difY= mouseY - Ypos;
   
   if (difX > 0){
     for (int i=0; i<= difX; i++);
     Xpos += speed;
   }
   if (difX <0){
     for (int i=0; i<abs(difX); i++);
     Xpos -= speed;
   }
   if (difY > 0){
     for (int i=0; i<= difY; i++);
     Ypos += speed;
   }
   if (difX <0){
     for (int i=0; i<abs(difY); i++);
     Ypos -= speed;
   }
   if (mousePressed){
     speed *= -0.95;
   }
 }
 
// we will make the points based on the function above;
void display(){
  ellipseMode(CENTER);
  stroke(0,Ypos,Xpos);
  fill(Xpos,Ypos,0);
   ellipse(Xpos,Ypos,w,w);
}
}
   


