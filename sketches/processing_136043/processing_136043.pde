
//import processing.opengl.*;

void setup() {
  //size(800,600,OPENGL);
  size(800,600,P3D);
  frameRate(60);
  
}

void draw() {
  background(255);
  stroke(120);
 
  translate(mouseX,mouseY); //moves the origin
  rotateX(frameCount *0.01);
  rotateY(frameCount *0.02);
  rotateZ(frameCount *0.03);
  scale(0.8);
  
  int num = 45; //local variable
  int spikes = mouseX / 10;
  
  float l1 = sin(frameCount * 0.1) * 20 + 40;
  for(int i = 0; i<num; i++){
    float l2 = sin(frameCount * 0.1 + TWO_PI / num * i * spikes) * 20 + 200;
  line(l1,0,l2 ,0);
  ellipse(l2, 0, 15,15);
  rotate(TWO_PI / num);
  }
 
}


