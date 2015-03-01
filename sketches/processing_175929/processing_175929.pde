
Lover s, sq;
Timer t1, t2;

boolean panic = false;

void setup() {
  size(480, 600);
  s = new Lover("SABBIR");
  sq = new Lover("SQ");
  smooth();
  noStroke();
  t1 = new Timer(10000);
  t1.begin();
  t2 = new Timer(5000);
}

void draw() {
  if (!t1.isFinished()) {
    s.touch(sq);
    if (s.touched) {
      fill(255, 50);
      rect(0, 0, width, height);
      sq.moveWith(s);
      fill(255);
      heart((s.x+sq.x)/2, (s.y+sq.y)/2, s.name, sq.name);
    } else {
      fill(0);
      rect(0, 0, width, height);
      s.move();
      sq.move();
      s.render();
      sq.render();
    }
  } else if (sq.touched) {
    fill(0);
    rect(0, 0, width, height);
    s.panic();
    s.move();
    sq.move();
    s.render();
    sq.render();
    fill(255);
    textAlign(CENTER);
    text("breakup :(", width/2, height-10);
  } else {

    fill(0);
    rect(0, 0, width, height);
    s.move();
    sq.move();
    s.render();
    sq.render();
  }

  if (t1.isFinished() && !panic) {
    t2.begin();
    panic = true;
  }
  if (t2.isFinished() && panic) {
    t1.begin();
    panic = false;
    s.vx = random(-3, 3);
    s.vy = random(-3, 3);
  }


  stroke(200);
  strokeWeight(2);
  noFill();
  rect(0, 0, width, height);
}
class Lover {
  float x, y;
  float vx, vy;
  int size;
  String name;
  Lover touchedWith;

  boolean touched = false;

  Lover(String n) {
    size = 100;
    x = random(size, width-size);
    y = random(size, height-size);
    vx = random(1, 3);
    vy = random(1, 3);
    name = n;
  }
  void render() {
    textSize(12);
    stroke(0);
    fill(122, 50);
    ellipse(x, y, size, size);
    fill(0);
    textAlign(CENTER);
    text(name, x, y);
    fill(255);
    stroke(0);
  }
  void move() {
    boolean yt = y+size/2>height || y-size/2<0;
    boolean xt = x+size/2>width || x-size/2<0;

    if (xt) {
      vx*=-1;
    }
    if (yt) {
      vy*=-1;
    }
    if (touched && (xt || yt)) {
      touchedWith.vx = vx;
      touchedWith.vy = vy;
      touchedWith.x+=vx;
      touchedWith.y+=vy;
    }

    x+=vx;
    y+=vy;
  }

  void touch(Lover other) {
    if (dist(x, y, other.x, other.y)<size) {
      touched = true;
      other.touched = true;
      vx = other.vx;
      vy = other.vy;
      touchedWith = other;
      other.touchedWith = this;
    } else {
      touched = false;
      other.touched = false;
    }
  }

  void moveWith(Lover other) {
    boolean yt = y+size/2>height || y-size/2<0 ||
      other.y+size/2>height || other.y-size/2<0;
    boolean xt = x+size/2>width || x-size/2<0 ||
      other.x+size/2>width || other.x-size/2<0;

    if (xt) {
      vx*=-1;
      other.vx*=-1;
    }
    if (yt) {
      vy*=-1;
      other.vy*=-1;
    }
    x+=vx;
    y+=vy;
    other.x+=vx;
    other.y+=vy;
  }
  void panic() {
    vx = random(-3, 3);
    vy = random(-3, 3);
  }
}

void heart(float x, float y, String l1, String l2) {
  noStroke();
  fill(#FF003C);
  ellipse(x-35, y, 100, 100);
  ellipse(x+35, y, 100, 100);
  arc(x, y, 170, 150, 0, PI);
  fill(0);

  textSize(15);
  fill(#5D4349);
  textAlign(CENTER);
  text(l1+"+"+l2, x, y+15);
}
class Timer {
  float totalTime;
  float savedTime;
  Timer (float t) {
    totalTime  = t;
  }
  void begin() {
    savedTime = millis();
  }
  boolean isFinished() {
    float passedTime = millis() - savedTime;
    if (passedTime>totalTime) {
      return true;
    } else {
      return false;
    }
  }
}



