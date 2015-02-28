
// Learning Processing Exercise 10-4, extending "Rain Game."

// enums are cumbersome in P5/OpenProcessing
final int START = 0;
final int OVER = 1;
final int PLAYING = 2;
int gameState;

final int MAX_NUMBER_OF_DROPS = 1000;
final int FREQUENCY_IN_MILLISECONDS = 10;
Timer timer;
Catcher catcher;
Drop[] drops;
int totalDrops = 0;

int points = 10;
int backgroundShade = 200;

void setup() {
  size(400, 400);
  prepareGame();
  gameState = START;
}

void draw() {
  if (gameState == START) drawStartScreen();
  else if (gameState == PLAYING) play();
  else if (gameState == OVER) drawGameOver();
}

void drawStartScreen() {
  if (random(2) < .01) background(255); // occasional lightning
    else background(100);
  releaseDropIntermittently();
  drawAllDrops();
  // masthead and click prompt
  textSize(50);
  textLeading(60);
  fill(255, 50);
  text("Rain\nGame", width / 8, height / 8);
  textSize(20);
  text("Click to Play", width / 8, height - 40);
}

void play() {
  background(backgroundShade);
  catcher.setLocation(mouseX, mouseY);
  catcher.draw();
  checkForCaughtDrops();
  releaseDropIntermittently();
  drawAllDrops();
  drawScore();
}

void drawGameOver() {
  if (random(2) < .15) background(255); // occasional lightning
    else background(0);
  // masthead and click prompt
  textSize(140);
  textLeading(120);
  fill(255, 50);
  text("Game\nOver", 10, 180);
}

void prepareGame() {
  catcher = new Catcher(32);
  drops = new Drop[MAX_NUMBER_OF_DROPS];
  for (int i = 0; i < drops.length; ++i) {
    drops[i] = new Drop();
  }
  timer = new Timer(FREQUENCY_IN_MILLISECONDS);
  timer.start();
}

void releaseDropIntermittently() {
  if (timer.isFinished()) {
    drops[totalDrops] = new Drop();
    ++totalDrops;
    if (totalDrops >= drops.length) {
      totalDrops = 0;
    }
    timer.start();
  }
}

void drawAllDrops() {
  for (int i = 0; i < totalDrops; ++i) {
    drops[i].move();
    drops[i].draw();
  }
}

void checkForCaughtDrops() {
  for (int i = 0; i < totalDrops; ++i) {
    if (catcher.intersect(drops[i])) {
      drops[i].caught();
    }
    if (drops[i].reachedBottom()) {
      --points;
      backgroundShade -= 20;
    }
  }
  if (points <= 0) gameState = OVER;
}

void drawScore() {
  pushStyle();
  stroke(255, 255, 0);
  fill(200, 200, 0);
  ellipse(0, 0, 10 * points, 10 * points);
  popStyle();
}

void mouseReleased() {
  if (gameState == START) {
    timer = new Timer(2000);
    totalDrops = 0;
    gameState = PLAYING;
  }
}

class Catcher {

  float r;
  float x;
  float y;

  Catcher(float r) {
    this.r = r;
    x = 0;
    y = 0;
  }

  Catcher(float x, float y, float r) {
    this.r = r;
    this.x = x;
    this.y = y;
  }

  void setLocation(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void draw() {
    stroke(0);
    fill(175);
    ellipse(x, y, r * 2, r * 2);
  }

  boolean intersect(Drop drop) {
    return dist(x, y, drop.x, drop.y) < r + drop.r;
  }

}

class Drop{

  static final int DEFAULT_RADIUS = 8;
  float x;
  float y;
  float speed;
  color c;
  float r;

  Drop() {
    r = DEFAULT_RADIUS;
    x = random(width);
    y = r * -4;
    speed = random(1, 5);
    c = color(50, 100, 150);
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y > height + r * 4) {
      caught();
      return true;
    } else return false;
  }

  void caught() {
    speed = 0;
    y = -1000;
  }

  void draw() {
    fill(c);
    noStroke();
    for (int i = 2; i < r; ++i) {
      ellipse(x, y + i * 4, i * 2, i * 2);
    }
  }

}

class Timer {

  int startTime;
  int totalTime;

  Timer(int totalTime) {
    this.totalTime = totalTime;
  }

  void start() {
    startTime = millis();
  }

  boolean isFinished() {
    return (millis() - startTime > totalTime);
  }

}
