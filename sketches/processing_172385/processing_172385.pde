
float theta = 0.0;

void setup(){
  size(200,200,P3D);  //declare size and 3d mode
}//setup

void draw(){
  background(255);
  stroke(0);
  fill(175, 98, 10);
  
  translate(width/2, height/2);  //translate point of origin
  rotateY(theta);  //rotate on Z axis
  rectMode(CENTER);
  rect(0,0,100,100);
  
  theta += 0.02;
}//draw
