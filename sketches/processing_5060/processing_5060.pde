
class BounceBox {
  float radius = 0;
  float bsize = 10;
  float zrot = 0;
  float yrot = 0;
  int turn = 0;
  
  //functiona declaration
  BounceBox(){
  };
  
  void update() {
     zrot =zrot+0.01;
     yrot =yrot+0.03;
     turn++;
  }
  
  void draw() {
    //Draw the box.
    pushMatrix();
      rotateZ(zrot);
      rotateX(yrot);
      translate(10*radius+150, 100*cos(PI*radius/10-turn/10)+150);
     
      box(bsize);
       
    popMatrix();
  }
}

