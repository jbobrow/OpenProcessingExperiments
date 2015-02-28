
class Beam{
  float xloc1; 
  float yloc1; 
  float xloc2; 
  float yloc2;
  float xDir; 
  
  Beam(float txloc1, float tyloc1,float txloc2, float tyloc2, float xDir1){
    xloc1 = txloc1;
    xloc2 = txloc2; 
    yloc1 = tyloc1;
    yloc2 = tyloc2; 
    xDir = xDir1;
  }
  
  void display(){
    pushMatrix(); 
    strokeWeight(10); 
    strokeCap(SQUARE); 
    stroke(200, 0, 255); 
    line(xloc1, yloc1, xloc2, yloc2); 
    popMatrix();
  }
  
  void move(){
    xloc2+=  xDir;
  }
}


