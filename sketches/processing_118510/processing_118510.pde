
//flower noise
//By Xinhan Yen,Email:archi730@hotmail.com
void setup() {
  size(500, 500);
  frameRate(3);
}
void draw() {
  background(255);
  strokeWeight(3);
  float radius = 100+random(50);
  int centX = 250;
  int centY = 150;
  float radiusNoise=random(10);
  stroke(0, 30);
  noFill();
  ellipse( width/2, height/2, 150, 150);
  stroke(20+random(50), 50+random(50), 70+random(50));
  for (float ang=0; ang<=360; ang+=5) {
    radiusNoise+=0.1;
    float thisRadius=radius+(noise(radiusNoise)*200)-100;
    float rad = radians(ang);
    x = centX + (thisRadius * cos(rad));
    y = centY + (thisRadius * sin(rad));
    point(x, y);
    line(x,y, width/2, height/2);
  }
}



