
void setup() {
  size(600,600);
  frameRate(85);
}
void draw(){
  background(0);
  stroke (255,0,0);
  line ( 0, (random(100,400)), 599, (random(100,400)) );
}

