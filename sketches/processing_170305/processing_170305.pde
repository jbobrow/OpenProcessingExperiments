
void setup(){
  size(200,200,P3D);
  colorMode(HSB);
  background(0);
}

float znoise =0;

void draw()
{
  float xnoise =0, ynoise=0, inc = 0.01;
  
  for (int y=0; y<height; y++) {
    for (int x=0; x<width; x++) {
      
      float r = noise(xnoise, ynoise, znoise)*255;
      stroke(r,r,r);
      point(sin(x)*600+100,sin(y)*500+100,-900);
      xnoise = xnoise + inc;
    }
    xnoise =0;
    ynoise = ynoise + inc;
  }
  znoise +=0.1;
}
