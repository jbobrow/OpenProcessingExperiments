

float x, y;


void setup() {
  size(500, 500);
  background(255,255,240);
  strokeWeight(0.5);
  smooth();

  for (int i = 0; i < 5; i++) {
    for (int j = 0; j<5; j++) {
      RandomizeSpirals100(100*i+50, 100*j+50);
    }
  }
}


void RandomizeSpirals100(int centX, int centY) {

  float redSeed = round(random(1));
  float greenSeed = round(random(1));
  float blueSeed = round(random(1));
  float rotateSeed = random(random(1));




  for (int i = 0; i<100; i++) {
    float lastx = -999;
    float lasty = -999;
    float radiusNoise = random(10);
    float radius = 10;

    stroke(random(redSeed*0), random(greenSeed*255), random(blueSeed*255), 150);

    int startangle;
    int endangle;
    int anglestep;

    if (rotateSeed<0.5) {
      startangle = int(random(360));
      endangle = 360 + int(random(360));
      anglestep = 5 + int(random(3));

      for (float ang = startangle; ang <= endangle; ang += anglestep) {
        radiusNoise =0.03;
        radius += 0.5;
        float thisRadius = radius + (noise(radiusNoise))-50;
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
    else {    
      startangle = 360 + int(random(360));
      endangle = int(random(360));
      anglestep = (5 + int(random(3))) * -1;
   
 
      for (float ang = startangle; ang >= endangle; ang += anglestep) {
          radiusNoise =0.03;
          radius += 0.5;
          float thisRadius = radius + (noise(radiusNoise))-50;
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
}




void keyPressed() {
  if (keyCode == ENTER) {
    save("screen-##.jpg");
  }
}


