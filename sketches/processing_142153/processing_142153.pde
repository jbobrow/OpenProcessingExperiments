
Ball[] ball;//[] makes an array
int id;

void setup() {
  size(800, 800);
  ball = new Ball[100];
  for (int i=0; i < ball.length; i++) {
    ball[i] = new Ball(random(1000), random(1000), i);
  }
}

void draw() {
  background(0);
  for (int i=0;i < ball.length; i++) {
    ball[i].display();
    ball[i].collision();
  }
}



class Ball {
  float  x, y, targetX, targetY, easing;
  float id;
  Ball (float _x, float _y, int _id) {
    x = _x;
    y = _y;
    id = _id;
    targetX= width/2;
    targetY= height/2;
    easing = .01;
  }


  void display() {
    float diffX = targetX - x;
    float diffY = targetY - y;
    x +=diffX*easing;
    y += diffY*easing;

    fill (255);
    ellipse(x, y, 5, 5);

    if (y>350 && y<450 && x>350 && x<450) {
      easing*=-1;
    }
    else if (y>700 && y<750 || y>50 && y<100 || x>700 && x<750 ||x>50 && x<100) {
      easing = .01;
      x +=diffX*easing;
      y += diffY*easing;
      ellipse(x, y, 5, 5);
    }
  }

  void collision() {
    stroke(255);
    for (int i=0;i < ball.length; i++) {
      if (id !=i) {
        if (dist(x, y, ball[i].x, ball[i].y)<50) {
          line(ball[i].x, ball[i].y, x, y); //intersecting code
        }
      }
    }
  }
}



