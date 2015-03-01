
int numCirc = 20;

float circleSize = 20.0;
float circleSpace = 10.0;

float topB = 10.0; //y
float bottomB = 630.0; //y
float leftB = 10.0; //x
float rightB = 630.0; 

float [] xP = new float [numCirc];
float [] yP = new float [numCirc];

float [] xV = new float [numCirc];
float [] yV = new float [numCirc];
float vSpeed = 5.0;

float [] xA = new float [numCirc];
float [] yA = new float [numCirc];

color [] colors = new color[numCirc];

void setup() {
  size(640, 640);
  
  for (int i = 0; i < colors.length; i++) {
    colors[i] = randomColor();
    xP[i] = (i+1)*circleSize + i*circleSpace;
    yP[i] = 320.0;
    xA[i] = 1-random(2);
    yA[i] = 1-random(2);
  }
}

void speed() {
  for (int i = 0; i < colors.length; i++) {

    xV[i] = xV[i] + xA[i];
    yV[i] = yV[i] + yA[i]; //velocity first!!!

    if (xV[i] > vSpeed) {
      xV[i] = vSpeed;
    }
    if (xV[i] < -vSpeed) {
      xV[i] = -vSpeed;
    }
    if (yV[i] > vSpeed) {
      yV[i] = vSpeed;
    }
    if (yV[i] < -vSpeed) {
      yV[i] = -vSpeed;
    }


    xP[i] = xP[i] + xV[i];
    yP[i] = yP[i] + yV[i];

    if (xP[i] < leftB) { //accelerance first!!!!
      xA[i] = -xA[i];
      xV[i] = -xV[i];
    }
    if (xP[i] > rightB) {
      xA[i] = -xA[i];
      xV[i] = -xV[i];
    }
    if (yP[i] < topB) {
      yA[i] = -yA[i];
      yV[i] = -yV[i];
    }
    if (yP[i] > bottomB) {
      yA[i] = -yA[i];
      yV[i] = -yV[i];
    }
  }
}

  void draw() {
    speed();
    background(255);
    for (int i = 0; i < colors.length; i++) {
      noStroke();
      fill(colors[i]);
      ellipse(xP[i], yP[i], circleSize, circleSize);
    }
  }

  color randomColor() {  //type of function 
    return color(random(1)*255, random(1)*255, random(1)*255);
  }

