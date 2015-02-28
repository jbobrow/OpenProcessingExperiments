
//nested loops; French fries
//TCY
float xstart=random(10);
float xnoise=xstart;
float ynoise=random(10);
void setup() {
  size(600, 600);
}

void draw() {
  //background(255);
  for (int y=0; y<=height;y +=5) {
    ynoise+=0.1;
    xnoise=xstart;
    for (int x=0;x<=width; x += 5 ) {
      xnoise+=0.1;
      drawpoint(x, y, noise(xnoise, ynoise));
    }
  }
}
void drawpoint(float x, float y, float noisefactor) {
  int alph=int(noisefactor*255);
  stroke(0, alph);
  strokeWeight(0.1);
  //noStroke();
  float len=10*noisefactor;
  pushMatrix();
  translate(mouseX,mouseY);
  rotate(noisefactor*radians(540));
  //ellipse(x, y, 5, 5); 
  fill(255,244,60,10);
  rect (x, y, len*noise(noisefactor)*10, len*noisefactor);
  popMatrix();
  
}

void keyPressed() {
  saveFrame("TCY####.png");
}



