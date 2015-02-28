
PImage duck;

int xPos[]=new int [100];
int yPos[]=new int [100];
int clicks = 0;

void setup() {
  size (500, 500);
    duck=loadImage ("duck.jpg");

}

void draw() {
 fill(xPos[3],yPos[10], (xPos[4]+yPos[4]));
  for (int i = 0; i<100 && i<clicks; i++) {
    ellipse(xPos[i], yPos[i], 40, 40);

    if (i>0){
      line(xPos[i-1], yPos[i-1], xPos[i], yPos[i]);
    }
  }
}

void mousePressed() {
  xPos[clicks]=mouseX;
  yPos[clicks]=mouseY;
  clicks++;
}


