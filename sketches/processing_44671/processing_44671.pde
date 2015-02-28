
float xstart, ynoise, phi;
boolean pressed = false;

void setup() {
  size(825, 490, P3D);
  background(200,100,0);
  stroke(0,0);
  fill(0,170);
  xstart = random(10);
  ynoise = random(50);
  smooth();
  text("created by Christian Geick 2011", 825-200, 490-50);
}

void draw() {
  if(!pressed && mousePressed) {
    pressed = true;
  }
  
  if(pressed && frameCount%2==0) {
    smooth();
    background(150,200,0);
    translate(width/2, height/2+20, 0);
    generate();
  }
}

void generate() {
  for(float y=-(height/8); y<=height/8; y+=20) {
    ynoise+=0.01;
    float xnoise = xstart;
    
    for (float x=-(width/3); x<=width/3; x+=5) {
      xnoise+=0.05;
      drawPoint(x,y,noise(xnoise,ynoise));
    }
  }
}

void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x*noiseFactor*4, y*noiseFactor*4,-y);
  float edge = noiseFactor*12;
  ellipse(0,0,edge,edge);
  popMatrix();
}

