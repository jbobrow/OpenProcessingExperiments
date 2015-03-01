
void setup(){
  size(500,500);
  background(0);
}
void draw(){
    float x=random(500);
  float y=random(500);
  float z=random(255);
  float q=random(255);
  float t=random(255);
  frameRate(50);
  strokeWeight(3);
  stroke(z,q,t);
  line(x,0,y,500);
}
