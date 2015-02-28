
//See how two flowers weaving to take form by rotating patterns.
//Patterns in process like flowers as well.
//Patterns like waves mean the curved surfacesurface of petal.
//Stella Wang, Tainan, 2014/01/26

int c = 1;

void setup() {
  size(500, 700);
  frameRate(50);
}

void draw() {
  background(240);
  strokeWeight(0.4);
  noFill();

  //flower
  int centX = 250;
  int centY = 250;
  float radius = 1;
  float x, y;
  float lastx = -999;
  float lasty = -999;
  float radiusNoise = random(10);

  //flower-s
  int centsX = 350;
  int centsY = 350;
  float radiuss = 5;
  float xs, ys;
  float lastsx = -999;
  float lastsy = -999;
  float radiussNoise = random(100);

  if (c <= 718) {
    c++;
  }
  println(c);
  for (float ang=-999; ang<=720; ang+=(720-c)) {
    float a = random(60)+10;
    radiusNoise *= 0.05;
    radius += 5;
    float thisRadius = radius*0.1 + noise(radiusNoise)*200;
    float rad = radians(ang);
    x = centX + (thisRadius * cos(rad));
    y = centY + (thisRadius * sin(rad));

    radiussNoise *= 0.05;
    radiuss += 30;
    float thisRadiuss = radiuss*0.1 + noise(radiussNoise)*20;
    float rads = radians(ang);
    xs = centsX + (thisRadiuss * cos(rads));
    ys = centsY + (thisRadiuss * sin(rads));

    //draw flower and flower-s
    //The next outline was decided by the last trace.
    line(width/2 - x/2, height/2 - y/2, lastx, lasty);
    pushMatrix();
    translate(200, 250);
    stroke(random(100), random(120), random(250), a+50);
    line(centsX - lastsx, centsY - lastsy, lastx, lasty);
    ellipse(centsX - lastsx, centsY - lastsy, lastx*2, lasty*2);
    rotate(30);
    //ellipse(centX - lastx, centY - lasty, lastx - lastsx, lasty - lastsy);
    rotate(180);
    stroke(random(100, 200), random(120), random(50), a+60);
    ellipse(centX - lastx, centY - lasty, lastx - lastsx, lasty - lastsy);
    popMatrix();

    lastx = x;
    lasty = y;
    lastsx = xs;
    lastsy = ys;
  }
  noStroke();
  fill(240, 60);
  rect(0, 0, width, height);
}

void keyPressed() {
  saveFrame("flowerweaving###.png");
}



