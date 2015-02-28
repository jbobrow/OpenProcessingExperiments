
//Two flowers rotating with some relationships v.1(still testing)
//Stella Wang, Tainan, 2013/11/06


void setup() {
  size(500, 700);
  //noLoop();
  frameRate(1);
}

void draw() {

  background(250);
  strokeWeight(1);


  /////////

  stroke(20, 50, 70);
  float x, y;
  int centX = 250;
  int centY = 150;
  float radius = 100;
  float lastx = -999;
  float lasty = -999;
  for (float ang=0; ang<=360; ang+=5) {
    float rad = radians(ang);
    x = centX + (radius * cos(rad));
    y = centY + (radius * sin(rad));
    flower1();
    flower2();
  }
  ///////
}

void flower1() {
  float radius = 100;
  int centX = 250;
  int centY = 250;

  float a = random(0, 100);
  stroke(180, a);
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
    if (lastx > -999) {
      line(x, y, lastx, lasty);
    }
    lastx = x;
    lasty = y;
  }
}

void flower2() {
  float radius = 10;
  int centX = 250;
  int centY = 700;

  float a = random(40, 90);
  stroke(217, 19, 80, a);
  radius = 1;
  float x, y;
  float lastx = -999;
  float lasty = -999;
  float radiusNoise = random(10);
  for (float ang=0; ang<=360*1; ang+=3) {
    radiusNoise += 0.05;
    radius += 0.5;

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



