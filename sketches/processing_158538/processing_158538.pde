
int num = 36;
Ball[] balls = new Ball[num];
float speed = 4;

void setup() {
  size(500, 500);
  background(255);
  for (int i=0; i<num; i++) {
    float dir = map(i, 0, num, 0, TWO_PI);
    balls[i] = new Ball(250, 250, dir);
  }
}

void draw() {
  fadeToWhite();

  stroke(0);
  noFill();
  strokeWeight(0.1);
  for (int i=0; i<num; i++) {
    balls[i].move();
    balls[i].collision();
    balls[i].drawLine();
  }
}


class Ball {
  PVector loc, vec;
  float dir;

  Ball(float _x, float _y, float _dir) {
    dir = _dir;
    float vx = speed * cos(dir);
    float vy = speed * sin(dir);
    vec = new PVector(vx, vy);
    loc = new PVector(_x, _y);
  }

  void move() {
    loc.add(vec);
    fill(0);
//    ellipse(loc.x, loc.y, 7, 7);
  }

  void collision() {
    if (loc.x<0) {
      loc.x = 0;
      vec.x *= -1;
    } else if (loc.x>width) {
      loc.x = width;
      vec.x *= -1;
    } else if (loc.y<0) {
      loc.y = 0;
      vec.y *= -1;
    } else if (loc.y>height) {
      loc.y = height;
      vec.y *= -1;
    }
  }  

  void drawLine() {
    for (int i=0; i<num; i++) {
      if (!(balls[i]==this)) {
        float distance = PVector.dist(balls[i].loc, this.loc);
        if (distance<140) {
          line(balls[i].loc.x, balls[i].loc.y, this.loc.x, this.loc.y);
        }
      }
    }
  }
}

void fadeToWhite() {
  fill(255, 15);
  noStroke();
  rect(0, 0, width, height);
}

