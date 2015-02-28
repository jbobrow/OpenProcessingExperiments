
ArrayList<Hanabi> hanabis;

void setup() {
  background(0);
  size(640, 480);
  smooth();

  hanabis = new ArrayList();
}

void draw() {
  noStroke();
  fill(0, 10);
  rect(0, 0, width, height);

  for (int i=0;i<hanabis.size();i++) {
    if (hanabis.get(i).isDead()) {
      hanabis.remove(i);
    }
  }

  for (Hanabi b : hanabis) {

    b.draw();
  }
}

class Hanabi {

  int numBalls = 200;

  Ball[] balls;

  Hanabi(int x, int y) {
    balls = new Ball[numBalls];
    for (int i=0;i<numBalls;i++) {
      balls[i]=new Ball(x, y);
    }
  }

  void draw() {


    for (int i=0; i<numBalls; i++) {
      balls[i].draw();
    }
  }

  boolean isDead() {
    for (int i=0; i<numBalls; i++) {
      if (!(balls[i].isDead())) {
        return false;
      }
    }

    return true;
  }
  //////////////////////////////////////////////////////////////

  class Ball {
    float x, y;
    float gravity = 0.1;
    float vel_x;
    float vel_y;
    int asd = 255;

    Ball(float xpos, float ypos) {
      x = xpos;
      y = ypos;
      float theta = random(0, TWO_PI);
      float v0 = random(0, 6);
      vel_x = v0 * cos(theta);
      vel_y = v0 * sin(theta);
    }

    void update() {    
      x += vel_x;
      y += vel_y;
      vel_y += gravity;
    }

    void draw() {
      update();
      asd -= 5;

      fill(255, 200, 40, asd);
      noStroke();
      ellipse(x, y, 2, 2);
    }

    boolean isDead() {
      return(asd <= 0);
    }
  }
}

void mouseClicked() {
  hanabis.add(new Hanabi(mouseX, mouseY));
}


