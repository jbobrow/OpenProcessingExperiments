
float x = 0;
float y = 0;

float hs = random(0.5, 1.2);
float c = random(36);

void setup() {
  size(300, 400);
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 0);
  smooth();

  x = random(hs*50, width-hs*50);
}

void draw() {
  noStroke();

  fill(0, 0, 0, 90);
  rect(0, 0, width, height);

  pushMatrix();
  translate(x, y);
  scale(hs);
  strokeWeight(3);
  stroke(0, 0, 100);
  fill(c*10, 80, 100, 200);
  rotate(0.7*sin(y*0.03));
  heart(0, 0, 100, 100);
  popMatrix();

  filter(BLUR, 2);

  y += 5;

  if (y > height+hs*100) {
    y = 0;

    hs = random(0.5, 1.2);
    x = random(hs*50, width-hs*50);
    c = random(36);
  }
}

//***************************************
// I referred to Proce55ing.walker,blog
// http://blog.p5info.com/?p=28
//***************************************

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


