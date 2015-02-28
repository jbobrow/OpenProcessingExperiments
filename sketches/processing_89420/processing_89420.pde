
color[] dessert = {#9F9694, #791F33, #BA3D49, #F1E6D4, #E2E1DC};
color[] palette = dessert;

float x, y;
float radiusCircle = 100;
float noisepx;
float noisepy;

size(400, 400);
translate(width/2, height/2);
background(palette[1]);
smooth();

float px = -999;
float py = -999;
float radiusSpiralLine = 10;
stroke(palette[2]);
strokeWeight(1);
for(float angle = 0; angle < 8*PI; angle +=.05){
  radiusSpiralLine += .5;
  x = cos(angle) * radiusSpiralLine;
  y = sin(angle) * radiusSpiralLine;
  noisepx=noise(px) * radiusSpiralLine;
    noisepy=noise(py) * radiusSpiralLine;
  if(px >-999){
    line(x, y, noisepx, py);
  }
  px = x;
  py = y;
}

float radiusSpiralDots = 200;
stroke(palette[3]);
strokeWeight(5);
for(float angle = 0; angle < 8*PI; angle +=.5){
  radiusSpiralDots -= .5;
  x = cos(angle) * radiusSpiralDots;
  y = sin(angle) * radiusSpiralDots;
  point(x, y);
}
