
float xstart, xnoise, ystart, ynoise;
float xstartNoise, ystartNoise;
color[] pal1 = {
  #024873, #049DD9, #0378A6, #F2F2F2
};
color col;


void setup() {
  size(400, 300);
  smooth();
  background(255);
  frameRate(24);
  xstartNoise = random(20);
  ystartNoise = random(20);
  xstart = random(10);
  ystart = random(10);
}
void draw () {
  background(#022340);
  xstartNoise += 0.01;
  ystartNoise += 0.01;
  xstart += (noise(xstartNoise) * 0.5) - 0.25;
  ystart += (noise(ystartNoise) * 0.5) - 0.25;
  xnoise = xstart;
  ynoise = ystart;
  for (int y = 0; y <= height; y+=5) {
    ynoise += 0.1;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=5) { 
      xnoise += 0.1;
      col = pal1[int(random(pal1.length))];
      drawPoint(x, y, noise(xnoise, ynoise), col);
    }
  }
  
    
}
void drawPoint(float x, float y, float noiseFactor, color _col) {
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(360));
  fill(_col, 150);
  noStroke();
  ellipse(0, 0, 20, 5);
  popMatrix();
}
