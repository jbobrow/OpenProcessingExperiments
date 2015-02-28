
//noise nightFlower
//by Xinhan Yen,Email:archi730@hotmail.com
//NFsGN(random()+A,centerX,centerY)
///random()>>>density of Saturn's ring
//A>>>the radius of the ring
int r=random(50);
int p=random(10);
int q=random(2);

void setup() {
  size(1000, 500);
}
void draw() {
  fill(25, 99);
  noStroke();
  rect(0, 0, 1000, 500);
  NFsGN(random(150), 150, 400);
  NFsGN(random(150), 300, 350);
  NFsGN(random(150), 700, 350);
  NFsGN(random(150), 850, 400);
  //
  NFsGN(random(150), 200, 250);
  NFsGN(random(150), 500, 250);
  NFsGN(random(150), 500, 250);
  NFsGN(random(150), 800, 250);
  //
  NFsGN(random(150), 150, 100);
  NFsGN(random(150), 300, 150);
  NFsGN(random(150), 700, 150);
  NFsGN(random(150), 850, 100);
  //NFsYW(random(120)+50, 250, 100);
  //NFsYW(random(60)+50, 500, 100);
  //NFsYW(random(120)+50, 750, 100);
  NFsRD(random(40)+70, 400, 150);
  NFsRD(random(40)+70, 600, 150);
  //NFsYW(random(120)+50, 750, 200);
  //NFsYW(random(120)+50, 250, 300);
  NFsRD(random(40)+70, 500, 250);
  //NFsYW(random(120)+50, 750, 300);
  NFsRD(random(40)+70, 400, 350);
  NFsRD(random(40)+70, 580, 350);
  //NFsYW(random(120)+50, 750, 400);
}

//makes NightFlowers(NFs) control with(A,B,C)
//A=NFs radius
//B=NFs center X coordianate position
//C=NFs center Y coordianate position

//NFsGN=night flowers with green color
void NFsGN(int radius, int floraCX, int floraCY) {
  frameRate(2);
  noStroke();
  float ta=2*PI*second()/60;
  int centX = floraCX+cos(ta)*30;
  int centY = floraCY+sin(ta)*30;
  float radiusNoise=random(10);
  fill(135+r, 155+r, 125+r);
  for (float ang=0;ang<=360;ang+=8) { 
    radiusNoise+=0.3;
    float thisRadius=radius+(noise(radiusNoise)*200)-100;
    float rad=radians(ang);
    x=centX+(thisRadius*cos(rad));
    y=centY+(thisRadius*sin(rad));
    ellipse(x, y, 4-q, 4-q);
  }
}
//NFsYW=night flowers with yellow color
void NFsRD(int radius, int floraCX, int floraCY) {
  frameRate(2);
  noStroke();
  float ta=2*PI*second()/60;
  int centX = floraCX+cos(ta)*30;
  int centY = floraCY+sin(ta)*30;
  float radiusNoise=random(10);
  fill(142+r, 89+r, 105+r);
  for (float ang=0;ang<=360;ang+=4) { 
    radiusNoise+=0.4;
    float thisRadius=radius+(noise(radiusNoise)*200)-100;
    float rad=radians(ang);
    x=centX+(thisRadius*cos(rad));
    y=centY+(thisRadius*sin(rad));
    ellipse(x, y, 4, 4);
  }
}



