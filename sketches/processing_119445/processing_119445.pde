
//Chun Yi Wu
// air plane

float xstart, xnoise, ynoise, t;

void setup() {
  size(1000, 550, P3D);
  //noLoop();
  frameRate(5);
}

void draw() {

  background(255);
  pushMatrix();
  translate(t, 0, 0);
  t +=10; 
  xstart += 0.01;
  xnoise = xstart;
  ynoise = random(10);
  for (int y = 0; y <= height; y+=15) {
    ynoise += 0.1;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=15) {
      xnoise += 0.1;

      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
  popMatrix();
  fill(0);
  textSize(20);
  text("fly away", 450, height/2);
}
void drawPoint(float a, float b, float noiseFactor) {
  float len = 20 * noiseFactor;
  pushMatrix();
  translate(a, b*2, -a*8);
  rotate(-0.7);
  scale(noiseFactor*2);
  //fill(len*50,100);
  noFill();
  strokeWeight(0.6);
  stroke(random(len*10), 200);
  //01
  beginShape();
  vertex(a, b, a+len*3, b+len*3);
  vertex(a+len*3, b+len*3, a+len*3-25, b+len*3-32);
  vertex(a+len*3-25, b+len*3-32, a, b);
  endShape(CLOSE);
  //02
  beginShape();
  vertex(a-5, b+1, a+len*3-2, b+len*3+1);
  vertex(a+len*3-2, b+len*3+1, a+len*3-40, b+len*3-20);
  vertex( a+len*3-40, b+len*3-20, a, b);
  endShape(CLOSE);
  popMatrix();
}


void keyPressed() {
  saveFrame("screen-###.jpg");
}



