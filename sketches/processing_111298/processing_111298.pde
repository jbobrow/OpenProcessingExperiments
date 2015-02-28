
void setup(){
  size (800,600);
  background(255,255,255);
}

void draw(){
  noStroke();
  smooth();
  ellipse(width/2,height/2,100,100);
  if (mouseX < width/2 ){
  fill(255,0,0);
  }else{
  fill(0,255,0);
}
}
