

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
     translate(0, -100); 
     rotate(angle); 
     rotateX(10);  
     rotateY(3*angle);


noFill();
stroke(209, 91, 17);
line(30, 5, 80, 5);
line(80, 75, 30, 75);
line(30,5,30,75);
line(80,5,80,75);
stroke(208,209,21);
bezier(30, 5,  90, 0,  80, 75,  30, 75);

   }
     popMatrix(); 
 } 

}

