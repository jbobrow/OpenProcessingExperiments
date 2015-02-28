
class BounceBox {
  
  float radius = 10;
  float bsize = 10;
  float zrot = 0;
  float yrot = 10;
  
  BounceBox() {
    
  };
  
  void update() {
    zrot += bsize/100;
  };
  
  void draw() {
    //Draw the box
    pushMatrix();
      rotateZ(zrot);
      rotateY(yrot);
      translate(radius,60);
      box(bsize);
    popMatrix();
    
  };
  
};

