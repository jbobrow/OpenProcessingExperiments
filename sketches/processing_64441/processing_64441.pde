
int lineLength=20;
float[] x = new float[6000];
float[] y = new float[6000];
float[] angle = new float[6000];
int i=0;

float[] xP = new float[6000];
float[] yP= new float[6000];

void setup() {
 
  size(700,500);
  smooth();
  noStroke();
  fill(0,0,0,50);

  for (int i=0; i<1000; i++) {
    x[i] = random(0, 700);
    y[i] = random (0, 500);
    angle[i] = random(2*PI);
    ellipse(x[i], y[i], 50, 50);
     
    xP[i]=0;
    yP[i]=0;
 }
}
 
void draw() {
  background(255);
  for (int i=0; i<1000; i++) {
    if (dist(mouseX, mouseY, x[i], y[i])<1000&&dist(mouseY, mouseX, x[i], y[i])>random(0,60)) {
      angle[i]= atan2(y[i]-mouseY, x[i]-mouseX);
      if (mousePressed) {
        xP[i] += sin(angle[i]+PI)*10;
        yP[i]+= cos(angle[i]+PI)*10;
        x[i]+=cos(angle[i]+PI)*10;
        y[i]+=sin(angle[i]+PI)*10;
      } else {
        x[i] -= xP[i]/100;
        xP[i] -= yP[i]/100;
        y[i] -= yP[i]/100;
        yP[i] -= xP[i]/100;
      }
    }
    //ellipse(x[i], y[i], 50,50);
  
    ellipse(x[i], y[i], cos(angle[i])*50, cos(angle[i])*50);
  // ellipse(x[i], y[i], sin(angle[i])*50, sin(angle[i])*50);
  // ellipse(x[i], y[i], sin(angle[i])*50, cos(angle[i])*50);
  // ellipse(x[i], y[i], cos(angle[i])*50, sin(angle[i])*50);


  

  }
}


