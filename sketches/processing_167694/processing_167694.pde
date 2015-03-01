
float inc=0.5;
int density=10;
float znoise=0.0;

void setup(){
  size(500,500);
  noStroke();
}
void draw(){
  float xnoise=0.0;
  float ynoise=0.0;
  for(int y=0;y<height;y+=density){
    for(int x=0; x<width;x+=density){
      float n=noise(xnoise,ynoise,znoise)*256;
      fill(n);
      rect(y,x,density,density);
      xnoise+=inc;
    }
    xnoise=0;
    ynoise+=inc;
  }
  znoise+=inc;
}


