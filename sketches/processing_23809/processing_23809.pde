

class Mycar {
   float w, h, xpos, ypos, sp;
   
   
   
   Mycar(float tempW, float tempH, int tempX, int tempY, int tempsp) {
     w = tempW;
     h = tempH;
     xpos = tempX;
     ypos = tempY;
     sp  = tempsp;
     
}
 
 void move() {
 
   xpos = xpos + sp;
   if(xpos > width-36){
    sp = -1;
   }
 
   if(xpos < 0){
    sp = 1;
   }
 
 
 
 }
   
   
 
 
 
 
 
 void display(int i, float lastAmp) {
   stroke(0);
   if(i==0)
   {
      fill(c1);
      rect(xpos, ypos, w, h);

      fill(255);
      ellipse(xpos+27, ypos+20,5*lastAmp*0.6+8,h/2*lastAmp*0.6+8);
      ellipse(xpos+8, ypos+20,5*lastAmp*0.6+8,h/2*lastAmp*0.6+8);

   } 
   
   else if(i==1)
   {
      fill(c2);
      rect(xpos, ypos, w, h);
      fill(255);
      ellipse(xpos+27, ypos+20,5*lastAmp*0.6+8,h/2*lastAmp*0.6+8);
      ellipse(xpos+8, ypos+20,5*lastAmp*0.6+8,h/2*lastAmp*0.6+8);
      
   } 
   
    
   else if(i==2)
   {
      fill(c3);
      rect(xpos, ypos, w, h);
      fill(255);
      ellipse(xpos+27, ypos+20,5*lastAmp*0.6+8,h/2*lastAmp*0.6+8);
      ellipse(xpos+8, ypos+20,5*lastAmp*0.6+8,h/2*lastAmp*0.6+8);
   } 
   
   
    else if(i==3)
   {
      fill(c4);
      rect(xpos, ypos, w, h);
      fill(255);
      ellipse(xpos+27, ypos+20,5*lastAmp*0.6+8,h/2*lastAmp*0.6+8);
      ellipse(xpos+8, ypos+20,5*lastAmp*0.6+8,h/2*lastAmp*0.6+8);
   } 
   
   
  
    else if(i==4)
   {
      fill(c5);
      rect(xpos, ypos, w, h);
      fill(255);
      ellipse(xpos+27, ypos+20,5*lastAmp*0.6+8,h/2*lastAmp*0.6+8);
      ellipse(xpos+8, ypos+20,5*lastAmp*0.6+8,h/2*lastAmp*0.6+8);
   } 
   
    else if(i==5)
   {
      fill(c6);
      rect(xpos, ypos, w, h);
      fill(255);
      ellipse(xpos+27, ypos+20,5*lastAmp*0.6+8,h/2*lastAmp*0.6+8);
      ellipse(xpos+8, ypos+20,5*lastAmp*0.6+8,h/2*lastAmp*0.6+8);
   } 
   
    else if(i==6)
   {
      fill(c7);
      rect(xpos, ypos, w, h);
      fill(255);
      ellipse(xpos+27, ypos+20,5*lastAmp*0.6+8,h/2*lastAmp*0.6+8);
      ellipse(xpos+8, ypos+20,5*lastAmp*0.6+8,h/2*lastAmp*0.6+8);
   } 
   
 
 }
 
}

