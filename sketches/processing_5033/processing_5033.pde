
class Planets {
  
  float radius = 0;
  float bSize = 10;
  float zRotate = 0;
  float yRotate = 0;
  
  Planets() {
    
  };
  
  void update() {
    //rotate at a constant speed along the z-axis
    zRotate+=bSize/1000; //using the size of the box to determine its speed
  };
  
  void draw() {
    //Draw the box
    pushMatrix();
    rotateZ(zRotate);
    rotateY(yRotate);
    translate(radius,0);
    sphere(bSize);
    popMatrix();
  };
  
};

