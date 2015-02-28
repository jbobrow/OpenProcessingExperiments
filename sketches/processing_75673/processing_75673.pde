
int dropCount = 9000;
int starCount = 10;
float[] dropSize = new float[dropCount];
float[] speed = new float[dropCount];
float[] xPosition = new float[dropCount];
float[] yPosition = new float[dropCount];
float[] xDirection = new float[dropCount];
float[] yDirection = new float[dropCount];
float[] xStar = new float[starCount];
float[] yStar = new float [starCount];
float[] starSize = new float [starCount];
float[] xDStar = new float[starCount];
float[] yDStar = new float [starCount];



void setup() {
  size(800, 800);
  for (int i=0; i < dropCount; i = i+5) {
    xPosition[i] = random(width);
    yPosition[i] = random(height);
    dropSize[i] = random(5, 10);
    speed[i] = random(5)+.5;
    xDirection[i] = 1;
    yDirection[i] = 1;
  }
}


void draw() {
  background(0);
  for (int i=0; i<dropCount; i = i+5) {
    if (xPosition[i] > width-dropSize[i]/2) {
      xDirection[i] = -1;
    }
    else if (xPosition[i] < dropSize[i]/2) {
      xDirection[i] = 1;
    }
    else if (yPosition[i] > height-dropSize[i]/2) {
      yDirection[i] = -1;
    }
    else if (yPosition[i] < dropSize[i]/2) {
      yDirection[i] = 1;
    }
    if (mousePressed == true) {
      fill(255, random(255));
      //xPosition[i] += speed[i] - xDirection[i];
      xDirection[i] = -1;
      yDirection[i] = -1;
      xPosition[i] = random(width);
      yPosition[i] = random(height);
      dropSize[i] = random(0, 3);
    }
    else {
      //fill(255);
      dropSize[i] = random(0, 5);
      fill(255);



      //xPosition[i] += speed[i] - xDirection[i];
      //yPosition[i] += speed[i] - yDirection[i];
    }


    // xPosition[i] += speed[i] * xDirection[i];
    // yPosition[i] += speed[i] * yDirection[i];

    fill(255);
    ellipse(xPosition[i], yPosition[i], dropSize[i], dropSize[i]);
  }
}



