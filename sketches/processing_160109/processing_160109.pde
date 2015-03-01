
void setup(){
  size(400,400);
  fill(250);
}


void draw(){
  float x1=random(width);
  float x2= random(width);
  strokeWeight(0); // thicker
  line(20, 200, 45, 30);
  fill(100,270,90);
  
  line(x1, 0, x2, height);
}
