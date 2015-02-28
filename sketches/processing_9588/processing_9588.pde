
class Cube {
  
  float x,y,z;
  
  Cube(){
  }
  
  void create(float x_, float y_, float z_){
    x = x_;
    y = y_;
    z = z_;
    
  pushMatrix();
  translate(x, y, z);
  box(50,50,50);
  popMatrix();
  }
}


