
//author:Robertlun,ncku arch
//purpose: homework. flowering flower
//concept:adding the star-liked flowers! click mouse to clear background.
//reference: from the teacher"Sheng-Fen Nik Chien."




int counter = 0; 

void setup() {
  size(800, 800);
  background(0);
  smooth();
  clearBackground();
}

void draw() {

  if (counter > 400) {
    clearBackground();
    counter = 0;
  }

  drawSpiral();
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
  float radiusNoise = random(20);
  float radius = 10;
  stroke(random(255), random(255), random(255), 40);
  strokeWeight(random(5));

  int startangle = int(random(360));                                  
  int endangle =  720 + int(random(720));                           
  int anglestep =  5 + int(random(3));
  for (float ang = startangle; ang <= endangle; ang += anglestep) {
    radiusNoise += 0.1;
    radius += 0.5;
    float thisRadius = radius + (noise(radiusNoise) * 100) - 50;
    float rad = radians(ang);
    x = centX + (thisRadius * cos(rad));
    y = centY + (thisRadius * sin(rad));
    if (lastx > -999) {
      line(x, y, lastx, lasty);
      // stroke(random(255), random(255), random(70), 80);
      strokeWeight(random(1));
      line(x, y, centX, centY);
    }
    lastx = x;
    lasty = y;
  }
}

void clearBackground() {
  background(0);
}

void mousePressed() {

  clearBackground();
}


