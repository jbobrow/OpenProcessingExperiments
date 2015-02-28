
float[] chicken = new float[5];
float radius = 10;
float xStep = radius*3;

void setup() {
  size(200, 100);
  background(255);
  smooth();
  for (int i = 0; i < chicken.length; i ++) {
    chicken[i] = random(0, 255.00001);
  }
}

void draw() {
  noStroke();
  drawEllipses();
  updateFill();
}

void drawEllipses() {
  for (int i = 0; i < chicken.length; i ++) {
    fill(chicken[i]);
    ellipse((i+1)*xStep, height/2, 30, 30);
  }
}

void updateFill(){
  for (int i = 0; i < chicken.length; i ++) {
    if (chicken[i]>255) {
      chicken[i] = 0;
    } 
    else {
      chicken[i] +=1;
    }
  }
}
