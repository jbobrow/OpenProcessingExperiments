
float x;
float y;
float d;
float iH;
float iV;

void setup() {
  size(760,760);
  frameRate(10);
  smooth();
}

void draw() {
  background(0);
  
  x = 40;
  y = 120;
  d = 10;
  iH = 10;
  iV = 50;
  
  for(y = 40; y <= 720; y += iV) {
    for(x = 40; x <= 720; x += iH) {
      strokeWeight(random(0.5,3));
      stroke(255);
      noFill();
      ellipse(x,y+(random(20)),random(d),random(d));
    }
  }
}


