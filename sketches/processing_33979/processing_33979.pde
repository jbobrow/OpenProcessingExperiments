
int circles = 50; //number of circles
int i = 0;
float [] ballx = new float [circles]; //position of the ball in the X for [circles] number of balls
float [] bally = new float [circles]; //position of the ball in the y for [circles] number of balls
float ballw = 5; //width of ball is constant  for me cuz i'm cool like that
float [] speedx = new float [circles]; //speed of balls in x axis
float [] speedy = new float [circles]; //speed of balls in y axis

void setup() {
  size (700, 700);
  //  background (0);
  //  noStroke();
  //  noLoop();
  frameRate (30);
  smooth();
   for (int i=0; i < circles; i++) {
    ballx [i] = random(0 + ballw/2, width - ballw/2);
    bally [i] = random(0 + ballw/2, height - ballw/2);
    speedx [i] = 7;
    speedy [i] = 5;
  }
}

void draw() {
  background (0);
  drawball();  
  moveBall();
  checkEdgeOfScreen();
}

void moveBall() {
  for (int i = 0; i < circles; i++) {
    bally [i] = bally [i] + speedy[i];
    ballx [i] = ballx [i] + speedx[i];
  }
}

void checkEdgeOfScreen() {
  for (int i = 0; i < circles; i++) {
    if (ballx [i] > width - (ballw/2)) {
      speedx[i] = speedx[i] * -1;
    }

    if (ballx[i] < 0 + ballw/2) {
      speedx[i] = speedx[i] * -1;
    }

    if (bally [i] > height - (ballw/2)) {
      speedy[i] = speedy[i] * -1;
    }

    if (bally [i] < 0 + (ballw/2)) {
      speedy [i] = speedy [i] * -1;
    }
  }
}

void drawball() {
  fill (0, 255, 0);
  noStroke();
  for (int i = 0; i < circles; i ++) {
    ellipse (ballx [i], bally [i], ballw, ballw);
  }
}


