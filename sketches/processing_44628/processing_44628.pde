
// a noisy spiral
// an example from Pearson (2011), pp.69-70
// revised to use setup() and draw()
// schien@mail.ncku.edu.tw

void setup() {
  size(500,300); 
  background(255); 
  strokeWeight(5); 
  smooth();
  noLoop();
}

void draw() {
  // refresh
  background(255);

  // set the radius and center point
  float radius = 100; 
  int centX = 250; 
  int centY = 150; 

  // draw the circle the easy way
  stroke(0, 30); 
  noFill(); 
  ellipse(centX,centY,radius*2,radius*2);

  // draw the circle in steps
  stroke(20, 50, 70); 
  radius = 10;
  float x, y; 
  float lastx = -999; 
  float lasty = -999; 
  float radiusNoise = random(10);
  for (float ang=0; ang<=360*4; ang+=5) {  
    radiusNoise += 0.05; 
    radius += 0.5;
    float thisRadius = radius + (noise(radiusNoise)*200) - 100;                 
    float rad = radians(ang);                                   
    x = centX + (thisRadius * cos(rad)); 
    y = centY + (thisRadius * sin(rad));  
    // the code that really form part of a circle
    if (lastx > -999) { 
      line(x,y,lastx,lasty);
    } 
    lastx = x; 
    lasty = y;
  }
}

void mousePressed() {
  redraw();
  saveFrame("spiral####.png");
}


