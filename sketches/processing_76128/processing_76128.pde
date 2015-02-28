
float xstart, xnoise, ynoise;
void setup() {
  size(1000, 500);
  smooth();
  background(255);
  xstart = random(40);
  xnoise = xstart;
  ynoise = random(40);
  for (int y = 0; y <= height; y+=5) {
    ynoise += 0.07;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=5) {
      xnoise += 0.07;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}
void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(240));
  float edgeSize = noiseFactor * 30;
  float grey = 150 + (noiseFactor*150);
  float alph = 0.5 + (noiseFactor*100);
  stroke(2, 255, 2, 2);
  strokeWeight(5);
  //fill(grey, alph*1);
  //fill(grey,2,2, alph*1); //red
  fill(grey, alph*1);
  ellipse(0, 0, edgeSize*3, edgeSize*3);
  //line(0, 0, edgeSize*3, edgeSize*3);
  popMatrix();
}
void draw(){ }

//===========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
  String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
 
//==============
