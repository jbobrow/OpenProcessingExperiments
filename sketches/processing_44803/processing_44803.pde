
// a bed of 100 flowers
// adopted from 100 spirals in Pearson (2011)
// schien@mail.ncku.edu.tw

int counter = 0;  // flower counter

void setup() {
  size(500,300); 
  background(255); 
  smooth();
  clearBackground();
}

void draw() {
  // refresh the screen if more than 100 flowers drawn
  if (counter > 100) {
    clearBackground();
    counter = 0;
  }
  
  drawSpiral();
  delay(300);
  
  counter++;
}

void drawSpiral () { 
  float x, y;   
  int centX = int(random(width)); 
  int centY = int(random(height)); 
  float lastx = -999; 
  float lasty = -999; 
  float radiusNoise = random(10); 
  float radius = 10;
  stroke(random(100,255), random(255), random(70), 80);
  strokeWeight(random(5));

  int startangle = int(random(360));                                   
  int endangle =  720 + int(random(720));                            
  int anglestep =  5 + int(random(3));
  for (float ang = startangle; ang <= endangle; ang += anglestep) { 
    radiusNoise += 0.05; 
    radius += 0.5; 
    float thisRadius = radius + (noise(radiusNoise) * 100) - 50; 
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

void clearBackground() {
  background(255);
}

void mousePressed() {
  saveFrame("spiral####.png");
  clearBackground();
}


