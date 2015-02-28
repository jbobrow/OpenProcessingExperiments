
// number of balls
int ballNo = 4;

// x, y position
float [] ballX = new float [ballNo];
float [] ballY = new float [ballNo];

// x, y speed
float [] speedX = new float [ballNo];
float [] speedY = new float [ballNo];

// radius for each ball
int [] r = new int [ballNo];

color [] ballColor = new color[ballNo];

float [] ballDist = new float [ballNo];

float gravity = 0.1;

void setup() {
  size (500, 500);
  smooth();
  noStroke();
  
  for (int i=0; i<ballNo; i++){
    ballX[i] = random(width);
    ballY[i] = random(height);
    speedX[i] = random(-4, 4);
    speedY[i] = random(-6, 6);
    r[i] = (20);
    ballColor[i] = color(20, 40, 20, 80);
  }
  
  
}

void draw() {
  background(255);

  for (int i=0; i<ballNo; i++) {
    for (int j=0; j<ballNo; j++) {

      if (i!=j) {
        fill(ballColor[i]);
        ellipse (ballX[i], ballY[i], 2*r[i], 2*r[i]);


        // Speed + Gravity
        ballX[i] += speedX[i];
        ballY[i] += speedY[i];
        speedY[i] += gravity;

        // Boarder Detection
        if (ballX[i] >= 500-r[i] || ballX[i] <= r[i]) {
          speedX[i] *= -1;
        }

        if (ballY[i] >= 500-r[i] || ballY[i] <= r[i]) {
          speedY[i] *= -0.95;
        }


        // Collision Detection
        ballDist[i] = dist(ballX[i], ballY[i], ballX[j], ballY[j]);
        if (ballDist[i] <= r[i] + r[j]) {
          speedX[i] *= -1;
          speedY[i] *= -1;
          speedX[j] *= -1;
          speedY[j] *= -1;
        }
        if (dist(ballX[i], ballY[i], mouseX, mouseY) < r[i]) {
          speedX[i] *= -1;
          speedY[i] *= -1;
        }


        //        ellipse (ballX[i], ballY[i], 2*r[i], 2*r[i]);
      }
    }
  }
}


