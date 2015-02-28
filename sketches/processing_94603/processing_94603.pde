
void setup(){
  size(400,400);
  background(255);
  smooth();
  noFill();
  frameRate(10);
}
void draw(){
  strokeWeight(random(50));
  stroke(random(255),random(255),random(255),150);
  bezier(0,height/2+random(-100,100),width/4,random(height),3*width/4,random(height),width,random(height));
  if(mousePressed){
  noLoop();
  }
}
