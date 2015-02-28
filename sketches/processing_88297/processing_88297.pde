
/* @pjs preload="https://dl.dropbox.com/u/55656142/elements_processingJs/bg002.png"; */
float maxScale, midScale, minScale, deSpeed, hhh;
boolean bn; 
PImage bg; // image de fond

void setup()
{
  size(300, 300);
  bg = loadImage("https://dl.dropbox.com/u/55656142/elements_processingJs/bg002.png");
  frameRate(25);
  smooth();
  colorMode(HSB, 1);
  noStroke();
  maxScale = .8*min(width,height); 
  midScale = maxScale/2-maxScale/60;
  minScale = midScale/2-maxScale/60;
  deSpeed = 120;
}

void mousePressed() {
  bn = !bn;
  hhh = random(1);
}

void draw()
{ 
  image(bg, 0, 0);
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
  demi(scaleYY,abs(1-int(bn)));
  rotate(PI);
  demi(scaleYY,abs(0-int(bn)));
}

void demi(float scaleYY,float sss) {
  fill(hhh,sss,1);
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
