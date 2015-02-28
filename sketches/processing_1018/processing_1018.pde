
float maxScale, midScale, minScale, deSpeed;

void setup()
{
  //size(screen.width, screen.height);
  size(666, 666);
  frameRate(25);
  smooth();
  colorMode(HSB, 1);
  noStroke();
  maxScale = min(width,height)-min(width,height)/5;
  midScale = maxScale/2-maxScale/60;
  minScale = midScale/2-maxScale/60;
  deSpeed = 100;
}

void draw()
{ 
  background(0,0,.5);
  translate(width/2, height/2);
  rotate(float(frameCount)/deSpeed);
  trace(maxScale);
  pushMatrix();
  translate(maxScale/4,0);
  rotate(float(frameCount)/deSpeed);
  trace(midScale);
  pushMatrix();
  translate(maxScale/8-maxScale/240,0);
  rotate(float(frameCount)/deSpeed);
  trace(minScale);
  popMatrix();
  translate(-maxScale/8+maxScale/240,0);
  rotate(float(frameCount)/deSpeed);
  trace(minScale);
  popMatrix();
  translate(-maxScale/4,0);
  rotate(float(frameCount)/deSpeed);
  trace(midScale);
  pushMatrix();
  translate(maxScale/8-maxScale/240,0);
  rotate(float(frameCount)/deSpeed);
  trace(minScale);
  popMatrix();
  translate(-maxScale/8+maxScale/240,0);
  rotate(float(frameCount)/deSpeed);
  trace(minScale);
}

void trace(float scaleYY) {
  demi(scaleYY,1);
  rotate(PI);
  demi(scaleYY,0);
}

void demi(float scaleYY,float bbb) {
  fill(0,0,bbb);
  beginShape();
  vertex(-scaleYY/2, 0);
  bezierVertex(-scaleYY/2, -scaleYY/3.6, -scaleYY/3.6, -scaleYY/2, 0, -scaleYY/2);
  bezierVertex(+scaleYY/3.6, -scaleYY/2, +scaleYY/2, -scaleYY/3.6, +scaleYY/2, 0);
  bezierVertex(+scaleYY/2, +scaleYY/7.2, +scaleYY/4+scaleYY/7.2, +scaleYY/4, +scaleYY/4, +scaleYY/4);
  bezierVertex(+scaleYY/4-scaleYY/7.2, +scaleYY/4, 0, +scaleYY/7.2, 0, 0);
  bezierVertex(0, -scaleYY/7.2, -scaleYY/4+scaleYY/7.2, -scaleYY/4, -scaleYY/4, -scaleYY/4);
  bezierVertex(-scaleYY/4-scaleYY/7.2, -scaleYY/4, -scaleYY/2, -scaleYY/7.2, -scaleYY/2, 0);
  endShape(CLOSE);
}









