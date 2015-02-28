


void setup() {
  size(500,500);
  frameRate(5);
}
void draw(){
  float distance = random(100,400);
  float posY1 = random(-10,10);
  float posY2 = random(-10,10);
  background(0);
  stroke (255);

  line ( 0, distance+posY1, 499,distance + posY2 );
}

