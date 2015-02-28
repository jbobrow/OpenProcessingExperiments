
// practice on noisy spirals
// by chen-hsin chang

void setup() {
  size(500, 300);
  background(255);
  smooth();
}

void draw() {

  if (mousePressed){
    background(255);
  }
  else {
    float radius =100;
    int centX =250;
    int centY = 150;
    stroke(mouseX,0,0, 20);
    noFill();
    // circle into spiral
    radius = 5;
    float x, y;
    float lastx = -999;
    float lasty = -999;

    ///set noise
    float radiusNoise = random(100);

    for (float ang=0; ang<=360*5; ang+=3) {
      radiusNoise += 0.05;
      radius += 0.5;
      float thisRadius = radius + (noise(radiusNoise)*300) -100;
      float rad = radians(ang);
      x= centX + (thisRadius* cos(rad));
      y= centY + (thisRadius* sin(rad));
      // circle into spiral 
      if (lastx> -999) {
        line(x, y, lastx, lasty);
      }
      lastx =x;
      lasty=y;
    }
  }

  //point(x, y);
}



