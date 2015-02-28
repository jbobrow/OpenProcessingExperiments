
float r1=0;
float g1=0;
float b1=0;
float rad1=0;
float K=random(5, 25);
float h=0;


float lMouse1=200;
float wMouse1=100;
float lMouse2=20;
float wMouse2=100;
float xClick=0;
float yClick=0;

float R=random(0, 255);
float G=random(0, 255);
float B=random(0, 255);
float mouseR=random(0, 255);
float mouseG=random(0, 255);
float mouseB=random(0, 255);
float maxIt=0;

int xC=0;
int counter;
int yC=0;
int numberCircles=100;
float floatLight=random(1, 3);
int darkLight=floor(floatLight);

color mouse=color(255, 255, 255, 255);

void setup() {
  size(928, 500);
  fill(255, 255, 255);
  frameRate(50);
  colorMode(HSB);
  counter=0;
}

void draw() {
  noStroke();
  if (mousePressed == true) {

    if (darkLight==1) {
      colorMode(RGB);
    }
    if (darkLight==2) {
      colorMode(HSB);
    }
    //consider keeping HSB mode.

    frameRate(1);
    maxIt=100;
    for (int i=0;i<maxIt;i++) {
      xClick=random(0, 928);
      yClick=random(0, 500);
      fill(0, 255, 0, 100);
      ellipse(xClick-100, yClick, 150, 75);
      fill(255, 255, 102, 100);
      ellipse(xClick-100, yClick, 50, 50);
      fill(0, 0, 0);
      ellipse(xClick-100, yClick, 15, 75);

      fill(0, 255, 0, 100);
      ellipse(xClick+100, yClick, 150, 75);
      fill(255, 255, 102, 100);
      ellipse(xClick+100, yClick, 50, 50);
      fill(0, 0, 0);
      ellipse(xClick+100, yClick, 15, 75);
    }
  }
  else {
    colorMode(HSB);
    frameRate(50);
    R=random(255);
    G=random(255);
    B=random(255);
    color one=color(R, G, B, K);
    color two=color(R, G, B, floor(K/3));

    for (int i=0;i<13;i++) {
      for (int j=0; j<7;j++) {
        xC=80*i;
        yC=80*j;
        r1=random(0, 255);
        g1=random(0, 255);
        b1=random(0, 255);
        rad1=80;
        fill(one);
        ellipse(xC, yC, rad1*sin(counter), rad1*sin(counter));
        fill(two);
        ellipse(xC+40, yC+40, rad1*sin(counter), rad1*sin(counter));
        counter++;
      }
    }
  }
}


