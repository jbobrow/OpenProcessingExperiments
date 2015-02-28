
PImage img;
int numCircle = 20;
float[] cirX = new float[numCircle];
float[] cirY = new float[numCircle];
float newY;
rainbow myRainbow;

void setup() {
  size(925, 521);
  smooth();

  img = loadImage("data/throwing.png");

  for (int i = 0; i < numCircle; i++) {
    cirX[i] = random(0, 925);
    cirY[i] = random(0, 521);
  }

  myRainbow =new rainbow();
}



void draw() {
  image(img, 0, 0);
  lensflare();

  if (mousePressed ==true) {
    myRainbow.display();
  }
}


//draw lens flare
void lensflare() {
  noStroke();  
  fill(random(254, 256), random(255, 256), random(157, 256), random(50));
  for (int i=0; i < numCircle; i++) {
    ellipse(cirX[i], cirY[i], 40, 40);
  }
}


