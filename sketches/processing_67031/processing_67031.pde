
int numCircle = 60;

float[] circleX = new float [numCircle];
float[] circleY = new float [numCircle];

float[] speedX = new float [numCircle];
float[] speedY = new float [numCircle];

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  colorMode(RGB, 265);
  frameRate(60);



  for (int i = 0; i < numCircle; i++) {
    circleX[i] = random(10);
    circleY[i] = random(30);
    speedX[i] = random(10);
    speedY[i] = random(10);
  }
}

void draw() {

  background(mouseX/2, mouseY/2, 255);

  for (int i = 0; i < numCircle; i ++) {
    fill(mouseX, 255, mouseY);
    ellipse(circleX[i], circleY[i], i + 1, i + 1);
    circleX[i] += speedX[i];
    circleY[i] += speedY[i];






    if (circleY[i] >= height || circleY[i] <= 0) {

      speedY[i] *= -1;
      
      
    }

    if (circleX[i] >= width || circleX[i] <= 0) {

      speedX[i] *= -1;
     
    }
  }
}



