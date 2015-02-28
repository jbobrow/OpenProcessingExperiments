
//Class test- sunflower
//Clark Li
//Try to make the image of Sunflower. When

void setup() {
  size(550, 350);
  background(250);
  frameRate(6);
}

void draw() {

  strokeWeight(1);
  int centX=width/2;
  int centY=height/2;
  float radius=65;
  stroke(0, 30);
  noFill();

  stroke(255, 240, 0, 30);
  radius = 80;
  float x, y;
  float lastx=-999;
  float lasty=-999;
  float radiusrandom=random(50);
  for (float ang=2; ang<=360*5;ang+=10) {
    radiusrandom+=0.3;
    radius+=0.5;
    float thisRadius=radius+(noise(radiusrandom)*200)-80;
    float radian = radians(ang);
    x=centX + (thisRadius*cos(radian));
    y=centY+(thisRadius*sin(radian));

    if (lastx>-999) {
      line(x, y, lastx, lasty);
    }
    lastx=x;
    lasty=y;
  }


  stroke(106, 57, 6, 30);
  radius = 10;

  for (float ang=3; ang<=360*5;ang+=10) {
    radiusrandom+=0.1;
    radius+=0.5;
    float Radius=radius+(noise(radiusrandom)*200)-100;
    float radian = radians(ang);
    x=centX + (Radius*cos(radian));
    y=centY+(Radius*sin(radian));

    if (lastx>-999) {
      line(x, y, lastx, lasty);
    }
    lastx=x;
    lasty=y;
  }
}



