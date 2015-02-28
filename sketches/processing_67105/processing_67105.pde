
int numSquare = 50;
int size = 30;

float[] squareX = new float [numSquare];
float[] squareY = new float [numSquare];
float[] velX = new float [numSquare];
float[] velY = new float [numSquare];



void setup() {
  size(500, 500);
  smooth();
  noStroke();

  for (int i=0; i < numSquare; i++) {
    squareX[i] = random(width);
    squareY[i] = random(height);
    println("X = " + squareX[i] + "Y = " + squareY[i]);
    velX[i] = random(20);
    velY[i] = random(20);
    
  }
}

  void mouseReleased() {
    
    for (int i = 0;i<squareX.length; i++) {
      
      squareX[i] = mouseX;
      squareY[i] = mouseY;
      
      velX[i] = random(-2,2);
      velY[i] = random(-7,-3);
      
      
  }
  }

void draw() {
  background(25, 25, 0);

  for (int i = 0; i < numSquare; i++) {
    fill(255, i*20, i*30, 85);
    rect(squareX[i], squareY[i], size, size);

    squareY[i] += velY[i];
    squareX[i] += velX[i];



    if ((squareY[i] < 0) || (squareY[i] > height)) {
      velY[i]*=-.9;
    }  

    if ((squareX[i] < 0) || (squareX [i] > width)) {
      velX[i]*=-1;
    }
  }


}



