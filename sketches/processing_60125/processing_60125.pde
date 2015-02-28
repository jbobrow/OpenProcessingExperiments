
float x = 0;
int lngth = 5;
int hght = 5;
float r = 0.1;
float ran = 1;
int count = 0;

int repeat = 1000;

void setup() {
  size(360, 555);
  background(115, 155, 190);
  smooth();
  stroke(234, 30);
  fill(234, 25);

  while (count < repeat) {
    x = 0;
    while (x < 500) {
      translate(width/2, height/2);
      rectMode(CENTER);
      rotate(r);
      rect(x, x, lngth, hght);
      x = x + 10 + random(-ran, ran);
      r = r + 0.1;
      translate(-width/2, -height/2);
    }  
    count++;
  }
}

void draw() {
}

void mousePressed() {
  save(frameCount+".jpg");
  
}


