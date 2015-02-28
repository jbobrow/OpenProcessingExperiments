

class Raios{
float x;
float y; 
int units; 
float angle;

Raios(){
 rayos(x, y, units, angle); 
}
  
  void rayos(float x,float y, int units, float angle) { 
  pushMatrix(); 
  translate(x, y); 
 for (int i = units; i > 0; i--) { 
    strokeWeight(i/2); 
    stroke(255,192,15,25);//color de los rayos de sol 
    line(0, 0, 0, 1000); //era 4
    strokeWeight(i/2); 
     line(0,0,4,0); //era 4
    translate(0, -4); 
    rotate(angle); 
  } 
   
    popMatrix(); 
} 
}

