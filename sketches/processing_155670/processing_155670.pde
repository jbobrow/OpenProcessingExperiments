
ArrayList<Warp> warplist;
float xSeed = 0;
float ySeed = 0;
int bgOpacity = 32;

void setup() {
  size(500, 500);
  background(0);
  randomSeed(hour()+minute()+second()+millis());
  colorMode(HSB);
  warpWidth = 8;
  warpBorder = 0;
  bgOpacity = 32;
  warplist = new ArrayList<Warp> ();
  for (int i=0; i<10; i++) {
    warplist.add(new Warp((int)random(100)));
  }
}

void draw() {
  noStroke();
  fill(0, bgOpacity);
  rect(0, 0, width, height);
  noFill();
  translate(mouseX, mouseY);

  if (warplist.size() < 100) {
    warplist.add(new Warp((int)random(100)));
    warplist.add(new Warp((int)random(100)));
    warplist.add(new Warp((int)random(100)));
  }
  for (int i=0; i<warplist.size (); i++) {
    Warp thisWarp = warplist.get(i);
    if (thisWarp.move()) {
      warplist.remove(i);
      i--;
    }
  }

  if (keyPressed) {
    if (keyCode == LEFT) {
      bgOpacity = constrain(--bgOpacity, 0, 255);
    }
    if (keyCode == RIGHT) {
      bgOpacity = constrain(++bgOpacity, 0, 255);
    }
    if (keyCode == DOWN) {
      warpWidth = constrain(warpWidth /= 1.025, 1, int(width/5.0));
    }
    if (keyCode == UP) {
      warpWidth = constrain(warpWidth *= 1.025, 1, int(width/5.0));
    }
  }

  for (int i=0; i<warplist.size (); i++) {
    warplist.get(i).display();
  }
}

void keyReleased() {
  if (key >= '0' && key <= '9') {
    warpBorder = int(key - '0');
  }
  if (key == 's') {
    saveFrame("YourWarp.jpg");
  }
}
float warpWidth;
int warpBorder;

class Warp {
  int age;
  float angle;
  float wHue;
  
  Warp(int age_) {
    age = age_;
    angle = random(TWO_PI);
    wHue = random(360);
  }
  
  boolean move() {
    age++;
    return age>100;
  }
  
  void display() {
    pushMatrix();
    rotate(angle);
    for (int i=100; i>age; i--) {
      scale(0.975, 0.975);
    }
    stroke(0,192);
    fill(wHue,255,255,128);
    strokeWeight(warpBorder);
    ellipse(0, width, warpWidth, warpWidth*5);
    popMatrix();
  }
}


