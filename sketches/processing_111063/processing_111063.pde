
int N = 3; //numero de retangulos
 
float rectX[] = new float[N];
float rectY[] = new float[N];
float rectD[] = new float[N];
 //retangulos
void rect(float x, float y, float rX, float rY) {
  float theta = map(mouseX, 0.30, width, 0.30, PI);
  float x1 = x - rX * cos(theta);
  float x2 = x -  rX * sin(theta);
  float x3 = x + rX * sin(theta);
  float x4 = x + rX * cos(theta);
  float y1 = y - rY * cos(theta);
  float y2 = y - rY * sin(theta);
  float y3 = y + rY * sin(theta);
  float y4 = y + rY * cos(theta);
  quad(x1, y3, x3, y1, x4, y2, x2, y4);

  line(x1, y3, x1, height);
  line(x2, y4, x2, height);
  line(x3, y1, x3, height);
  line(x4, y2, x4, height);
}
 //tamanho do retangulo
void resetRects() {
  for (int i = 0; i < N ; i++) {
    rectX[i] = random(300);
    rectY[i] = random(300);
    rectD[i] = random(100, 100);
  }
}
 
void mouseClicked() {
  resetRects();
}
 
void setup() {
  size(600,600);
  resetRects();
}
 //cor e inclinação dos retângulos
void draw() {
  background(#9CC6B9);
  fill(#A53754);
  strokeWeight(5);
  for (int i = 0; i < N; i++)
    rect(rectX[i], rectY[i], rectD[i], 0.60 * rectD[i]);
}
