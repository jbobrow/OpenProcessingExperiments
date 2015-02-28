
class Cube {
  
//FIELDS//////////////////////////////////
  //colors
  int cubeTop      = 0;
  float cubeLH     = random(0,359);
  float cubeLS     = 99;
  float cubeLB     = 99;
  float cubeRH     = cubeLH;
  float cubeRS     = cubeLS;
  float cubeRB     = cubeLB - 20;
  
  
  
  //cube
  float xCube;
  float yCube;
  float randomizer = random(.5,2);
  float xShift     = width/8 *randomizer;
  float yShift       = width/(13+(1/3))*randomizer;
  float xHalfShift = xShift/2;
  float yHalfShift   = yShift/2;
  
  float speed        = 1.5*randomizer;
  int newScore;


//CONSTRUCTOR//////////////////////////////  
  Cube(float xCubeTemp,float yCubeTemp) {
  xCube  = xCubeTemp;
  yCube  = yCubeTemp;
}

//METHODS///////////////////////////////////
  void display() {
    noStroke();    
    if (state == 0) {
    fill(cubeTop);
    quad(xCube,yCube,xCube-xShift,yCube-yShift,xCube,yCube-yShift-yShift,xCube+xShift,yCube-yShift);
    fill(cubeLH,cubeLS,cubeLB);
    quad(xCube,yCube,xCube,yCube+yShift+yShift,xCube-xShift,yCube+yShift,xCube-xShift,yCube-yShift);
    fill(cubeRH,cubeRS,cubeRB);
    quad(xCube,yCube,xCube+xShift,yCube-yShift,xCube+xShift,yCube+yShift,xCube,yCube+yShift+yShift);
    }
}
  
  void rise() {
    yCube = yCube - speed;
    if(mousePressed && mouseX < xCube+xHalfShift && mouseX > xCube-xHalfShift && mouseY < yCube+yHalfShift && mouseY > yCube-yHalfShift ) {
      yCube = width*3;
      score.display();
    }
  }
  
  void lost(){
    if (yCube <= 0 - (yShift*3)) {
      lost.display();
      println ("YOU HAVE LOST. YOUR FINAL SCORE IS " + startScore);  
      state = 1;
    }
  }
    
    
  
    
   void vanish() {
    if (yCube >= height*3-5){
      yCube = height*3;
    }
   }
  
}//END CLASS CUBE////////////////////////





