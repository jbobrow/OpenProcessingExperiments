
void setup() {
  size(300, 300);
  colorMode(RGB, 100);
  smooth();
}

void draw() {
  background(100);
  translate(width/2, height/2); // 原点を画面の中心に平行移動

  stroke(50);
  line(0, -height/2, 0, height/2); // 虚軸
  line(-width/2, 0, width/2, 0);   // 実軸
  noFill();
  ellipse(0, 0, 200, 200);
  float x = mouseX- width/2;
  float y = mouseY- height/2;
  float rx = x*100/dist(0, 0, x, y);
  float ry = y*100/dist(0, 0, x, y);

  // 元
  fill(0, 0, 100);
  noStroke();
  stroke(0, 0, 100);
  ellipse(rx, ry, 5, 5);
  line(0, 0, rx, ry);

  // 逆元
  fill(100, 0, 0);
  stroke(100, 0, 0);
  ellipse(rx, -ry, 5, 5);
  line(0, 0, rx, -ry);
}
