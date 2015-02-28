
void setup() {
  size(350, 350);
  hazme();
}

void keyPressed() {
  if (keyCode==ESC) return;
  if (key==' ') save("foto.png");
  filter(POSTERIZE, 7);
}

void keyReleased() {
  hazme();
}

void hazme() {
  background(127);
  noStroke();
  smooth();
  pushMatrix();
  translate(width/2, height/2);
  float opaco = 30;
  for (int i=0; i<10; i++) {
    rotate(radians(5));
    fill(255, opaco);
    ellipse(0-10, 0, 280, 300);
    fill(0, opaco);
    ellipse(0+10, 0, 280, 300);
    fill(255, opaco);
    arc(0-10, 0, 280, 300, 0, PI);
    fill(127);
    ellipse(0, 0, 280, 280);
  }
  popMatrix();
}

void mousePressed() {
  float multi=.003;
  for (int x=0; x<width; x++) {
    for (int y=0; y<height; y++) {
      fill(noise(x*multi, y*multi)*255,4);
      ellipse(x, y,30,30);
    }
  }
}

void mouseReleased(){
  hazme();
}

void draw() {
}

void stop(){
  super.stop();
}
