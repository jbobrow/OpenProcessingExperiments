
PImage moon;
int numOfRect=1000;
float posX[]= new float[numOfRect];
float posY[]= new float[numOfRect];
float pixColor;
float distFromMouse;
float mapDist;

void setup() {
  size(300, 300);
  moon=loadImage("moon.png");
  for (int i=0; i<numOfRect; i++) {
    posX[i]=random(0, 290);
    posY[i]=random(0, 290);
    noStroke();
    noFill();
    rect(posX[i], posY[i], 20, 20);
  }
}

void draw() {
  background(0);
  image(moon, 25, 25);
  for (int i=0; i<numOfRect; i++) {
    distFromMouse= dist(mouseX, mouseY, posX[i], posY[i]); 
    if (distFromMouse<=10) {
      color pixColor = moon.get(int(posX[i]), int (posY[i]));
      fill(pixColor);
      noStroke();
      rect(posX[i]+distFromMouse, posY[i]+distFromMouse, 10, 10);
    }
  }
}


