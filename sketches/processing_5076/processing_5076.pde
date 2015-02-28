
class BounceBox {
  float radius = 0;
  float bsize = 10;
  float zrot = 0;
  float yrot = 0;
  int turn = 0;
  boolean goback=false;  

  float noiseNum = 0;
  float centreX = random (-300, 300);
  float centreY = random (-300, 300);
  
  //functiona declaration
  BounceBox(){
  };
  
  void update() {
     //zrot =zrot+0.01;
     //yrot =yrot+0.03;
     
     
     if (goback==false) {turn++;} else {turn--;}
  }
  
  void draw() {
    //Draw the box.
    float radius =noise(noiseNum) *180;
    noiseNum = noiseNum+random(-0.03,0.01);
    noStroke();
    fill(210+random(-50,50),random(-10,20),random(0,20));
    pushMatrix();
      rotateZ(zrot);
      rotateX(yrot);
      translate(centreX, centreY);
      sphere(radius);
      stroke(210+random(-50,50),random(-10,20),random(0,20));
      strokeWeight(5);
      noFill();
      
      ellipse(centreX,centreY, 1*turn, 0.2*turn);
      ellipse(centreX,centreY, 10*turn, 2*turn);
    popMatrix();
    if (turn==-1) {goback=false;}
    if (turn==200) {goback=true;}
  }
}

