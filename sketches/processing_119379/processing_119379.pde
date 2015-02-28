
Roots[] tree = new Roots[10];
void setup() {
  size(600, 300);
  for (int i = 0; i < tree.length; i++ ) {
    tree[i] = new Roots( random(width) );
  }
}

void draw() {
  background(random(0), random(70), random(0));
  for (int i = 0; i<tree.length; i++ ) {
    tree[i].update();
    tree[i].draw();
  }
}

class Roots {
  float y;
  float x;
  float ySpeed;
  float gravity;

  int lastDrop;
  int dropRate; 
  int blue;
  int lastTimeIChanged;
int changeInterval = 3000; 


  Roots(float tempx) {
    y = 0;
    ySpeed = 0;
    gravity = 1.5;
    x = tempx;
    lastDrop = millis();
    dropRate = 500 + int(random(500));
    blue = int(random(255));
  }
  void draw() {

    noStroke();
    fill(147, 146, 142);
    rect(0, 250, width, height);

    noStroke();
    fill(153, 236, 245);
    ellipse(x, y, 5, 12);

    fill(167, 91, 51);
    float secondMap = map(second(), 0, 40, 0, width );
    ellipse(secondMap, 280, 30, 15);
    
  }
  void update() {
    ySpeed += gravity;
    y += ySpeed;
    if (millis()-lastDrop > dropRate) {
      reset();
      lastDrop = millis();
    }
  }
  void reset() {
    y = 0;
    ySpeed = 0;
  }
}



