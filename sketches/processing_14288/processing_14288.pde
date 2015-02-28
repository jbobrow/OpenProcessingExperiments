

class Raios{
float x;
float y; 
int units; 
float angle;

  Raios(){
  // rayos(x, y, units, angle); 
 }
  
  void rayos(float x,float y, int units, float angle) { 
  pushMatrix(); 
  translate(x, y); 
 for (int i = units; i > 0; i--) { 
    strokeWeight(4*i/4);  
     fill(159,21,178,50);
     ellipse(0,0,5,5);
     stroke(24,20,178,50);
     line(0,0,0,-100);
     translate(0, -100); 
     rotate(angle); 
     rotateX(10);
   }
     popMatrix(); 
 } 

}

