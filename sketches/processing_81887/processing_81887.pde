
size(800, 800);
background(0);


float xnoise = 0.0;
float ynoise = 0.0;
float inc = 0.9;
for (int y = 0; y < height; y++) {
  for (int x = 0; x < width; x++) {
    float gray = noise(xnoise, ynoise) * 255;
    stroke(gray-80);
    point(x, y);
    xnoise = xnoise + (inc*2);
  }
}
// noise background


float v = 0.0;
float inc1 = 15;
noStroke();

noiseSeed(100);
for (int i = 0; i < width; i ++) {
  float n = noise(v) * 600.0;
  rect(i, 100+n, 10, 20);
  fill(random(255), random(255), random(255));
  v = v + inc1;
}
// color rect
