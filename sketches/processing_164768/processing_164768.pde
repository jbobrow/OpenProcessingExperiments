
float[] graphNums = {
  17, 22, 3, 0, 26, 15, 12, 14, 11, 17
};
float[] xCoord = new float[100];
float[] yCoord = new float[100];
float[] gottagofast = new float[100];


void setup() {
  size(500, 350);
  for (int i = 0; i < 100; i++) {
    xCoord[i] = random(width);
    yCoord[i] = random(height);
    gottagofast[i] = random(4, 7);
  }
}



void draw() {

  background(0);
  fill(255, 255, 0);
  for (int i = 0; i < graphNums.length-1; i++) {
    float x1 = i * 40;
    float y1 =  (graphNums[i] * 10);
    float x2 = (i+1) * 40;
    float y2 =  (graphNums[i+1] * 10);
    stroke(random(255));
    line(x1, y1, x2, y2);
  }
  strokeWeight(5);
  stroke(random(255),random(255),random(255));
  for (int i = 0; i < 100; i++) {
    point(xCoord[i], yCoord[i]);
    yCoord[i]+=1;
    yCoord[i] += gottagofast[i];
    if (yCoord[i]>height) {
      yCoord[i] =0;
    }
  }
}

