
int step = 10;
int r = 20;
float y;

void setup() {
  size(700,700);
  background(255);
  strokeWeight(5);
  smooth();
  frameRate(8);
}

void draw() {
  float lastx = -999;
  float lasty = -999;
  float ynoise = random(5);
  float ycount = 1;
  
  fadeToWhite();
  
  for (int h=0; h<height; h+=r) {
    stroke(0);
    for (int x=0; x<=width; x+=step) {
      y = 10 + noise(ynoise) * 80;
      if (lastx>-999) {
        line(x, y*ycount, lastx, lasty*ycount);
      }
      lastx = x;
      lasty = y;
      ynoise += 0.2;
    }
    translate(0, r);
    lastx = -999;
    lasty = -999;
    ycount +=0.03;
    strokeWeight(random(3,5));
  }
}

void fadeToWhite() {
  noStroke();
  fill(255,90);
  rect(0,0,width,height);
}

