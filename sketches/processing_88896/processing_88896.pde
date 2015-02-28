
//int rate = 3000; // 1000 = 1 second
int thickness = 3;
int opacity = 50;
int margin = 50;

void setup () {
  size(950, 527); // screen.width, screen.height
  noCursor();
  smooth();
  frameRate(1);
}

void draw () {
  fill(255, 255, 255, opacity);
  strokeWeight(0);
  rect(0, 0, width, height);
  strokeWeight(random(0, thickness));
  line(random(margin, width-margin),
       random(margin, height-margin),
       random(margin, width-margin),
       random(margin, height-margin));
  //delay(rate);
}
