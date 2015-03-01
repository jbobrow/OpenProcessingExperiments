
Ball [] balls;

int num = 100;

void setup() {
  size(640, 480);

  noStroke();

  char [] c = {
    'r', 'g', 'b'
  };
  balls = new Ball[num];
  for (int i=0; i<num; i++) {
    balls[i] = new Ball();
    int r = int(random(3));
    balls[i].type = c[r];
  }

  for (int j=0; j<num; j++) {
    balls[j].setBalls(balls);
  }
}

void mousePressed() {
  char [] c = {
    'r', 'g', 'b'
  };
  balls = new Ball[num];
  for (int i=0; i<num; i++) {
    balls[i] = new Ball();
    int r = int(random(3));
    balls[i].type = c[r];
  }

  for (int j=0; j<num; j++) {
    balls[j].setBalls(balls);
  }
}

void draw() {
  background(255);
  for (int i=0; i<num; i++) {
    balls[i].update();
  }
}

class Ball {
  float x, y;
  float rad, sp;
  int size = 20;
  char type;
  Ball [] balls;

  Ball() {
    x = random(width);
    y = random(height);
    rad = random(radians(360));
    sp = random(1, 2);
    size = int(random(15, 25));
  }

  void setBalls(Ball[] b) {
    balls = b;
  }

  void update() {
    x += cos(rad)*sp;
    y += sin(rad)*sp;
    if (x < 0) {
      x = -x;
      rad = radians(180) - rad;
    } else if (width < x) {
      x = width - (x - width);
      rad = radians(180) - rad;
    }
    if (y < 0) {
      y = -y;
      rad = radians(270) + (radians(90) - rad);
    } else if (height < y) {
      y = height - (y - height);
      rad = radians(90) + (radians(270) - rad);
    }

    for (int i=0; i<balls.length; i++) {
      if (balls[i] != this) {
        Ball cBall = balls[i];
        float cDist = dist(x, y, cBall.x, cBall.y);
        float cRad = atan2(cBall.y-y, cBall.x-x);
        float colDist = ((size+cBall.size) / 2) - cDist;
        if (0 < colDist) {
          x -= cos(cRad)*(colDist/2);
          y -= sin(cRad)*(colDist/2); 
          cBall.x += cos(cRad)*(colDist/2);
          cBall.y += sin(cRad)*(colDist/2);

          if (type == 'r') {
            if (cBall.type == 'g') {
              //              cBall.x += cos(cRad)*(colDist/2);
              //              cBall.y += sin(cRad)*(colDist/2);
              cBall.type = 'r';
            } else if (cBall.type == 'b') {
              //              x -= cos(cRad)*(colDist/2);
              //              y -= sin(cRad)*(colDist/2);
              type = 'b';
            }
          } else if (type == 'g') {
            if (cBall.type == 'b') {
              //cBall.x += cos(cRad)*(colDist/2);
              //cBall.y += sin(cRad)*(colDist/2);
              cBall.type = 'g';
            } else if (cBall.type == 'r') {
              //x -= cos(cRad)*(colDist/2);
              //y -= sin(cRad)*(colDist/2);
              type = 'r';
            }
          } else if (type == 'b') {
            if (cBall.type == 'r') {
              //cBall.x += cos(cRad)*(colDist/2);
              //cBall.y += sin(cRad)*(colDist/2);
              cBall.type = 'b';
            } else if (cBall.type == 'g') {
              //x -= cos(cRad)*(colDist/2);
              //y -= sin(cRad)*(colDist/2);
              type = 'g';
            }
          }

          break;
        }
      }
    }

    switch(type) {
    case 'r':
      fill(255, 0, 0, 200);
      break;
    case 'g':
      fill(0, 255, 0, 200);
      break;
    case 'b':
      fill(0, 0, 255, 200);
      break;
    }
    ellipse(x, y, size, size);
  }
}


