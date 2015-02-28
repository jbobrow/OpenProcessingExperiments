
int ballNum = 200;

int xBall[] = new int [ballNum];
int yBall[] = new int [ballNum];
int ballSize[] = new int [ballNum];

color ballColor[] = new color [ballNum];

void setup () {
  background(0, 255, 216);
  size(700, 700);
  noStroke();
  smooth();


  for (int i = 0; i < ballNum; i++) {
    xBall[i] = int(random(0, width));
    yBall[i] = int(random(0, height));
    ballSize[i] = int(random (10, 30));
    ballColor[i] = color(random(0, 255), random(0, 255), random(0, 255));
  }
}
void draw() {





  for (int i = 0; i < ballNum; i++) {
    if (dist(mouseX, mouseY, xBall[i], yBall[i]) < ballSize[i]/2) {
      if (mousePressed) {
        xBall[i] = mouseX;
        yBall[i] = mouseY;
        ballColor[i] = color(random( 0 , 255), random(0, 255), random(0, 255), random(95, 100));
        ballSize[i] = 200;
        stroke(246, 0, 255);
        strokeWeight(1);
      }
    }
  }

  for (int i = 0; i < ballNum; i++) {
    fill(ballColor[i]);
    ellipse(xBall[i], yBall[i], ballSize[i], ballSize[i]);
  }
}
