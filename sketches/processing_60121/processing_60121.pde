
float x = 0;
int lngth = 5;
int hght = 5;
float r = 0.1;


void setup() {
  size(360, 555);
  background(115, 155, 190);
  smooth();
  stroke(234, 30);
  fill(234, 25);

}

void draw() {
  
      x = 0;
    while (x < 500) {
      rectMode(CENTER);
      rotate(r);
      rect(x, x, lngth, hght);
      x = x + 10;
      r = r + 0.1;
    }  
}

void mousePressed() {
  save(frameCount+".jpg");
  
}


