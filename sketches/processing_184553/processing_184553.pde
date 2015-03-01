
void setup() {
  size(640, 640);
  fill(255, 125, 0, 125);
  stroke(255, 125, 0);
}

void draw() {
  background(40);

  translate(width/2, height/2);

  for (int i = 0; i < 360; i+=36) {
    float x = sin(radians(i));
    float y = cos(radians(i));
    float x2 = sin(radians(i+36));
    float y2 = cos(radians(i+36));

    float d = 150+sin(radians(i+frameCount*3))*75;

    makeShape(x, y, x2, y2, new PVector(-x*d, -y*d), d);
    makeShape(-x, -y, -x2, -y2, new PVector(x*d, y*d), d);
  }
}

void makeShape(float x, float y, float x2, float y2, PVector loc, float d) {
  beginShape();
  vertex(loc.x+x, loc.y+y);
  vertex(loc.x+x2, loc.y+y2);
  vertex(loc.x+x2*d, loc.y+y2*d);
  vertex(loc.x+x*d, loc.y+y*d);
  endShape(CLOSE);
}



