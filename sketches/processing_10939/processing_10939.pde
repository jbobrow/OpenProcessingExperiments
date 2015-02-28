
// The vast majority of this code is
// pure Java.  Download the applet
// to get the full code.

Board b;
int currentPac = 1, currentG = 0;
static int levelCompleteTime;
static namcap inst;
static int level = 1;

public namcap() {
  super();
  inst = this;
}

static void reset() {
  inst.setup();
  Board.lost = 0;
}

void setup() {
  frameRate(30);
  size(32 * 20, 24 * 20);
  smooth();
  currentPac = 1;
  currentG = 0;
  level = 0;
  b = new Menu(this);
}

void draw() {
  background(0);
  b.mouthClosed = (millis() % 1000 < 500);
  b.draw();
  if (b.next && levelCompleteTime == 0) {
    levelCompleteTime = millis();
  }
  if (b.next && (millis() - levelCompleteTime > 10000)) {
    if (currentG < 4) {
      currentG++;
    } else {
      currentPac++;
    }
    level++;
    levelCompleteTime = 0;
    textSize(60);
    b = new Board(this, currentPac, currentG, (17 - 1) * 20, (19 - 1) * 20, 17 * 20, 12 * 20);
  }
//  println(frameRate);
}

void mouseClicked() {
  b.mousePressed();
}

