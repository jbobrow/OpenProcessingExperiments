
ArrayList flowers;

int c = -1;
int gridX = 9;
int gridY = 3;
int numX, numY;
int frameCounter = 0, delaySec = 6;
void setup() {
  size (512, 160);
  frameRate(8);
  background(0);

  flowers = new ArrayList();
  flowers.add(new Circle (2*(width/gridX)+(width/gridX/2), 2*(height/gridY)+(height/gridY/2))); 
  blackDots();
}
void blackDots() {
  for (int i=0; i<gridX; i++) {
    for (int j=0;j<gridY;j++) {
      smooth();
      fill(100,0,0);
      noStroke();
      ellipse(i*(width/gridX)+(width/gridX/2), j*(height/gridY)+(height/gridY/2), 3, 3);
    }
  }
}

void draw() {
  background(0);

  blackDots();
  if (frameCount%8*2 == 0) {
    makeFlowers (getRandomNumX(), getRandomNumY());
    println("true");
  }
  displayFlowers();
  frameCounter++;
  //println(frameCounter);
}

void makeFlowers (int fingerX, int fingerY) {

      flowers.add(new Circle(fingerX*(width/gridX)+(width/gridX/2), fingerY*(height/gridY)+(height/gridY/2)));

}
int getRandomNumX() {
  int numX = int(random(gridX));
  println(numX);
  return numX;
}
int getRandomNumY() {
  int numY = int(random(gridY));
  return numY;
}
void displayFlowers() {
  for (int i = flowers.size()-1; i >= 0; i--) {
    //     circle[i].draw();
    Circle circle = (Circle) flowers.get(i);
    circle.draw();
    if (circle.finished()) {
      // Items can be deleted with remove()
      flowers.remove(i);
    }
  }
}


