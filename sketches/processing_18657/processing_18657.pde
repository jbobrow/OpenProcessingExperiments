
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
  int xShift       = width/8;
  int yShift       = width/(13+(1/3));
  int xHalfShift   = xShift/2;
  int yHalfShift   = yShift/2;
  
  int speed         = 1;


//CONSTRUCTOR//////////////////////////////  
  Cube(float xCubeTemp,float yCubeTemp) {
  xCube  = xCubeTemp;
  yCube  = yCubeTemp;
}

//METHOD///////////////////////////////////
  void display() {
    noStroke();    
    fill(cubeTop);
    quad(xCube,yCube,xCube-xShift,yCube-yShift,xCube,yCube-yShift-yShift,xCube+xShift,yCube-yShift);
    fill(cubeLH,cubeLS,cubeLB);
    quad(xCube,yCube,xCube,yCube+yShift+yShift,xCube-xShift,yCube+yShift,xCube-xShift,yCube-yShift);
    fill(cubeRH,cubeRS,cubeRB);
    quad(xCube,yCube,xCube+xShift,yCube-yShift,xCube+xShift,yCube+yShift,xCube,yCube+yShift+yShift);
}
  void rise() {
    boolean rise = true;
    if(mousePressed && mouseX < xCube+xHalfShift && mouseX > xCube-xHalfShift && mouseY < yCube+yHalfShift && mouseY > yCube-yHalfShift ) {
      rise = !rise;
    }
    if (rise) {
      yCube = yCube - speed;
    }
    if (yCube < 0 - (yShift*3)) {
      yCube = height + (yShift*3);
    }
  }
    void drop() {
    boolean drop = false;
    if(mousePressed && mouseX < xCube+xHalfShift && mouseX > xCube-xHalfShift) {
      drop = !drop;
    }
    if (drop) {
      yCube = yCube + speed;
    }
    if (yCube > height + (yShift*3)) {
      yCube = 0 - (yShift*3);
    }
}
    




