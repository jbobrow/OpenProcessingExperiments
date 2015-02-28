
// Selon un concept de Simon Desjardins 

PImage serpentImg;

float cibleX,cibleY;

int morceaux = 30;
float[] serpentX;
float[] serpentY;


void setup() {
  size(400,400);
  serpentImg = loadImage("bouchard.png");
  imageMode(CENTER);
  smooth();

  
  
  serpentX = new float[morceaux];
  serpentY = new float[morceaux];
  
  noStroke();
}


void draw() {
  background(0);

  
  for ( int i = 0; i < morceaux-1; i++ ) {
    float ratio = i / (float) morceaux;
    serpentX[i] = ( serpentX[i+1] - serpentX[i]) / 7 + serpentX[i];
    serpentY[i] = ( serpentY[i+1] - serpentY[i]) / 7 + serpentY[i];
    fill(230*ratio,180*ratio,160*ratio); 
    ellipse(serpentX[i],serpentY[i],serpentImg.width * ratio * 0.75,serpentImg.height * ratio * 0.75);
  }
  
  int dernier = morceaux-1;
  serpentX[dernier] = ( cibleX - serpentX[dernier]) / 10 + serpentX[dernier];
  serpentY[dernier] = ( cibleY - serpentY[dernier]) / 10 + serpentY[dernier];
  image(serpentImg,serpentX[dernier],serpentY[dernier]);
 
}

void mousePressed() {


    cibleX = mouseX;
    cibleY = mouseY;
 
  
}


