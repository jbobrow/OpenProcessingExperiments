
final float PHI = 1.618033988749894848204586834365;

void setup(){
  size(800, 800);
  background(0);
  noStroke();
}

void draw(){
  float x,y;
  for(int i = 0; i < 2000; i++){
    x = cos(PHI * i) * (i / 5) + width / 2;
    y = sin(PHI * i) * (i / 5) + height / 2;
    ellipse(x, y, i / 500.0 + 3, i / 500.0 + 3);
  }
}
