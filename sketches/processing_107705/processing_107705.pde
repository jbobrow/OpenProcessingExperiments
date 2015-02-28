
float[] coswave; 

void setup() {
  size(640, 360);
  coswave = new float[width];
  for (int i = 0; i < width; i++) {
    float amount = map(i, 0, width, 0, PI);
    coswave[i] = abs(cos(amount));
  }
  background(0);

}

void draw() {

  int y1 = 0;
  int y2 = height/3;
  for (int i = 0; i < width; i+=3) {
    stroke(coswave[i]*0);
    line(i, y1, i, y2);
  }

  y1 = y2;
  y2 = y1 + y1;
  for (int i = 0; i < width; i+=3) {
    stroke(coswave[i]*355 / 4);
    line(i, y1, i, y2);
  }
  
  y1 = y2;
  y2 = height;
  for (int i = 0; i < width; i+=3) {
    stroke(coswave[i]* 0);
    line(i, y1, i, y2);
  }
  
}
