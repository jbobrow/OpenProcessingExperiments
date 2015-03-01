
int m,w=511;
void setup() {
  size(800,800);
  colorMode(HSB,width);
  background(0);
  noStroke();

}
 
void draw() {
  ++m;
  fill(m%w,width/3,width);
  for(int i=0;i<10000;++i)
    ellipse(noise(m/99.0,i*2)*width,noise(m/99.0,i*2+1)*w,4,4);
    
   }

