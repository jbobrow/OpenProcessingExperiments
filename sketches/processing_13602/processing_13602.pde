
void setup() {
  size(240, 240);
  frameRate(1);
  smooth();
}

void draw() {
  background(204);
  noStroke();
  ellipse (120, 120, 200, 200);
  int s = second();
  int m = minute();
  int h = hour();
  stroke(0);
  strokeWeight(4);
  line(120, 120 , 60*cos((h + m/60.0) % 12 * TWO_PI / 12 - HALF_PI) + 120, 60*sin((h + m/60.0) % 12 * TWO_PI / 12 - HALF_PI) +120); //時針の描画
  strokeWeight(2);
  line(120, 120 , 80*cos((m + s/60.0) * TWO_PI / 60 - HALF_PI) + 120, 80*sin((m + s/60.0) * TWO_PI / 60 - HALF_PI) +120); //分針の描画
  strokeWeight(1);
  line(120, 120 , 90*cos(s * TWO_PI / 60 - HALF_PI) + 120, 90*sin(s * TWO_PI / 60 - HALF_PI) +120); //秒針の描画
}                               
