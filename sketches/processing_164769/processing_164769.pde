
float[] graphNums = {
  17, 22, 3, 0, 26, 15, 12, 14, 11, 17
};
float[] xCoord = new float[100];
float[] yCoord = new float[100];
float[] rate=new float[100];

void setup() {
  size(400, 300);
  for (int i = 0; i < 100; i++) {
    xCoord[i] = random(width);
    yCoord[i] = random(height);
    rate[i]=random(1, 3);
  }
}
 
void draw() {
 
  background(random(255), random (255), random(255));
  stroke(random(255),random(255), random(255));
  strokeWeight(random(0,40));
  for (int i = 0; i < graphNums.length-1; i++ ) {
    float x1 = i *40 ; 
    float y1 =  (graphNums[i] * 10  );
 
    float x2 = (i+1) * 40;
    float y2 =  (graphNums[i+1]  * 10);
 
    line(x1, y1, x2, y2);
  }
  strokeWeight(4);
  for (int i = 0; i < 100; i++) {
    line(xCoord[i], yCoord[i], xCoord[i], yCoord[i] - 9);
    yCoord[i] +=rate[i];
    if (yCoord[i] >height) {
      yCoord[i] = 0;
    }
  }
}

