
float mx; 
float radius = 20; 
int totalBalls = 10; 
int easeMode = 1; 

Ball ball; 
Ball[] balls = new Ball[totalBalls];
int layer = 0; 

PGraphics pg;

void setup() {
  size(600, 300);
  background(255); 
  pg = createGraphics(width/2, height);
  mx = width/2; 

  for (int i = 0; i < totalBalls; i++) {
    ball = new Ball(); 
    ball.x = random(radius, width-radius); 
    ball.y = random(radius, height-radius); 
    ball.vx = random(-3, 3);
    ball.vy = random(-3, 3);

    balls[i] = ball;
  }
}

void draw() {
  background(255); 
  fill(0); 
  noStroke();  
  for (int i = 0; i < totalBalls; i++) {
    balls[i].drawBall(0);
  }

  pg.beginDraw();
  pg.background(0);
  pg.fill(255); 
  pg.noStroke(); 
  for (int i = 0; i < totalBalls; i++) {
    balls[i].drawBall(1);
  }   
  pg.endDraw();

  // Draw the offscreen buffer to the screen with image() 
  image(pg, width/2, 0);

  // Ball-Collision 
  for (int i = 0; i < totalBalls; i++) {
    for (int j = i + 1; j < totalBalls; j++) {
      float dx = balls[j].x - balls[i].x;
      float dy = balls[j].y - balls[i].y;
      float dist = sqrt(dx * dx + dy * dy);
      if (dist < (balls[j].bRadius + balls[i].bRadius)) {
        // balls have contact so push back...
        float normalX = dx / dist;
        float normalY = dy / dist;
        float midpointX = (balls[i].x + balls[j].x) / 2;
        float midpointY = (balls[i].y + balls[j].y) / 2;
        balls[i].x = midpointX - normalX * balls[i].bRadius;
        balls[i].y = midpointY - normalY * balls[i].bRadius;
        balls[j].x = midpointX + normalX * balls[j].bRadius;
        balls[j].y = midpointY + normalY * balls[j].bRadius;
        float dVector = (balls[i].vx - balls[j].vx) * normalX;
        dVector += (balls[i].vy - balls[j].vy) * normalY;
        float dvx = dVector * normalX;
        float dvy = dVector * normalY;
        balls[i].vx -= dvx;
        balls[i].vy -= dvy;
        balls[j].vx += dvx;
        balls[j].vy += dvy;
      }
    }
  }
}

class Ball {
  float x, y; 
  float vx = 0; 
  float vy = 0; 
  float faktor = 0.96; 
  float bRadius = radius; 

  float gravityX = 0; 
  float gravityY = 0; 

  void drawBall(int _layer) {
    float easeX; 

    if (easeMode == 1) {
      easeX = easeX1();
    } else {
      easeX = easeX2();
    }

    checkWall();   
    float tvx = vx * easeX; 
    float tvy = vy * easeX; 

    x += tvx;     
    y += tvy;          

    if (_layer == 0) {
      fill(0);
      ellipse(x, y, bRadius*2, bRadius*2);
    } else {
      fill(255); 
      pg.ellipse(x-height, y, bRadius*2, bRadius*2);
    }
  }

  void checkWall() {
    if (x > width-bRadius || x < bRadius) {
      vx *= -1;
      x += vx; 
    } 
    if (y > height-bRadius || y < bRadius) {
      vy *= -1;
      y += vy; 
    }
  }

  float easeX1() {
    float t; 
    float ease = 0; 
    // Die Bälle werden immer langsamer, je näher sie der Wand kommen
    t = map(abs(x - width/2), 0, width/2, 0.1, 2); 
    ease = t; 

    return ease;
  }

  float easeX2() {
    float ease = 1; 
    // easing nur wenn der Ball die Wand berührt
    if (x >= mx - bRadius && x <= mx + bRadius) {
      ease = 0.1;
    } else {
      ease = 1;
    }
    return ease;
  }
}

void keyReleased() {
  if (key == '1') {
    easeMode = 1;
  }
  if (key == '2') {
    easeMode = 2;
  }
}



