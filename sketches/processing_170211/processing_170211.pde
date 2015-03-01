
float r = 50;

void setup() {
  size(600,600);
  background(#EEFF39);
}

float znoise = 0;
void draw()
{
  float xnoise =0, ynoise=0, inc = 0.125;
  
  for(int y=0; y<width; y++){
    for (int x=0; x<height; x++){
      float b = noise(xnoise, ynoise, znoise)*255;
      stroke(b);
      point(x,y);
      xnoise = sin(xnoise);
    }
    xnoise = 0;
    ynoise = ynoise+inc;
  }
  znoise +=0.1;  
}
