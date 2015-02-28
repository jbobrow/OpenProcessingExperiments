
int nBalls = 2;
Ball[] balls = new Ball[nBalls];
int counter = 0;

class Ball {
  float x, y;
  float vx = 5;
  float vy = 4;
  float diameter;
  int id;
  
  Ball(float xin, float yin, float din, int idin) {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
  }
}

void setup() {
  size(500,500);
  background(0);
  textSize(32);
  for (int i = 0; i < nBalls; i++) {
    float size = 30;
    balls[i] = new Ball(random(width -size)+size/2, random(height - 20 -size)+size/2, size , i);
  }
}
void collision() {
  for (int a = 1; a < nBalls; a++) {
      if (balls[a].x > width - balls[a].diameter/2 || balls[a].x < balls[a].diameter/2 ) {
        balls[a].vx = -balls[a].vx;
       }
       if (balls[a].y > height - balls[a].diameter/2) {
         balls[a].vy = -balls[a].vy;
         counter -= 2;
       }
       if (balls[a].y < balls[a].diameter/2) {
         balls[a].vy = -balls[a].vy;
       }
       if (balls[a].x > mouseX - 70/2 && balls[a].x < mouseX + 70/2) {
         if (balls[a].y > height - 20 -balls[a].diameter/2) {
           balls[a].vy = -balls[a].vy;
           counter += 1;
         }
       }
     }    
   }

void drawellipse() {
  for (int a = 1; a < nBalls; a++) {
        fill(255, 0, 0);
          ellipse(balls[a].x, balls[a].y , balls[a].diameter, balls[a].diameter);
          balls[a].x = balls[a].x+balls[a].vx;
          balls[a].y = balls[a].y+balls[a].vy;
    }
  }


void draw() {
  background(0);
  noStroke();
  fill(255);
  rect(mouseX-70/2,height-20,70,20);
  collision();
  drawellipse();
  text(counter,10,30);
}
  




