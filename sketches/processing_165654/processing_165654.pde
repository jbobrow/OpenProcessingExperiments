
int numBalls = 520;
float spring = 0.1;
float gravity = 0.005;
float friction = -0.95;
float fr2 = 0.99;
ArrayList<Ball> balls = new ArrayList<Ball>();

void setup() {
  size(640, 360);
  for (int i = 0; i < numBalls; i++) {
    balls.add( new Ball(random(width), random(height), random(2, 8) ) );
    balls.get(i).impulse(10*rndQ(), 10*rndQ());
  }
  noStroke();
  fill(255, 204);
}

void draw() {
  background(0);
  for (int i = balls.size ()-1; i >= 0; i--) {
    if (balls.get(i).state == 1) {
      balls.remove(i);
    } else {
      balls.get(i).collisions(i);
      balls.get(i).move();
      balls.get(i).display();
    }
  }
}

class Ball {

  float x, y;
  float diameter;
  float m;
  float px;
  float py;
  float Exgy;
  int id;
  ArrayList<Ball> others;
  int state = 0;

  Ball(float xin, float yin, float min) {
    x = xin;
    y = yin;
    m = min;
    diameter = 5 * sqrt(m);
    px = 0;
    py = 0;
    Exgy = 0;
  }
  Ball(float xin, float yin, float min, float pxin, float pyin, float Ein) {
    x = xin;
    y = yin;
    m = min;
    diameter = 5 * sqrt(m);
    px = pxin;
    py = pyin;
    Exgy = Ein;
  }
  void collisions(int pos) {
    id = pos;
    for (int i = pos-1; i >= 0; i--) {
      float dx = balls.get(i).x - x;
      float dy = balls.get(i).y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = balls.get(i).diameter/2 + diameter/2;
      if (distance < minDist) {
        balls.get(i).id = i;
        collide(balls.get(i));
      }
    }
  }

  void collide(Ball other) {
    float dx = other.x - x;
    float dy = other.y - y;
    float distance = dst( dx, dy );
    float minDist = (other.diameter + diameter)/2;
    float angle = atan2(dy, dx);
    if (random(100) > distance/minDist * 110) {
      println(distance/minDist * 200);
      state = 1;
      // combine values
      float m3 = m + other.m;
      float x3 = (x * m + other.x * other.m)/(m3);
      float y3 = (y * m + other.y * other.m)/(m3);
      float px3 = px + other.px;
      float py3 = py + other.py;
      float E_T = Exgy + other.Exgy + ( qdr(px, py)/m + qdr(other.px, other.py)/other.m )/2 ;
      float Exgy3 = E_T - qdr(px3, py3)/(2*m3);
      // create new Ball
      Ball nu = new Ball(x3, y3, m3, px3, py3, Exgy3);
      nu.state = 2+other.state;
      balls.remove(other.id);
      balls.add(nu);
    } else {
      // bounce - repel
      float targetX = x + cos(angle) * minDist;
      float targetY = y + sin(angle) * minDist;
      float Fx = (targetX - other.x) * spring;
      float Fy = (targetY - other.y) * spring;
      px -= Fx;
      py -= Fy;
      other.px += Fx;
      other.py += Fy;
    }
  }

  void move() {
    py += gravity*m;
    x += px/m;
    y += py/m;
    if (x + diameter/2 > width) {
      x = width - diameter/2;
      px *= friction;
    } else if (x - diameter/2 < 0) {
      x = diameter/2;
      px *= friction;
    }
    if (y + diameter/2 > height) {
      y = height - diameter/2;
      py *= friction;
    } else if (y - diameter/2 < 0) {
      y = diameter/2;
      py *= friction;
    }
  }

  void impulse(float i_x, float i_y) {
    px += i_x;
    py += i_y;
  }

  void display() {
    fill(180, 120);
    if (state == 1)
      fill(200, 0, 0, 150);
    if (state >= 2)
      fill(state*20, 150, 0, 150);
    ellipse(x, y, diameter, diameter);
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP)
      ;
    if (keyCode == DOWN)
      ;
    if (keyCode == LEFT)
      ;
    if (keyCode == RIGHT)
      ;
  }
}

float qdr(float x_, float y_) {
  return x_*x_ + y_*y_;
}
float dst(float x_, float y_) {
  return sqrt(qdr(x_, y_));
}

float rndQ() {
  return 0.02*random(100)-1.0;
}



