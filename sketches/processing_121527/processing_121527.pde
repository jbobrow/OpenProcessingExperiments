
int shipXPos; 
PImage galaga;
int stars = 200;
int[] starSpeed = new int [stars];
int[] x = new int [stars];
int[] y = new int [stars];

void setup() {
  size (224, 288);
  galaga = loadImage("galaga.png");
  image(galaga, (width/2)-8, 250);
  shipXPos = (width/2)-8;

  for (int i = 0; i < stars; i++) {
    x[i] = int(random(0, 224));
    y[i] = int(random(0, 280));
    starSpeed[i] = int(random(1, 5));
  }
}
void draw() {
  background(0);
  rectMode(CENTER);

  for (int i=0; i<stars; i++) {
    fill(255);
    rect(x[i], y[i], 2, 2);
  }

  for (int i=0;i<stars;i++) {
    y[i]+= starSpeed[i];
    if (y[i] > height) {
      y[i] = 0;
    }
    image(galaga, shipXPos, 250);
    text("p r e s s    l e f t    o r    r i g h t", 30, 30);
    text("t o    m o v e    t h e    s h i p", 40, 45);
  }
  if (shipXPos == 200) { 
    shipXPos-=1;
  }
  if (shipXPos == 10) { 
    shipXPos+=1;
  }
  if (key == CODED) {
    if (keyPressed == true) {
      if (keyCode == RIGHT) {
        shipXPos+=1;
      }
      else {
        if (keyCode == LEFT) {
          shipXPos-=1;
        }
        else {
          shipXPos=shipXPos;
        }
      }
    }
  }
}


