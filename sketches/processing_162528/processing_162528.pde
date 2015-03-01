
size(500, 500); 
background(255, 100, 20); 

float xnoise = 0.0;
float ynoise = 0.0;
float inc = 0.04;
for (int y = 0; y<height; y++) {
  for (int x = 0; x < width; x++) {
    float pink = noise(xnoise, ynoise) * 405;
    stroke(pink);
    point(x, y);
    xnoise = xnoise + inc;
  }
  xnoise = 0;
  ynoise = ynoise + inc;
}

noStroke();
smooth();
int radius = 6;
fill(40,40,240);
for (int deg = 0; deg < 30; deg +=20) {
  float angle = radians(deg);
  float x = 250 + (cos(angle) * radius);
  float y = 300 + (sin(radius) * radius);
  ellipse(x, y, 100, 100);
}

stroke(242, 200, 40);
strokeWeight(9);
smooth();
int radius5 = 6;
for (int deg = 0; deg < 30; deg +=20) {
  float angle = radians(deg);
  float x = 100 + (cos(angle) * radius5);
  float y = 300 + (sin(radius) * radius5);
  ellipse(x, y, 100, 100);
}

stroke(242, 200, 40);
strokeWeight(9);
smooth();
int radius6 = 6;

for (int deg = 0; deg < 30; deg +=20) {
  float angle = radians(deg);
  float x = 400 + (cos(angle) * radius6);
  float y = 300 + (sin(radius) * radius6);
  ellipse(x, y, 100, 100);
}




