
Ball ball;
int i = 0;
boolean[] rec;
boolean won;
int score = 0;
Timer t;

void setup() {
  size(500,550);
  rec = new boolean[100];
  ball = new Ball();
  t = new Timer(60000);
  t.begin();
  won = false;
  textAlign(CENTER);
  textSize(20);
  smooth();
}

void draw() {
  noStroke();
  fill(255);
  rect(0, 0, width, height);

  ball.update();
  ball.checkEdge();
  ball.display();

  fill(250, 0, 0, 200);
  ellipse(mouseX, mouseY, 18, 18);

  rec[frameCount%100] = ball.notMoving();
  won = true;
  for (int i = 0; i<100; i++) {
    if (rec[i]!=true) won  = false;
  }

  if (won == true) {
    fill(0);
    text("scored", width/2, height/2);
    ball.reset();
    score++;
  }
  
  fill(100);
  text("score: "+score, width-50, 25);
  text("time left: "+int(t.left()/1000)+"s", 70, 25);
  
  if(t.isFinished()) {
    fill(0,150,0);
    rect(0,0,width,height);
    fill(255,0,0);
    text("Time over. You have scored "+score,width/2,height/2);
    text("Click to start again.",width/2,height/2+25);
    
    
    if(mousePressed) {
      t.begin();
      score = 0;
    }
  }
}

class Ball {
  PVector loc;
  PVector vel;
  PVector ac; 
  float fac;

  Ball() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    ac = new PVector(0, 0);
  }

  void update() {

    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, loc);

    fac =dir.mag()*.0001;

    dir.normalize();
    dir.mult(fac);

    ac = dir;
    vel.add(ac);
    loc.add(vel);
  }

  void checkEdge() {
    if (loc.x-9<0 || loc.x+9>width ) {
      vel.x*=-1;
    }
    if (loc.y-9<0||loc.y+9>height) {
      vel.y*=-1;
    }
  }

  void display() {
    fill(0,150,0,200);
    ellipse(loc.x, loc.y, 18, 18);
  }

  boolean notMoving() {
    if (vel.mag()<.1) return true;
    else return false;
  }
  void reset() {
    loc = new PVector(random(18, width-18), random(18, height-18));
    vel.x = 1;
  }
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
  float left() {
    float passedTime = millis() - savedTime;
    return totalTime-passedTime;
  }
}



