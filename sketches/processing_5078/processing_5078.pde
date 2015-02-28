
class BounceBox {
  float radius = 0;
  float bsize = 10;
  float zrot = 0;
  float yrot = 0;
  int turn = 0;
  boolean goback=false;  
  
  String myString="FLYING MONKEYS CO.";
  
  float noiseNum = 0;
  float centreX = random (-10, 10);
  float centreY = random (-10, 10);
  
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
   
    pushMatrix();
      noStroke();
      fill(0);
      textFont(myFont);
      textSize(200);
      text( myString,  +turn,0, 100*(turn+1));
      text( myString,  +turn,0, 100*(turn+2));
      text( myString,  +turn,0, 100*(turn+3));
      text( myString,  +turn,0, 100*(turn+4));
      
      noFill();
      stroke(210+random(-5,40),random(-10,20),random(0,20), 100);
      strokeWeight(10);
      ellipse(centreX,centreY, 1000-40*turn, 1000-8*turn);
      
      
      
   
      
    popMatrix();
    if (turn==-1) {goback=false;}
    if (turn==200) {goback=true;}
  }
}

