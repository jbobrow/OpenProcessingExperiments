
void setup(){
  size(500,500);
  background(0,0,0);
}
void draw(){
  float x1=random(width);
  float x2=random(height);
  strokeWeight(20);
  stroke(250,200,0,40);
  line(x1,0,x2,height);
}
