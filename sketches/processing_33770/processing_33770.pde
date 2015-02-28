
int xPos[]=new int [400];
int yPos[]=new int [400];
int clicks = 0;

void setup() {
  size (400, 400);
}

void draw() {
  background (0);

  for (int i = 0; i<400 && i<clicks; i++) {
    fill(210,0,0);
    ellipse(xPos[i], yPos[i], 40, 40);

    if (i>0){
      stroke(255);
      line(xPos[i-1], yPos[i-1], xPos[i], yPos[i]);
    }
  }
}

void keyPressed() {
  if(key=='a'){
  xPos[clicks]=mouseX;
  yPos[clicks]=mouseY;
  clicks++;
  }
}

