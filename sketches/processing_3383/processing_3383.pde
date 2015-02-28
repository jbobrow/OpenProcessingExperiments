
int w=256,t=2;
void setup() {size(256,256);}
void draw() { 
  colorMode(RGB,t);
  t=1+int(random(255));
  for (int y=0;y<w;++y) 
    for (int x=0;x<w;++x)
      set(x,y,get(x,y)^color((x^y)%t,(x^y)%(t+1),(x^y)%(t+2)));
}



