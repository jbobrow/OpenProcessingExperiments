
//create object Raios
class Raios{
float x;
float y; 
int units; 
float angle;

Raios(){
// rayos(x, y, units, angle); 

}

void create(float angle,int orix, int oriy){
  for (int i = 0; i < 8; i++) { 
     rayos(orix,-oriy/2, 7, angle); 
     rotate(PI/4); 
   }
}
  
  void rayos(float x,float y, int units, float angle) { 
  pushMatrix(); 
  translate(x, y); 
   for (int i = units; i >=0; i--) { 
      fill(170,15,18);
      line(0,0,0,-100);
      text("BYTE",0,0);
      translate(0, -100); 
      rotateY(angle*2);
      rotateZ(angle);
   } 
     popMatrix(); 
 } 

}

