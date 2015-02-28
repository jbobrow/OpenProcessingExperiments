
void setup()
{
  size(1300, 600, P3D);
  frameRate(8);
}

void draw()
{
  background(59, 59, 59);
  stroke(0, 50);
  fill(255, 200);
  float xstart = random(10);
  float ynoise = random(10);
  //anslate(width/2, height/2);
  translate(mouseX, mouseY);
  for(float y = -(height/8); y<=(height/8); y+=3){
    ynoise += 0.02;
    float xnoise = xstart;
    for(float x = -(width/8); x<=(width/8); x+=3){
      xnoise += 0.02;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}

void drawPoint(float x, float y, float noiseFactor){
  pushMatrix();
  translate(x*noiseFactor*4, y*noiseFactor*4, -y);
  float edgeSize = noiseFactor*26;
  strokeWeight(2);
  stroke(150, 150, 150, 100);
  fill(200, 100, 10);
  ellipse(0, 0, edgeSize, edgeSize);
  popMatrix();
}


