
//2013/10/23
//trying out perlin noise
//juichilin
void setup() {
  size(500, 100);
  noLoop();
}
void draw() {
  background(255);
  strokeWeight(5);
  stroke(0, 30);
 
  stroke(20, 50, 70);
  int step = 10;
  float nlevel = 0.1;
  float lastx = -999;
  float lasty = -999;
  float ynoise = random(20);
  float y;
  int border = 20;
  for (int x=border; x<=width-border;
x+=step) {

    y = 10 + noise(ynoise)*80;
    stroke(noise(255), noise(50), random(255),random(255));
    if (lastx > -999) {
      line(x, y, lastx, lasty);
    }
    lastx = x;
    lasty = y;
    ynoise += nlevel;
  }
}



