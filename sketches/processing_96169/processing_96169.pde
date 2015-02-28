
int numBalls = 10;                         //DECLARES THE NUMBER OF BALLS IN THE IMAGE
float spring = 0.05;                      //DETERS HOW MUCH BOUCNE THE BALL WILL HAVE
float gravity = 0.005;                   // STES HOW FAST THE BALL WILL FALL
float friction = -0.1;//
Ball[] balls = new Ball[numBalls];

void setup() {
  size(640, 360);                         //SETS SCREEN SIZE
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(10, 70), i, balls);
  }                                       // SETS THE BALL TO OF A RADOMDOM WIDTH AND HEIGHT
  noStroke();
  fill(152,230,232);                      // SETS THE COLOUR OF THE SCREEN
}

void draw() {
  background(13,173,250);                   // THIS SET THE COLOUR OF YOUR BACKGROUND BY SELECTING THE AMOUNT OF RED gREEN AND BLUE TO MIX TOGETHER
  for (int i = 0; i < numBalls; i++) {
    balls[i].collide();                  // DECLARES THAT YOU WANT THE BALLS//
    balls[i].move();                     // TO COLLIDE, MOVE AND TO BE DISPLAYED//
    balls[i].display();  
  }
}

class Ball {
  
  float x, y; 
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  Ball[] others;
 
  Ball(float xin, float yin, float din, int idin, Ball[] oin) {              //THIS IDENTIFYS WHICH BALL GOES WITH WHICH SIZE OF DIAMETER//
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  } 
  
  void collide() {                                                          // THIS CALCULATES THE DISTANCE THE BETWEEN THE BALLS
    for (int i = id + 1; i < numBalls; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/2;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);                                       // THIS CALCULATES THE MANGNITUDE OF  VECTOR SPERATING BALLS
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) * spring;
        float ay = (targetY - others[i].y) * spring;
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay;
      }
    }   
  }
  
  void move() {                                   // CALCULATES THE SPEED AT WHICH THE BALLS ARE DROPPING AND THE SIZE OF THE BALLS 
    vy += gravity;
    x += vx;
    y += vy;
    if (x + diameter/2 > width) {             // DETERS THE SIZES OF DIFFERENT BALL AND AT WHAT SPEED THEY ARE BEING REPELLED WITH THE FRICTION ADDED// 
      x = width - diameter/2;
      vx *= friction; 
    }
    else if (x - diameter/2 < 0) {
      x = diameter/2;
      vx *= friction;
    }
    if (y + diameter/2 > height) {
      y = height - diameter/2;
      vy *= friction; 
    } 
    else if (y - diameter/2 < 0) {
      y = diameter/2;
      vy *= friction;
    }
  }
  
  void display() {
    ellipse(x, y, diameter, diameter); // ASKS FOR THE BALL TO BE DISPLAYED ON TO YOUR IMAGE
  }
}
