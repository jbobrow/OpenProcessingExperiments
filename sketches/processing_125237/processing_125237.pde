
int r;
int v;
int b;
boolean pause;

void setup() {
  size(500, 500);
  //frameRate(5);
  background(255);
  pause = false;
}

void draw() {
  r = int(random(255));
  v = int(random(255));
  b = int(random(255));
  fill(r, 0, b, 50);
  noStroke();
  //background(r/*,v,b*/);
  rect(random(width), random(height), random(50), random(50));
}

void mouseClicked() {

  if (pause==false) {
    loop();
    pause=true;
  }
  else {
    noLoop();
    pause=false;
  }
}

