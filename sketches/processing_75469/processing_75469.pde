
Bunny[] flock = new Bunny[10];

void setup () {
  size(400, 400);
  smooth();
  for (int i=0;i<flock.length;i++) {
    flock[i] = new Bunny();
  }
}


void draw () {
  background(150);
    for (int i=0;i<flock.length;i++) {

  flock[i].drawBunny();
  flock[i].hop();
    }
}



/*
This is the bunny class example.
 */

class Bunny {
  //fields
  float x, y;
  color bColor;
  int bSize; //height of bunny


  // constructor
  Bunny() {

    x = random(width);
    y = random(height);

    if (random(1) > 0.5) {
      bColor = color (0);
    } 
    else {
      bColor=color(255);
    }
    bSize = int(random(40, 60));
  }

  // methods
  void hop() {
    x++;
  }
  void eat() {
  }
  void bMultiply() {
  }
  void drawBunny() {
    noStroke();
    fill(bColor);
    ellipse(x, y, bSize, bSize);
  }
}


