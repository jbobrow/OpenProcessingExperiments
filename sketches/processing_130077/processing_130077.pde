
// 100 spirals, with noise
// an example from Pearson (2011), pp.71-72
// revised to use setup() and draw()
// schien@mail.ncku.edu.tw
//re-code by jui chi lin
color clr;
void setup() {
  size(300, 300);
  background(255);
  strokeWeight(0.5);
  smooth();
  noLoop();
}

void draw() {
  // refresh
  background(255);

  int centX = width/2;
  int centY = height/2;
  float x, y;
  // draw 18 spirals
  for (int i = 0; i<18; i++) {                                         
    float lastx = -999;
    float lasty = -999;
    float radiusNoise = random(20);
    float radius = 10;
    clr = color(random(170, 255), random(80, 120), random(40, 120));
    stroke(clr);

    int startangle = int(random(360));                                  
    int endangle =  1250 + int(random(1250));                           
    int anglestep = 4+ int(random(5));
    for (float ang = startangle; ang <= endangle; ang += anglestep) {
      radiusNoise += 0.1;
      radius += 0.2;
      float thisRadius = radius + (noise(radiusNoise) * 200) - 100;
      float rad = radians(ang);
      x = centX + (thisRadius * cos(rad));
      y = centY + (thisRadius * sin(rad));
      if (lastx > -999) {
        line(x, y, lastx, lasty);
      }
      lastx = x;
      lasty = y;
    }
  }
}



