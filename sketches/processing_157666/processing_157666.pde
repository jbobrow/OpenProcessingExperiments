
/*"Bump'n'Hole Pinball;" by Lorenzo, licensed under Creative Commons Attribution-Share Alike 3.0. 
The "Ball" array is taken from Keith Peters's Bouncy Bubbles */

int numBalls =5;///////////////////////////////
float spring = 2.90;//2.0//////////////////////
float gravity = 0.55;//1.05////////////////////
float friction = -0.5;//-0.8///////////////////
Ball[] balls = new Ball[numBalls];
 PFont fontA;
String sc = "punti ";//////////////////////////
float trap= -1.0;//////////////////////////////
int punteggio = 0;
float bumping= 4.0;
int z = 20;
int a=120;
int b=130;
int c=120;
int d=190;

void setup() 
{
  size(240, 500);
  noStroke();
  smooth();
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(100, 150), random(200, height), random(15, 20), i, balls);
  }
}

void draw() 
{
  background(0);
  rectMode(CENTER);
  rect(a, b, z, z); // BUMP
  rect(c, d, z, z); // BUCA
  fill(0);
  ellipse(c, d, z, z);
  for (int i = 0; i < numBalls; i++) {
    balls[i].collide();
    balls[i].move();
    balls[i].display();
  }
  fontA = loadFont("CourierNew36.vlw");
  textAlign(CENTER);
  textFont(fontA, 32);
  text(sc, 62,33);//
  text(punteggio,153,33);//
}

class Ball {
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  Ball[] others;//
  Ball(float xin, float yin, float din, int idin, Ball[] oin) {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  } 
  void collide() {    //
    for (int i = id + 1; i < numBalls; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/2;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
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
  void move() {
    vy += gravity;
    x += vx;
    y += vy;
    if (x + diameter/2 > width) {
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
    }/////////////////////////////////////////
    if (((x + diameter/2 > a - z/2)&& (x - diameter/2 < a))&&((y + diameter/2 > b - z/2)&&(y - diameter/2 < b + z/2))) {
      x = a - z/2 - diameter/2;
      vx *= bumping*friction;
            punteggio= punteggio+150;
    }
    else if (((x - diameter/2 < a + z/2)&&(x + diameter/2 > a))&&((y + diameter/2 > b - z/2)&&(y - diameter/2 < b + z/2))) {
      x = a + z/2 + diameter/2;////////giusta
      vx *= bumping*friction;
         punteggio= punteggio+150;
    }//che cazzo ha mo la Y che non vÃ  ?
    if (((y + diameter/2 > b - z/2)&&(y - diameter/2 < b))&&((x + diameter/2 > a - z/2)&&(x - diameter/2 < a + z/2))) {
      y = b - z/2 - diameter/2;
      vy *= bumping*friction;
      punteggio= punteggio+150;
    }
    else if (((y - diameter/2 < b + z/2)&&(y + diameter/2 > b))&&((x + diameter/2 > a - z/2)&&(x - diameter/2 < a + z/2))) {
      y = b + z/2 + diameter/2;
      vy *= bumping*friction;//SOLO X Ã¨ GIUSTA
      punteggio= punteggio+150;

    }//////////////////////////////////////////
    if ((((x > c - z/2)&& (x < c))&&((y > d - z/2)&&(y < d + z/2)))|| (((x < c + z/2)&&(x > c))&&((y > d - z/2)&&(y < d + z/2)))||(((y > d - z/2)&&(y < d))&&((x > c - z/2)&&(x < c + z/2)))||(((y < d + z/2)&&(y > d))&&((x > c - z/2)&&(x < c + z/2))))
    {
      x = c;//blocca la pallina fino a nuova collisione
      vx *= trap*friction;
      y = d;
      vy *= trap*friction;
      punteggio= punteggio-1;
    }
  }
  void display() {
    fill(200, 200);
    ellipse(x, y, diameter, diameter);
    //    rect(random(x),random(y),x,y);
  }
}

