
float x1Off = 0.0;
float x2Off = 0.0;
float y2Off = 0;
float rougeOff = 0;
float vertOff = 100;
float bleuOff = 1000;
float alphaOff = 10000;
float x1increment = 0.0006;
float x2increment = 0.0003;
float y2increment = 0.000000001;
float rIncrement = 0.05;
float vIncrement = 0.02;
float bIncrement = 0.005;
float aIncrement = 0.00002;


void setup() {
  size(1000, 1000);
  smooth();
  //frameRate(1);
  noStroke();
  //noLoop();
}


void draw() {
  background(255);
  pushMatrix();
  translate(width/2, height/2);
  rosace();
}

void mousePressed() {
  redraw();
}


void rosace() {
  for (float r = 0; r < 16*TWO_PI; r++) {
    int rouge = int (noise(rougeOff)*255);
    int vert = int (noise(vertOff)*255);
    int bleu = int (noise(bleuOff)*255);
    int alpha = int (noise(alphaOff)*255);
    fill(rouge, vert, bleu, alpha);
    //noFill();
    beginShape();
    vertex (0, 0);
    vertex (noise(x1Off)*350, 0);
    vertex (noise(x2Off)*350, noise(y2Off)*350);
    //vertex (0, 0);
    //vertex (random(225), 0);
    //vertex (random(225), random(225));
    endShape(CLOSE);
    rotate(r);
    x1Off += x1increment;
    x2Off += x2increment;
    y2Off += y2increment;
    rougeOff += rIncrement;
    vertOff += vIncrement;
    bleuOff += bIncrement;
    alphaOff += aIncrement;
  }
  popMatrix();
}

