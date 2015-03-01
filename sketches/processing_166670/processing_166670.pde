
float[] graphNums = {
  17, 22, 3, 0, 26, 15, 12, 14, 11, 17
};

void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  fill(255, 255, 0);
  strokeWeight(5);
  for (int i = 0; i < graphNums.length-1; i++) {
    float x1 = i * width/graphNums.length-1;
    float y1 =  (graphNums[i] * 10);
    float x2 = (i+1) * 40;
    float y2 =  (graphNums[i+1] * 10);
    stroke(255, 0, 0);
    line(x1, y1, x2, y2);
  }
  noLoop();
}
