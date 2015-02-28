
float zLimit, zHorizon;
int nbEye = 50;
float[] z = new float[nbEye];
float[][] pulsEye = new float[nbEye][2];
float[] ampEye= new float[nbEye];
float[] posX= new float[nbEye];
float[] posY= new float[nbEye];

float deltaPulsDiv = PI/512;
float pulsDiv = 0;
float div = 0;

void setup() {
  size(600, 600);
  background(0);

  zLimit = 0;
  zHorizon = -100;
  
  
  for (int i=0;i<nbEye; i++) {
    z[i] = random(zHorizon);
    posX[i] = width/2 + random(-div,div);
    posY[i] = height/2 + random(-div,div);
    ampEye[i] = random(30);
    pulsEye[i][0] = random(6*PI);
    pulsEye[i][1] = random(6*PI);
  }
}

void draw() {
  background(0);
  pulsDiv += deltaPulsDiv;
  div = (width/2)*sq(sin(pulsDiv/2));
  println(div);
  for (int i=0; i<nbEye; i++) {
    drawEye(posX[i], posY[i], z[i], pulsEye[i][0], pulsEye[i][1],ampEye[i]);
    z[i] += 0.5;
    if (z[i] > zLimit) {
      z[i] = zHorizon;
      posX[i] = width/2 + random(-div,div);
      posY[i] = height/2 + random(-div,div);
      pulsEye[i][0] = random(6*PI);
      pulsEye[i][1] = random(6*PI);
      ampEye[i] = random(50);
    }
  }
}

void drawEye(float xPos, float yPos, float zPos, float pulsX, float pulsY, float amp) {
  pushStyle();
  float sizeEye;
  sizeEye = 200*(zPos-zHorizon)/(zLimit-zHorizon);

  fill(255, 255*(1-sizeEye/200));
  stroke(10, 255*(1-sizeEye/200));

  float xEye, yEye;
  xEye = xPos + amp*cos(pulsX*sizeEye/200);
  yEye = yPos + amp*sin(pulsY*sizeEye/200);
  ellipse(xEye, yEye, sizeEye, sizeEye);

  pushStyle();
  fill(0, 255*(1-sizeEye/200));
  noStroke();
  ellipse(xEye, yEye, sizeEye/2, sizeEye/2);
  popStyle();
  pushStyle();
  noStroke();
  ellipse(xEye - sizeEye/10, yEye - sizeEye/10, sizeEye/8, sizeEye/8);
  popStyle();
  popStyle();
}



