
void setup() {
  size(250, 250);
  frameRate(60);
}

void draw() {
  background(255);
  stroke(0);
  fill(200);
  
  for(int i=0; i<90; i+=3){
    float offset = sin(radians(i))*40;
    point(10+sin(radians(i))*50, 10+cos(radians(i))*50);
    ellipse(width/2, height/2 + offset, cos(radians(i))*200, cos(radians(i))*200);
  }
}
