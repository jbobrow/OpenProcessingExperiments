
//Lin,Lien Ya   ,spring
//institute of Industrial design
float xstart, xnoise, ystart, ynoise;
void setup() {
  size(500, 500, P3D);
  background(255);
  frameRate(24);
  xstart = random(10);
  ystart = random(10);
}

void draw() {
  background(120, 180, 200);
  xstart += 0.01;
  ystart += 0.01;
  xnoise = xstart;
  ynoise = ystart;  
  for (int y = 0; y <= height; y+=5) {
    ynoise += 0.1;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=5) {
      xnoise += 0.1;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
  for (int y = 0; y <= height; y+=5) {
    ynoise += 0.1;
    xnoise = xstart;
  }
}

//blue wind & sky
void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x,y,y);
  rotate(noiseFactor * radians(500));
  float edgeSize = noiseFactor*50;
  float grey = 150 + (noiseFactor*120);
  float alph = 150+(noiseFactor*120);
  noStroke();  
  fill(grey, grey+120, grey+200, alph);//blue color cloud
  ellipse(0, 0, edgeSize/2, edgeSize/2);

  //moving flower
  strokeWeight(2);
  stroke(250, 120, 50,180);
  line(x+20, y+8,100,x+21, y+8,98);
  stroke(250, 220,50,180);
  strokeWeight(3);
  line(x+20, y+8,100,x+22, y+8,98);
  popMatrix();
}



