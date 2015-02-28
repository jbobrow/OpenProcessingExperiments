
float x = 0;
void setup() {
  size(400,400);
}

void draw() {
  float b = random(0,255);
  stroke(b,b,b);
  strokeWeight(3);
  background(0);
for(float a=random(1,350); a>0; a=(a-0.5)%0){
    line(10,150,a,a);
    line(150,10,a,a);
  }
}               
