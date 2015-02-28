
void setup () {
  size(640, 480, P3D);
  frameRate(20);
}

void draw () {
  background(0);
  
  translate(200, 110, 0);
  for (int i=0; i < 16; i++) {
    noStroke();
    fill(255, 0, 0, 50);
    rotateY(random(PI));
    translate(1, 1, -2 * width/60 * second());
    box(100, height, 100);
  }
  
  fill(255, 255, 0);
  textSize(320);
  textAlign(CENTER);
  text(second(), width/2, height-20, 0);
}

