
int xPos[]=new int [100];
int yPos[]=new int [100];
int clicks = 0;

void setup() {
  size (500, 500);
}

void draw() {
  background (255);
  strokeWeight(1);
  for (int i = 0; i<100 && i<clicks; i++) {
    fill(0,0,0);
    rect(xPos[i]-1, yPos[i]-1, 2, 2);

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


