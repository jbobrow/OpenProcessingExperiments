
class BounceBox {
  
  float radius = 10;
  float bsize = 10;
  float zrot = 110;
  float yrot = 10;
 
  BounceBox() {
 
    
  };
  
  void update() {
    zrot += bsize/150;
  };
  
  void draw() {
    //Draw the box
    pushMatrix();
      rotateZ(zrot);
      rotateY(yrot);
      translate(radius,6);
      box(bsize);
    popMatrix();
    
  };
  
};

