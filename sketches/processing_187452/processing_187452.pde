
void setup(){
size(1000, 1000);
background(12,52,5);
noSmooth();
noStroke();
frameRate(6.3);
}

void draw() {
  //background(random(50, 255),random(50, 255),random(50, 255));
  for (int y=50; y<=height-50; y+=25) {
    for (int x=50; x<=width-50; x+=25) {
      fill(random(0, 255),random(50, 72),random(50, 60));
      ellipse(x, y, x/2, y/2);
    }
  }
}
