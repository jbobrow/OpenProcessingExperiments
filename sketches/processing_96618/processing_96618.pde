
class snail {
  PVector location;
  PVector startP;
  PVector endP;
  color Scolor;
  int maxSize = 10;
  int minSize = 5;
  float size = 0;
  float statue = 0;
  float angle = 1;

  snail() {
    location = new PVector(0, 0);
    startP = new PVector(0, 0);
    endP = new PVector(0, 0);
    color Scolor = color(0.0, 0.0, 0.0);
    float statue = 0;
  }

  snail(float x, float y) {
    startP = new PVector(0, 0);
    location = new PVector(x, y);
    endP = new PVector(0, 0);
    size = random(minSize, maxSize);
  }
  void display() {
    pushMatrix();
    translate(location.x, location.y);
    stroke(Scolor);
    line(startP.x, startP.y, endP.x, endP.y);
    popMatrix();
  }
  void reColor() {
    Scolor = color(random(255));
  }
  void move() {
    float dx = cos(radians(angle));
    float dy = sin(radians(angle));
    startP.x = statue * dx;
    startP.y = statue * dy;
    endP.x = (statue + size) * dx;
    endP.y = (statue + size) * dy;
    statue = statue + 0.01;
    angle = angle + 0.5;
    size = size + 0.01;
  }
}
int caught;
int h;
snail[] Snail = new snail[12];
snail[] dateSnail = new snail[4];
void setup() {
  frameRate(3600);
  size(800, 800);
  background(0);
  caught = 0;
  for (int i = 0; i < 12; i++) {
    float dx = cos(radians(30 * i - 60));
    float dy = sin(radians(30 * i - 60));
    Snail[i] = new snail(width / 2 + 300 * dx, height / 2 + 300 * dy);

    dateSnail[0] = new snail(width, height);
    dateSnail[1] = new snail(0, 0);
    dateSnail[2] = new snail(0, height);
    dateSnail[3] = new snail(width, 0);
    for (int j = 0; j < 4; j++) {
      dateSnail[j].size = 500;
      dateSnail[j].statue = 80;
    }
  }
}
void draw() {
  println(frameCount);
  if (caught == 0) {
    h= hour() % 12;
    for (int i = 0; i < h - 1; i++) {
      Snail[i].move();
      Snail[i].display();
    }
    if (frameCount == 3600) {
      caught = 1;
    }
  }
  if (caught == 1) {
    h= hour() % 12;
    int s = minute() * 60 + second();
    Snail[h-1].move();
    Snail[h-1].display();
    if (frameCount == 3600 + s) {
      caught = 2;
    }
  }
  if (caught == 2) {
    frameRate(1);
    h= hour() % 12;
    Snail[h-1].move();
    Snail[h-1].display();
  }
  for (int j = 0; j < 4; j++) {
    dateSnail[j].move();
  dateSnail[j].display();
}




if (frameCount % 60 == 0) {
  for (int i = 0; i < 12; i++)
    Snail[i].reColor();
  for (int j = 0; j < 4; j++)
    dateSnail[j].reColor();
}
}
