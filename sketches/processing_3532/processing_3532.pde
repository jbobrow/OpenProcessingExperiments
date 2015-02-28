
int m,w=511;
void setup() {
  size(511,511);
  colorMode(HSB,w);
  background(0);
  noStroke();
}

void draw() {
  ++m;
  fill(m%w,w/3,w);
  for(int i=0;i<2;++i)
    ellipse(noise(m/99.0,i*2)*w,noise(m/99.0,i*2+1)*w,4,4);
   filter(BLUR);
 }


