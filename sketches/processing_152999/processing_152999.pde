
void setup() {
  frameRate(2);
  size(640,480);
}

void draw() {
  //
  background(random(255), random(255), random(255));
  //
  for(int y=0; y<height; y+=20) {
    for(int x=0; x<width; x+=20) {
      line(x,y,mouseX,mouseY);
      stroke(random(255), random(255), random(255));
    }
  }
}

void mousePressed() {
  //
  saveFrame("myGrabs/grabb####.png");
}


