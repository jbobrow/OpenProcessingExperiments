
Catcher catcher;
Drops[] drop;
Timer timer;
int level = 1;
int pos_score = 0;
int neg_score = 10;
int totalDrops = 0;
PImage wallpaper;
import ddf.minim.*; 
AudioPlayer player;
Minim minim; 


void setup() {
  size (500, 500);
  catcher = new Catcher(15);
  drop = new Drops[1000];
  timer = new Timer(random(300, 1000));

  wallpaper = loadImage("wallpaper.jpg");
  minim = new Minim(this);
  player = minim.loadFile("dora.mp3", 2048);
  player.play();
}

void draw() {
  background (wallpaper);
  catcher.setLocation(mouseX, mouseY);
  catcher.display();

  if (timer.isFinished()) {
    drop[totalDrops] = new Drops(random(5, 10));
    totalDrops++;
    if (totalDrops>= drop.length) {
      totalDrops = 0;
    }
    timer.start();
  }

  for (int i = 0; i < totalDrops; i++) {
    drop[i].fall();
    drop[i].display();
    drop[i].score();

    if (catcher.intersect(drop[i])) {
      drop[i].caught();
    }

    drop[i].offScreen();
  }
  if (pos_score == 50) {
    level++;
    pos_score = 0;
    println("level "+level);
    neg_score = 10;
  }
}









class Catcher {
  float r;
  float x, y;
  PImage img;

  Catcher (float tempR) {
    r = tempR;
    x = 0;
    y = 0;
  }

  void setLocation (float tempX, float tempY) {
    x = tempX;
    y = tempY;
    img = loadImage("muis.png");
  }

  void display() {

    image(img, mouseX, mouseY, 35, 35);
  }


  boolean intersect(Drops d) {
    float distance = dist(x, y, d.x, d.y);
    if (distance < r + d.r) {
      return true;
    } 
    else {
      return false;
    }
  }
}

class Drops {
  float r;
  float x, y;
  float speed;

  Drops (float tempR) {
    r = tempR;
    x = random(width);
    y = 0;
    speed = random(2, 3);
  }

  void fall() {
    y += speed*level;
  }



  void display() {
    ;
    noStroke();
    fill(100, 255, 255);
    ellipseMode(CENTER);
    for (int i = 1; i < r; i++) {
      ellipse(x, y+i*2, i*2, i*2);
    }
  }

  void caught() {
    speed = 0;
    x = -1000;
    pos_score++;
    println(pos_score);
  }
  void offScreen() {
    if (y > height+4) {
      neg_score--;
      x = -1000;
      speed = 0;
      y = 50;
    }
  }


  void score() {
    int y = 30;
    if (neg_score > 0) {
      for (int i = 0; i < neg_score; i++) {
        fill(211, 0, 0);
        noStroke();
        ellipse(30, y, 20, 20);
        y = y + 30;
      }
    }
    else {
      println("you lose.");
      exit();
    }
  }
}

class Timer {

  int savedTime;
  float totalTime;

  Timer (float tempTotalTime) {
    totalTime = tempTotalTime;
  }

  void start() {
    savedTime = millis();
  }

  boolean isFinished() {
    int passedTime = millis() - savedTime;
    if (passedTime > totalTime) {
      return true;
    } 
    else {
      return false;
    }
  }
}



