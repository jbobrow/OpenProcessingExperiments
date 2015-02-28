
void setup() {
  size(300, 300);

  background(0);

  smooth();
}

float t;

void draw() {
  noStroke();

  fill(0, 80); 
  rect(0, 0, width, height);

  fill(255, 0, 70);
  heart(width/2, height/2, 200-50*sin(t/2), 180-50*sin(t/2));

  filter(BLUR, 4);
  t++;
}

//http://blog.p5info.com/?p=28

void heart(float centerX, float centerY, float width, float height) {
  final float WIDTH = width / 2 * 0.85;
  final float HEIGHT = height / 2;
  final float OFFSET = centerY - (HEIGHT / 6 * 5);
  beginShape();
  for (int i = 0; i < 30; i++) {
    float tx = abs(sin(radians(i * 12))) * (1 + cos(radians(i * 12))) * sin(radians(i * 12)) * WIDTH + centerX;
    float ty = (0.8 + cos(radians(i * 12))) * cos(radians(i * 12)) * HEIGHT + OFFSET;
    vertex(tx, ty);
  }
  endShape(CLOSE);
}


