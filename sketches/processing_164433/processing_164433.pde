
int numBalls = 450;
float spring = 1.5;
float gravity = 0.00;
float friction = -0.9;

float fr2 = 0.99;
float att_a = 90.0;
float att_r = 100.0;
float int_rad = 30.5;
float entr_p = 2*(1-fr2);

Ball[] balls = new Ball[numBalls];

void setup() {
  size(340, 440);
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(5, 7), i, balls);
    balls[i].impulse(0.1 * rndQ(), 5.0 * rndQ());
  }
  noStroke();
  fill(255, 204);
}

void draw() {
  background(0);
  for (int i = 0; i < numBalls; i++) {
    balls[i].collide();
    balls[i].move();
    balls[i].display(i);
  }
}

class Ball {

  float x, y;
  float diameter;
  float m;
  float px = 0;
  float py = 0;
  float theta = 1.0 * random(360.0);
  int id;
  Ball[] others;

  Ball(float xin, float yin, float min, int idin, Ball[] oin) {
    x = xin;
    y = yin;
    m = min;
    diameter = 5 * sqrt(m);
    id = idin;
    others = oin;
  } 

  void collide() {
    for (int i = id + 1; i < numBalls; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float dist = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/2;
      if (dist < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float Fx = (targetX - others[i].x) * spring;
        float Fy = (targetY - others[i].y) * spring;
        px -= Fx;
        py -= Fy;
        others[i].px += Fx;
        others[i].py += Fy;
        px = fr2 * (px - others[i].px) + others[i].px;
        py = fr2 * (py - others[i].py) + others[i].py;
      }
      if (dist < minDist + int_rad) {
        float angle = atan2(dy, dx);
        float a_1 = theta - angle;
        float a_2 = others[i].theta - (angle-180);
        float U = (cos(3*a_1*PI/180) + 0) * (cos(3*a_2*PI/180) + 0);
        float gradU1 = -3 * sin(3*a_1*PI/180) * (cos(3*a_2*PI/180)+0);
        float gradU2 = -3 * sin(3*a_2*PI/180) * (cos(3*a_1*PI/180)+0);
        theta += gradU1 * att_a / (m * dist*dist + 20);
        others[i].theta += gradU2 * att_a / (others[i].m * dist*dist + 20);
        float F_att = att_r * U / (dist*dist + 36);
        float Fx = cos(angle) * F_att;
        float Fy = sin(angle) * F_att;
        px += Fx;
        py += Fy;
        others[i].px -= Fx;
        others[i].py -= Fy;
      }
    }
    impulse( m * entr_p * rndQ(), m * entr_p * rndQ() );
    float dx = mouseX - x;
    float dy = mouseY - y;
    float distance = sqrt(dx*dx + dy*dy);
    if ( mousePressed && (distance < 50) ) {
      impulse( 0.5 * m * rndQ(), 0.5 * m * rndQ() ); 

      //impulse( 0.5 * dx /(distance + 1), 0.5 * dy /(distance + 1) );
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

  void display(int i) {
    fill(180 + 24*sin(i*1.1), 120);
    ellipse(x, y, diameter, diameter);
    ellipse(x + diameter * cos(theta * PI/180)/2, y + diameter * sin(theta * PI/180)/2, diameter/3, diameter/3);
    ellipse(x + diameter * cos((theta+120) * PI/180)/2, y + diameter * sin((theta+120) * PI/180)/2, diameter/3, diameter/3);
    ellipse(x + diameter * cos((theta-120) * PI/180)/2, y + diameter * sin((theta-120) * PI/180)/2, diameter/3, diameter/3);
  }
}// end class

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP)
      entr_p += 0.5*(1-fr2);
    if (keyCode == DOWN)
      entr_p -= 0.5*(1-fr2);
    if (keyCode == LEFT)
      int_rad -= 0.5;
    if (keyCode == RIGHT)
      int_rad += 0.5;
  }
  println("entr_p: "+ entr_p/(1-fr2));
  println("int_rad: "+ int_rad);
}

float rndQ() {
  return 0.02*random(100)-1.0;
}



