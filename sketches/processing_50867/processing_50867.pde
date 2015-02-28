
PImage ima;
PImage ima2;

class pos
{
  float x, y;

  pos()
  {
  }

  pos( float tx, float ty)
  {
    x = tx;
    y = ty;
  }
}

class Flying {
  pos pos1 = new pos();
  float speed;
  float Flysize;

  Flying( pos p1)
  {
    pos1 = p1;
  }

  Flying(float x1, float y1, float ts, float s) {
    pos1.x = x1;
    pos1.y = y1;
    speed=ts;
    Flysize=s;
    ima=loadImage("fly.png");
  }

  void move() {
    pos1.x += speed;
    pos1.y += speed;
  }

  void bounce() {
    if ((pos1.x >= width) || (pos1.x <= 0)) {
      speed = speed * -1;
    }
    if ((pos1.y >= height) || (pos1.y <= 0)) {
      speed = speed * -1;
    }
  }

  void display() {
    image(ima, pos1.x, pos1.y, Flysize, Flysize);
  }
}

class hand {
  float hx;
  float hy;
  float hs;

  hand(float thx, float thy, float ths) {
    hx = thx;
    hy = thy;
    hs = ths;
    ima2=loadImage("hand1.png");
  }
  void wave() { 
    image(ima2, hx, hy);
    hx += hs;
    if (( hx > (width-400)) || (hx < 0)) {
      hs = hs * -1;
    }
  }
}

Flying[] flyinglist = new Flying[100];
int flyingCount;
hand myhand;

void setup() {
  size(800, 500);
  pos new_pos1 = new pos(100, 100);
  flyingCount = 0;

  myhand = new hand(0, 120, 8);
  for (int i=0; i < 3; i++) {

    flyinglist[i] = new Flying( random(width), random(height), 8, 20);

    flyingCount++;
  }
  println(flyingCount);
}

void draw() {
  background(197, 220, 222);
  myhand.wave();
  for (int i=0; i < flyingCount; i++) {
    flyinglist[i].move();
    flyinglist[i].bounce();
    flyinglist[i].display();
  }
}

int value = 0;

void mouseClicked()
{
  if (value == 0) {

    Flying newFlying = new Flying( mouseX, mouseY, 8, 20);

    flyinglist[flyingCount] = newFlying;
    flyingCount++;
  } 

  println(flyingCount);
}


