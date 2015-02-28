
//import processing.opengl.*;



Boolean gravBol;

void setup(){
  //size(600,600,OPENGL);
  size(600,600,P3D);
  initCubos();
}

void draw(){
  background(0);
  pointLight(51, 102, 255, 65, 60, 100); 
  pointLight(200, 40, 60, -65, -60, -150); 
  ambientLight(50, 20, 100); 
  runCubos();
  renderCubos();
  renderCaja();
}






