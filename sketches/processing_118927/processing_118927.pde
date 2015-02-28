
//praticeM,by chen, wu-zhi
//noise practice

void setup() {
  size(900, 900);
  //noLoop();
  frameRate(1);
}
void draw() {
  //background(255);
  drawStarflower();
}
void drawStarflower() {
  radius = 10;
  linecol = color(255);
  fillcol = color(random(255), random(255), random(255));
  alph = random(5);
  strokeWeight(10);
  stroke(fillcol, alph);
  //fill(fillcol);
  float radius = 100;
  //float lastx = -999;
  //float lasty = -999;
  float radiusNoise = random(10);
  int x, y;
  int centX = random(width);
  int centY = random(height);
  int alph;

  for (float ang=0; ang<=360*10; ang+=5) {
    radiusNoise += 0.05;
    radius += 0.5;
    float thisRadius = radius + (noise(radiusNoise)*50) - 200;
    float rad = radians(ang);
    x = centX + (thisRadius * cos(rad));
    y = centY + (thisRadius * sin(rad));
    line(centX, centY, x, y);
    //ellipse(centX,centY,X,Y);
  }
}



