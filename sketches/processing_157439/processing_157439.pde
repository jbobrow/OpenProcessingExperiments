
int nBalls = 10;
int r = 129;
int g = 228;
int b = 255;
int shade = 60;

class Ball {
  float x, y;
  float vx, vy;
  float s;
  float shade;
}
Ball[] balls = new Ball[nBalls];

void setup() {
  size(500,500);
  background(0);
  fill(200,241,247,random(53,255));
  for (int i = 1; i < nBalls; i++) {
    balls[i] = new Ball();
    balls[i].x = random(width);
    balls[i].y = random(height);
    balls[i].s = random(10,50)+5;
    balls[i].vx = random(1.0)-0.5;
    balls[i].vy = random(1.0)-0.5;
  }
}  
void draw() {
  background(r,g,b,shade);
  noStroke();
  for (int a = 1; a < nBalls; a++) {
    ellipse(balls[a].x, balls[a].y , balls[a].s, balls[a].s);
      balls[a].x = balls[a].x+balls[a].vx;
      balls[a].y = balls[a].y+balls[a].vy;
      
    /*if (balls[a].x > width) {
      balls[a].vx = -balls[a].vy;
      balls[a].vy = -balls[a].vx;
    }
    else if (balls[a].x < 0) {
      balls[a].vx = -balls[a].vy;
      balls[a].vy = -balls[a].vx;
    }
    else if (balls[a].y < 0) {
      balls[a].vx = -balls[a].vy;
      balls[a].vy = -balls[a].vx;
    }
    else if (balls[a].y > height) {
      balls[a].vx = -balls[a].vy;
      balls[a].vy = -balls[a].vx;
    }*/
  }
}


