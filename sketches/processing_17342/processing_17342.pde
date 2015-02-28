
class ball    // exemple de classe
{ 
  float xpos;
  float ypos;
  float rad;
  float gravetat=0.1;
  float vy=0;
  float vx=0;
  
  ball (float x, float y, float z)   // funcio constructora de la classe 
   { 
     xpos=x;
     ypos=y;
     rad=z;     
   } 
   
   void displayBall(){
     ellipseMode(RADIUS);
     ellipse(xpos,ypos,rad,rad);  
}

   void moveBall(){
     vy += gravetat;
     xpos += vx;
     ypos += vy;
     if (xpos+rad > width){
       xpos=width-rad;
       vx *= fregament;
     }
     else if (xpos-rad < 0){
       xpos = rad;
       vx *= fregament;
     }
     if (ypos + rad > 320) {
      ypos = 320 - rad;
      vy *= fregament; 
    } 
    else if (ypos - rad < 0) {
      ypos = rad;
      vy *= fregament;
    }
   }
}


