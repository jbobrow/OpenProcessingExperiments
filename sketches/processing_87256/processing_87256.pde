
float r = random(255);
float g = random(255);
float b = random(255);
float angle = 0.0;
float speed = 0.05;
float scaleX = 2.0;
float scaleY = 1.5;
float v = 0.0;
float inc = 0.3;

void setup() {
  size (500, 500);
  smooth();
}

void draw() {
  background(0);
  float n = map(sin(v), -1, 1, 50, 150);
  v += inc;
  
  for (int y=0; y<height; y+=15) {
    for (int x=0; x<width; x+=15) {
      float p = noise(x/50.0, y/25.0) * (random(10));
      stroke(random(0, 150), random(50, 100));
      fill(random(255), random(255), random(255));
      rect(x+p, y+p*n, random(10), random(10));
      //r = r + random(-50, 50);
      //g = g + random(-50, 50);
      //b = b + random(-50, 50);
    }
  }

  float x = random(250) + cos(angle) * 150;
  float y = random(200) + sin(angle) * 150;

  x += cos(angle * scaleX) * 100;
  y += cos(angle * scaleY) * 100;
  fill(random(255), random(255), random(255));
  rect(x, y, 20, 20);

  angle += speed;
}
