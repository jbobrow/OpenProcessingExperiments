
PImage creep;

void setup() {
  size (328, 194);
  background(255);
  creep = loadImage ("creep.png");
}

void draw () {
  noStroke();
  if (millis() < 5000 || millis() == 5000) {
    noStroke();
    fill (0);
    rect (0, 50, millis()/15, 100);
    fill(255);
    textSize(90);
    text (".  .  .  .  .", 0, 100);
  }
  else {
    int x = frameCount % 2;
    if (x == 0) {
      background(random(0, 255));
    } 
    else {
      image (creep, 0, 0);
    }
  }
}


