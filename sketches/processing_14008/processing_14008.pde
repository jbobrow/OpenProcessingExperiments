

float dotX[] = new float[30];
float dotY[] = new float[30];
void setup() {
  size(400,400);
  background (255,255,255);
  for (int i=0; i<30; i++) {
    dotX[i] = 200;
    dotY[i] = 200;
  }
}
void draw() {
  background (255,255,255);
  
  for (int i=29; i>0; i--) {
    dotX[i] = (dotX[i-1]-dotX[i])*0.2 + dotX[i];
    dotY[i] = (dotY[i-1]-dotY[i])*0.2 + dotY[i];
  }
  dotX[0] = (mouseX-dotX[0])*0.2 + dotX[0];
  dotY[0] = (mouseY-dotY[0])*0.2 + dotY[0];
  for (int i=29; i>=0; i--) {
    ellipse(dotX[i],dotY[i],10+i*5,10+i*5);
  }
}
