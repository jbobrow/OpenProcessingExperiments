
void setup(){
  size(400,400,P3D);
}

void draw(){
  background(0);
  lights();
  camera(0,-height,-100,width/2,height/2,-200,0,1,0);
  translate(width/2,height/2,-200);
  fill(252,120,18);
  sphere(80);
  
  
  pushMatrix();
  rotateY(frameCount * PI/2 * 0.005);
  translate(200,0,0);
  fill(32,108,10);
  sphere(30);
  
  pushMatrix();
  rotateY(frameCount* PI * 0.015);
  translate(50,0,0);
  fill(188,214,224);
  sphere(10);
  popMatrix();
  popMatrix();
  
  pushMatrix();
  noStroke();
  rotateY(frameCount*PI/4 * 0.005);
  translate(350,0,0);
  fill(100);
  sphere(50);
  
  pushMatrix();
  rotateY(frameCount * PI/3 * 0.015);
  translate(75,0,0);
  fill(225,0,0);
  sphere(15);
  popMatrix();
  popMatrix();
  
}
  
  
  

