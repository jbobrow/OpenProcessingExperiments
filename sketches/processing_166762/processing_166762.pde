
float[] graphNums = {
  30, 12, 23, 0, 21, 16, 7, 11, 10, 17
};

void setup() {
  size(400, 400);
}


void draw() {
  background(223);
  for (int i = 0; i < graphNums.length-1; i++) {
    float x1 = i * 50;
    float y1 =  (graphNums[i] * 20);

    float x2 = (i+1) * 50;
    float y2 =  (graphNums[i+1] * 20);

    line(x1, y1, x2, y2);
  }
  noLoop();
}

