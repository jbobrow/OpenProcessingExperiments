
int xPos1 = 0;
int yPos1 = 0;
int xPos2= 70;
int yPos2=0;
int speeda = 5;
int speedb = 10;
int speedc =6;
int speedd=12;

void setup() {
  size(900, 600);
  smooth();
}

void draw() {
  background(255);

  // + speed to the xPos,yPos
  xPos1 = xPos1 + speeda;
  yPos1 = yPos1 + speedb;
  xPos2= xPos2 + speedc;
  yPos2= yPos2 + speedd;


  if ((xPos1 > width) || (xPos1 < 0)) {

    speeda = speeda * -1;
  }

  if ((xPos2 > width) || (xPos2 < 0)) {

    speedc = speedc * -1;
  }

  if ((yPos1> height) || (yPos1 < 0)) {

    speedb = speedb* -1;
  }

  if ((yPos2 > height) || (yPos2 < 0)) {

    speedd = speedd * -1;
  }
  
if (dist(xPos1,yPos1,xPos2,yPos2)<=50){
  
  speeda= speeda* -1;
  speedb=speedb*-1;
    speedc=speedc*-1;
      speedd=speedd*-1;
}

  stroke(0);
  fill(82, 90, 55, 15);
  ellipse(xPos1, yPos1, 50, 50);

  stroke(0);
  fill(253, 46, 255, 50);
  ellipse(xPos2, yPos2, 50, 50);
}


