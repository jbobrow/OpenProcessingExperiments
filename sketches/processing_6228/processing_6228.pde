
class Mochi {
  


PShape mochi1;
float x, y;
int id;
  
  Mochi(int idTemp) {
    id = idTemp;
  
  mochi1 = loadShape("rawmochifull3.svg");
   
  }
  
  
  void display (float xin, float yin) {
    float dx = xin - x;
    float dy = yin - y;
    float angle = atan2(dy, dx);  
    x = xin - cos(angle) * 20;
    y = yin - sin(angle) * 20;
    shapeMode(CENTER);
    pushMatrix();
    translate(x, y);
    rotate(angle);
    shape(mochi1, 0, 0, 30, 50);
    popMatrix();
    
  }

}

 
  
 

