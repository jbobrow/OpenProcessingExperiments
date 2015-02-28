
float xPos;
float yPos;
float speedX;
float speedY;
float[] xLocs;
PImage img;

RandomGrid g = new RandomGrid(200);
  
void setup () {
  size(400,400);
  noStroke();
  xPos = width / 2;
  yPos = width / 2;
  speedX = 0;
  speedY = 0;
  xLocs = g.genGrid();  
  img = loadImage("stardust.png");
}

void draw () {
  
  background(255);
  
  image(img,pmouseX/-10 - 50,pmouseY/-10 - 50);
  
  if (mousePressed) g.moveObj();
 

  xPos = xPos - pmouseX/200 + speedX;
  yPos = yPos - pmouseY/200 + speedY;
  
  g.bounce();
  g.decelerate();
  g.decorate();
  
}

class RandomGrid {
  int arrSize;
  RandomGrid(int aSize) {
    arrSize = aSize;
  }
  void decelerate () {
    speedX = speedX * 0.995;
    speedY = speedY * 0.990;
  }
  void bounce () {
    if (xPos > width - 30 || xPos <= 30) speedX = -speedX;
    if (yPos > height - 30 || yPos <= 30) speedY = -speedY;
  }
  void moveObj () {
      speedX = mouseX - pmouseX;
      speedY = mouseY - pmouseY;
  }
  void decorate () {
    for ( int i = 0; i < arrSize; i++ ) {
      fill(150 - mouseX + xLocs[i] * 1.5,225 - mouseY + xLocs[i],150);
      rect(xPos + i + xLocs[i] - width/2 , yPos + i - xLocs[i],xLocs[i]/2,xLocs[i]/2);
    }
  }
  float[] genGrid () {
    float[] xLocs = new float[arrSize];
    for (int i = 0; i < arrSize; i++) {
      xLocs[i] = random(0,height/2);
    }
    return xLocs;
  }
}


