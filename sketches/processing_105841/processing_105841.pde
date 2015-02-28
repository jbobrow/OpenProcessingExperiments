

PImage galaga;

//defines how many stars
int stars = 150;

int[] starSpeed = new int [stars];
int[] x = new int [stars];
int[] y = new int [stars];

void setup() {
  size (224, 288);
  galaga = loadImage("galaga.png");
  image(galaga, (width/2)-8, 250);

  for (int i = 0; i < stars; i++) {
    x[i] = int(random(0, 224));
    y[i] = int(random(0, 280));
    starSpeed[i] = int(random(1, 4));
  }
}

void draw() {
  background(0);
  rectMode(CENTER);
  image(galaga, (width/2)-8, 250);

  for (int i=0; i<stars; i++) {
    fill(255);
    rect(x[i], y[i], 2, 2);
  }

  for (int i=0;i<stars;i++) {
    y[i]+= starSpeed[i];
    if (y[i] > height) {
      y[i] = 0;
    }
  }
}


