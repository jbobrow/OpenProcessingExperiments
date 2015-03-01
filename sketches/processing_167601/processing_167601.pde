
float[] xCoord = new float[100];
float [] yCoord = new float[100];
float [] speed = new float[100];
void setup() {
  size(750, 750);
  for (int i = 0; i < 100; i++) {
    speed[i] = random(  4, 20);
    xCoord[i] = random(width);
    yCoord[i] -= random(height);
  }
}

void draw() {
  fill(0,50);
  rect(-1,-1,width+1,height+1);
  stroke(mouseX,random(255), mouseX);
  for (int i = 0; i < 100; i++) {
    fill(0,200,0);
    int randNum = int(random(0,480));
    char randomCharacter = char(randNum);
    text(randomCharacter,xCoord[i], yCoord[i]);
   yCoord[i] += speed[i]; 
    if (yCoord[i] > height) {
      yCoord[i] = 0;
    }
    if (mousePressed){
      fill(random(255),random(255),random(255));
      text(randomCharacter,xCoord[i], mouseY);
      fill(random(255),random(255),random(255),0);
      stroke(random(255),random(255),random(255));
      rect(randomCharacter,randomCharacter,xCoord[i], mouseY);
      ellipse(randomCharacter,randomCharacter,xCoord[i], mouseX);
      yCoord[i] = mouseY;
    }
    }
  }

