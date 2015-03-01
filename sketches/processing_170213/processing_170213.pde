
void setup(){
  size(600,600);
  background(0);
}

float znoise = 0;

void draw(){
  float xnoise = 0, ynoise = 0, inc = 0.01;
  
  for(int y = 0; y<height; y++){
    for(int x = 0; x<width; x++){
      float r = sin(noise(xnoise))*255;
      float g = sin(noise(ynoise))*255;
      float b = sin(noise(znoise))*255;
      stroke(r,g,b);
      point(x,y);
      xnoise = xnoise + inc;
    }
    xnoise = 0;
    ynoise = ynoise + inc;
  }
  znoise += 0.2;
}
