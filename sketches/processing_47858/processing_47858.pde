
void setup() {
  size(100, 100, P3D);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rotateY(frameCount*PI/60);
  box(40, 30, 20); // 幅, 高さ, 奥行きの順。引数を1つにすると立方体になる。
}

