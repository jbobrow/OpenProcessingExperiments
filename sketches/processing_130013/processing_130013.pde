
int nShapes = 20;

int alpha = 0;
int sizeH = 0;
int sizeW = 0;
float posY[] = new float[nShapes];
float posX []= new float[nShapes];
float speed[] = new float[nShapes];
float shapeColR[] = new float[nShapes];
float shapeColB[] = new float[nShapes];
float shapeColG[] = new float[nShapes];

void setup() {
  size (500, 500);
  smooth();
  frameRate(10);
  for (int n=0; n<nShapes; n++) {
    posY[n]=random(15, 485);
    posX[n]=random(15, 485);
    speed[n]=random(10);
    shapeColR[n]=random(75, 80);
    shapeColB[n]=random(80, 180);
    shapeColG[n]=random(150, 180);
  }
}

void draw() {
  background(255);
  noStroke();
  alpha+=2;
  sizeH+=1.5;
  sizeW+=1.5;
  for (int n=0; n<nShapes; n++) {
    ellipse (posX[n], posY[n], sizeH, sizeW);
    fill (shapeColR[n], shapeColG[n], shapeColB[n], alpha);
    if (sizeH>400) {
      alpha=0; 
      sizeH=0;
      sizeW=0;
    }
  }
}

void keyPressed() {
  if (keyPressed) {
    alpha=0; 
    background(255);
    for (int n=0; n<nShapes; n++) {
      //can't reset or reverse size at pressing
      posY[n]=random(15, 485);
      posX[n]=random(15, 485);
      shapeColR[n]=random(75, 80);
      shapeColB[n]=random(80, 180);
      shapeColG[n]=random(150, 180);
      if (keyPressed) {
        alpha=0;
      }
    }
  }
}
