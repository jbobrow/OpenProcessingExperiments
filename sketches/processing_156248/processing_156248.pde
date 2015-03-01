
void setup(){
  size(400, 400); 
  fill(255);
rect(0,0,width,height);
  frameRate(3000);
}

void draw(){
  pushMatrix();
  fill(0,0,0);
  stroke(0,50);
  strokeWeight(1);
  translate(width/2+sin(frameCount/50.0)*150, width/2+sin(frameCount/49.7)*150);
  rotate(radians(frameCount));
  point(0,0);
 // println(frameCount);
  popMatrix();
  fill(255,0,0,0.01);
  rect(0,0,width,height);
  
}
