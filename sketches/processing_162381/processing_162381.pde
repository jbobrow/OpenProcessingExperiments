
size(500,500);
background(255);
float power = 10; //turbulence power
float d = 65; //turbulence density
noStroke();
for(int y = -10; y < height+10; y++) {
  for(int x = -10; x < width+10; x++) {
    float total = 0.0;
    for (float i = d; i >= 1; i = i/2.0) {
      total += noise(x/d, y/d) * d;
    }
  float turbulence = 128.0 * total / d;
  float base = (x * 0.2) + (y * 0.12);
  float offset = base + (power * turbulence / 256.0);
  float gray = abs(sin(offset)) * 256.0;
  stroke(gray/2,120,gray*1.6,190);
  point(x,y);
  stroke(gray-50,120,gray*1.6,60);
  point(x+10,y+10);
  stroke(gray-100,60,gray/2,60);
  point(x-10,y-10);
  }
}


