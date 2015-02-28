
//NFsGN=night flowers with green color
void NFsGN(float radius, float floraCX, float floraCY) {
  //frameRate(2);
  noStroke();
  float ta=2*PI*second()/60;
  float centX = floraCX+cos(ta)*30+random(2);
  float centY = floraCY+sin(ta)*30+random(3);
  float radiusNoise=random(10);
  fill(135+r, 155+r, 125+r,90);
  for (float ang=0;ang<=360;ang+=8) { 
    radiusNoise+=0.8;
    float thisRadius=radius+(noise(radiusNoise)*200)-100;
    float rad=radians(ang);
    x=centX+(thisRadius*cos(rad));
    y=centY+(thisRadius*sin(rad));
    ellipse(x, y, 4, 4);
  }
}

