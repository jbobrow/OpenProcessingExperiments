
//Kang-Yu,Liu
//Perlin noise
//the red wiggly line draw at every moment
//until to be a red rectangle.
//20131023

void setup() {
  background(240, 30);
  size(500, 100);
  frameRate(3);
}

void draw() {
  
  strokeWeight(3);
  stroke(233);
  line(20, 70, 480, 70);
  line(20, 60, 480, 60);
  line(20, 50, 480, 50);
  line(20, 40, 480, 40);
  line(20, 30, 480, 30);

  strokeWeight(3);
  stroke(10, 10, 1);
  int step = 10;
  float nlevel = 0.1;
  float lastx = -999;
  float lasty = -999;
  float ynoise = random(10);
  float y=100;
  int border = 20;
  for (int x=border; x<=width-border;x+=step) {
    y = 20+noise(ynoise)*100;
    if (lastx > -999) {
      strokeWeight(noise(10,20)*5);
      stroke(random(110, 180), random(0,5), random(10, 15),230);
      line(x, y, lastx, lasty);
    }
    lastx = x;
    lasty = y;
    ynoise += nlevel;
  }
}



