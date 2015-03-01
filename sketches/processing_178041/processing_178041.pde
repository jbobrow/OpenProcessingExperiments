
PGraphics mask;
int WHITE = color(255);
int BLACK = color(0);
float div = 100;
float r = 30;
float n;
float widthDiv,heightDiv;


void setup() {
  size(300, 300);
  noStroke();
  colorMode(HSB);
  background(WHITE);
  n =random(100);
  widthDiv = width / div;
  heightDiv = height / div;
  drawDemoMask();
}

void draw() {
  for (int i=-4; i<(div) + 8; i++) {
    fill(130,300,120 * ( i*(1/div)) );
    beginShape();
    vertex(-2*widthDiv, ((div*r*2) + i*heightDiv));
    vertex(-2*widthDiv, (i*heightDiv));
     
    for (int j=-2; j<(div) + 6; j++) {
             
      float theta = map( noise(n,i*0.1,j*0.02), 0,1, 0,TWO_PI);
      float x = (cos(theta)* r) + (j*widthDiv) ;
      float y = (sin(theta)* r)*1.5 + (i*heightDiv);
       
      curveVertex(x,y);
       
    }
     
    vertex((div+6)*widthDiv, (i*heightDiv));
    vertex((div+6)*widthDiv, ((div*r*2) + i*heightDiv));
     
    endShape(CLOSE);
  }
  n += 0.03;
  maskPixels();
}

void drawDemoMask() {
  mask = createGraphics(width, height);
  mask.beginDraw();
  mask.background(0);
  mask.ellipse(width/2, height/2, 250, 250);
  mask.endDraw();
  mask.loadPixels();
}

void maskPixels() {
  loadPixels();
  for (int i=0; i < mask.pixels.length; ++i) {
    int maskPixel = mask.pixels[i];
    if (maskPixel != WHITE) {
      pixels[i] = BLACK;
    }
  }
  updatePixels();
}
