
class BounceBox {
  
  float radius = 0;
  float bsize = 10;
  float zrot = 0;
  float yrot = 0;
  
  BounceBox() {
    
  }
  
  void update() {
    yrot -= 0.01;
    zrot += 0.005;
  }
  
  void draw() {
   pushMatrix();
   rotateZ(zrot);
   rotateY(yrot);
   translate(radius, 0);
   box(bsize);
   popMatrix();
   
  }
  
}

