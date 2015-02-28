
void setup() {
  size(240,240);
}

void draw() {
  background(255);
  stroke(0,0,0);
  line(0,0,60,hour());
  line(0,0,120,minute());
  stroke(255,0,0);
  line(0,0,180,second()); 
}

