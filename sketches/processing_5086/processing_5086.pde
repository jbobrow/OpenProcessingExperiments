
class BounceBox {
  
  float radius = 0;
  float bsize = 10;
  float zrot = 0;
  float yrot = 0;

  BounceBox() {
    
  };
    
    
    void update() {
      zrot += bsize/10000;
      
    };
    
    void draw() {
      //draw the box
        fill (200,200,200);
      pushMatrix();
      rotateZ(zrot);
      rotateY(yrot);
      translate(radius,0);
      box(bsize);
      popMatrix();
    };
};
  

