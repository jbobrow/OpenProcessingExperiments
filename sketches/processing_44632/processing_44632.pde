
// 100 spirals, with noise
// an example from Pearson (2011), pp.71-72
// revised to use setup() and draw()
// schien@mail.ncku.edu.tw

void setup() {
  size(500,300); 
  background(255); 
  strokeWeight(0.5); 
  smooth();
  noLoop();
}

void draw() {
  // refresh
  background(255);

  int centX = 250; 
  int centY = 150; 
  float x, y; 
  // draw 100 spirals
  for (int i = 0; i<100; i++) {                                          
    float lastx = -999; 
    float lasty = -999; 
    float radiusNoise = random(10); 
    float radius = 10;
    stroke(random(20), random(50), random(70), 80);

    int startangle = int(random(360));                                   
    int endangle =  1440 + int(random(1440));                            
    int anglestep =  5 + int(random(3));
    for (float ang = startangle; ang <= endangle; ang += anglestep) { 
      radiusNoise += 0.05; 
      radius += 0.5; 
      float thisRadius = radius + (noise(radiusNoise) * 200) - 100; 
      float rad = radians(ang); 
      x = centX + (thisRadius * cos(rad)); 
      y = centY + (thisRadius * sin(rad)); 
      if (lastx > -999) { 
        line(x,y,lastx,lasty);
      } 
      lastx = x; 
      lasty = y;
    }
  }
}

void mousePressed() {
  redraw();
  saveFrame("spiral####.png");
}


