
void setup() {
  size(500,500);
  frameRate(75);
}
void draw(){
  background(0);
  stroke (255);
  line ( 0, (random(230,270)), 499, (random(230,270)) );
}
