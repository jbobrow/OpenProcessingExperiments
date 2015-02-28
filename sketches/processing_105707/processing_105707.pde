
int xPos=0;
int cPos=-15;
int time=1;
boolean mouseIndicator=false;

void setup() {
  smooth();
  size(800, 200);
  noStroke();
}

void draw() {

  //this sets the background color to day or night
  if (mouseIndicator==true) {
    fillNight();
  }
  else {
    fillDay();
  }
  rect(0, 0, width, height);


  //grass screen width
  for (int i=0; i<width; i=i+2) {
    drawGrass(i, 197);
  }

  //houses screen width
  for (int i=0; i<width; i=i+80) {
    drawHouse(i+20, height-40);
  }

  //set sun fill color
  if (mouseIndicator==true) {
    fill(255);
  }
  else {
    fill(240, 224, 75);
  }  
  //sun postion and move
  if (xPos<width) {
    xPos=xPos+1;
  }
  else {
    xPos=0;
  }
  //draw sun
  drawSun(xPos, height/3);

  //cloud fill color
  if (mouseIndicator==true) {
    fill(34,63,113);
  }
  else {
    fill(255);
  }  

  //cloud postion and move
  if (cPos<width) {
    cPos=cPos+1;
  }
  else {
    cPos=0;
  }
  //this draws the cloud
  drawCloud(cPos+5, height/2-20);
}
void drawGrass(int xPos, int yPos) {
  fill(24, 180, 43);
  rect(xPos, 193, 1, 10);
}

void drawHouse(int xPos, int yPos) {
  fill(183, 126, 4);
  rect(xPos, yPos, 40, 40);
  fill(222, 199, 152);
  rect(xPos+10, yPos+15, 20, 25);
  fill(245, 33, 0);
  triangle(xPos, yPos, xPos+20, yPos-20, xPos+40, yPos);
}

void drawSun(int xPos, int yPos) {
  ellipse(xPos, yPos, 40, 40);
}

void drawCloud (int xPos, int yPos) {
  ellipse(xPos, yPos, 20, 20);
  ellipse(xPos-30, yPos+5, 30, 30);
  ellipse(xPos-20, yPos, 40, 40);
  ellipse(xPos-35, yPos-5, 20, 20);
  ellipse(xPos-45, yPos, 20, 20);
}

void fillDay() {
  fill(174, 240, 242);
}

void fillNight() {
  fill(7, 33, 82);
}

void mousePressed() {
  mouseIndicator= !mouseIndicator;
}



