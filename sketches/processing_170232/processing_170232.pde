
float xnoise =0, ynoise =0, inc =0.001;
float znoise=0;

float h= random(1, 360);

void setup() {
  size(100, 700);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
background(h, 100, 100, 80);
  
  for (int y =0; y<height; y++) {
    for (int x=0; x<width; x++) {

      float r= noise(xnoise, ynoise, znoise)*255;
      stroke(r);
      point(x, y);
      xnoise=xnoise +inc;
    }
    xnoise =0;
    ynoise=ynoise+inc;
  }
  znoise+=0.1;

  float t=0; 
  float tDelta= radians(3);
  float w= map(mouseY, 0, height, 0.1, 10);

  for (int y=0; y<height; y++) {
    float x= width/2 -100*sin(w*t);
    
    stroke(255);
    strokeWeight(10);
    point(x, y);
    t+=tDelta;
  }
}

