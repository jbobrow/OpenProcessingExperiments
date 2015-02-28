
float xPos=0;
float yPos=0;
float yPosInvert=0;
float xPosInvert=0;
float xline=0;
int circlesize=0;
int circlex=0;

void setup() {//Start of void setup
  background(0);
  smooth();
  size(600, 600);
  yPos=height/2;
  xPos=height/2;
  yPosInvert=height/2-50;
  xPosInvert=height/2+50;
  circlex=height;
}
//End of void setup

//-----------------------------------------------------

void draw() {
  fill(0, 0, 0, 25);
  rect(0, 0, width, height);
  drawline();
  drawinvertedline();
  circle();
}

//-----------------------------------------------------

void drawline() {

  noStroke();
  fill(255, 40, 160);
  ellipse(xPos, yPos-random(height), 4, 4);

  xPos = xPos + random(9);

  if (yPos<300) {
    yPos = yPos+1;
  }
  else {
    yPos = yPos-25;
    xPos+=25;
  }


  if (xPos<width)
  {
    xPos+=1;
  }
  else {
    xPos=0;
  }
}

//-----------------------------------------------------

void drawinvertedline() {
  noStroke();
  fill(40, 250, 149);
  ellipse(xPosInvert, yPosInvert+random(height), 4, 4);

  xPosInvert = xPosInvert + (random(9));

  if (yPosInvert>300) {
    yPosInvert = yPosInvert-1;
  }
  else {
    yPosInvert = yPosInvert+25;
    xPosInvert+=25;
  }


  if (xPosInvert<width)
  {
    xPosInvert+=1;
  }
  else {
    xPosInvert=0;
  }
}

//-----------------------------------------------------

void circle() {
  if (circlex > 0) {
    ellipse((circlex)=(circlex)-10, (width/2), circlesize++, circlesize++);
  }
  else 
  {
    circlex = height;
    circlesize=0;
  }
}
