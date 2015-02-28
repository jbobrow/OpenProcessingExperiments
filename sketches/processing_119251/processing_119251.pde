
// The wrong way to draw circle
//Firecracker
//chiming lu

void setup() {
  size(500, 500);
  //noLoop();
  frameRate(5);
}

void draw() {
  float a=random(10);
  int b=int(random(width));
  int c=int(random(height));

  // background(255); 


  strokeWeight(1); 
  Wcircle(a, b, c);
  Wcircle(a*100, 250, 250);
}


void Wcircle(float radius, int centX, int centY) {
  fill(255, 100);
  rect(-10, -10, width+10, height+10);
  stroke(20, 50, 70); 
  radius = 10;
  float x, y; 
  float lastx = -999; 
  float lasty = -999; 
  float radiusNoise = random(10);
  for (float ang=0; ang<=360*2; ang+=0.5) {
    radiusNoise += 0.05;
    radius += 0.05;    

    float thisRadius = radius + (noise(radiusNoise)*200) - 100;
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



