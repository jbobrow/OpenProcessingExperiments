
float delta= 0.04;
float xnoise= 0.1;
float ynoise= 0.1;
float znoise= 0;
float xstart=0;
float ystart= 0;

void setup () {
  size (1000, 800);
  background (57, 30, 75);
  smooth();
  frameRate (28);
  colorMode (HSB);
  xnoise = random (28);
  xstart = xnoise;
  ynoise = random (28);
  for (int i = 0; i < width; i++){
    ynoise += delta;
    xnoise = xstart;
    for (int j = 0; j < height; j++){
      xnoise +=delta;
      stroke(360*noise(xnoise,ynoise,znoise),255*noise(ynoise,xnoise,znoise),255);
      point (i, j);
    }
  }
}

void draw() {
  background (57, 30, 75);
  xnoise = xstart;
  ynoise = ystart;
  znoise += 1.5;
  for (int i = 0; i < width; i++){
     ynoise += delta;
    xnoise = xstart;
    for (int j = 0; j < height; j++){
      xnoise +=delta;
      stroke(360*noise(xnoise,ynoise,znoise),255*noise(ynoise,xnoise,znoise),255);
      point (i, j);
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    saveFrame("hsv-####.png");
  }
}


