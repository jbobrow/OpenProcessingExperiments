

int count = 100;
 
float [] ballX = new float [count];
float [] ballY = new float [count];
 
float [] speedX = new float [count];
float [] speedY = new float [count];
 
int [] r = new int [count];
 
color [] ballColor = new color[count];
 
float [] ballDist = new float [count];
 
float gravity = 0.1;
 
void setup() {
  size (700, 700);
  smooth();
   
  for (int i=0; i<count; i++){
    ballX[i] = random(width);
    ballY[i] = random(height);
    frameRate(300);
    speedX[i] = -3;
    speedY[i] = 6;
    r[i] = (20);
    ballColor[i] = color(random(255), random(255), 20,40);
  }
   
   
}
 
void draw() {
  background(255, 255, 255);
 
  for (int i=0; i<count; i++) {
    for (int j=0; j<count; j++) {
 
      if (i!=j) {
        fill(ballColor[i]);
        ellipse (ballX[i], ballY[i], r[i], r[i]);
 
        ballX[i] += speedX[i];
        ballY[i] += speedY[i];
        speedY[i] += gravity;
 
        if (ballX[i] >= width-r[i] || ballX[i] <= r[i]) {
          speedX[i] *= -1;
        }
 
        if (ballY[i] >= height-r[i] || ballY[i] <= r[i]) {
          speedY[i] *= -0.95;
        }
 
 
        ballDist[i] = dist(ballX[i], ballY[i], ballX[j], ballY[j]);
        if (ballDist[i] <= r[i] + r[j]) {
          speedX[i] *= -1;
          speedY[i] *= -1;
          speedX[j] *= -1;
          speedY[j] *= -1;
        }
 
        //        ellipse (ballX[i], ballY[i], 2*r[i], 2*r[i]);
      }
    }
  }
}


