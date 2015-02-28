
int z;
void setup(){
  size(500,500);
  background(0);
  smooth();
  strokeWeight(0.3);
  stroke(255);
}
void draw () {
  z = (int)random(200,300);
  for (int x=0; x<500; x=x+5) {
  line(z,0,x,500-x%30);
  delay(5);
  }
}

