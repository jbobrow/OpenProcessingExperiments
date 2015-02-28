
background(#000000);

size(625, 625);

stroke(0, 50);
strokeWeight(1);

float centerX = width/2;
float centerY = height/2;
float _radius = 300;

float noisel = random(10);

for(float _angle = 0; _angle < 1000; _angle += 0.5) {
  float proportion = ((_angle) % 65) / 65;
  stroke(#FFFFFF, proportion * 100);
  float thisRadius = _radius * (0.75 - proportion + 0.75 * noise(noisel));
  
  float rad = radians(_angle);
  float x1 = centerX + (thisRadius * cos(rad));
  float y1 = centerX + (thisRadius * sin(rad));
  
  float opprad = rad + PI;
  float x2 = centerX + (thisRadius * cos(opprad));
  float y2 = centerY + (thisRadius * sin(opprad));
  
  line (x1, y1, x2, y2);
  noisel += 0.02;
}


