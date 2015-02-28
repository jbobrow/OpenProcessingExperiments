
int lineLength=20;
float[] x = new float[6000];
float[] y = new float[6000];
float[] angle = new float[6000];
int i=0;

float[] xP = new float[6000];
float[] yP= new float[6000];

void setup() {

  size(700, 400);
  background(255);
  smooth();
  stroke(20,120,100);

  for (int i=0; i<6000; i++) {
    x[i] = random(0, 700);
    y[i] = random (0, 400);
    angle[i] = random(2*PI);
    line(x[i], y[i], x[i]+lineLength, y[i]+lineLength);
    rotate(radians(5));
    
    xP[i]=0;
    yP[i]=0;
  }
}

void draw() {
  background(255,0,0);
  for (int i=0; i<6000; i++) {
    if (dist(mouseX, mouseY, x[i], y[i])<100&&dist(mouseX, mouseY, x[i], y[i])>random(0,60)) {
      angle[i]= atan2(y[i]-mouseY, x[i]-mouseX);
      if (mousePressed) {
        xP[i] += cos(angle[i]+PI)*1;
        yP[i]+= sin(angle[i]+PI)*1;
        x[i]+=cos(angle[i]+PI)*1;
        y[i]+=sin(angle[i]+PI)*1;
      } else {
        x[i] -= xP[i]/10;
        xP[i] -= xP[i]/10;
        y[i] -= yP[i]/10;
        yP[i] -= yP[i]/10;
      }
    }

    line(x[i], y[i], x[i]+cos(angle[i])*lineLength, y[i]+sin(angle[i])*lineLength);
  }
}











