
int w=500, m=w*860, c=w/2;
PImage img1;

void setup() {
  size(w, w);
  colorMode(RGB, 2);
  img1 = loadImage ("nn_03.png");
  imageMode (CENTER);
}

int t;
void draw() {
  background(2);
  
  translate(width/2,height/2);
  scale(2.5);
  
  //image(img1, width/2, height/2);
  image(img1, 0,0, mouseX, mouseY);
  for (int i=1;i<m;++i) {
    float a=i*3, r=sqrt(i/3);
    set((int)(c+sin(a)*r), (int)(c+cos(a)*r), color(sin(t*i*.001)+1));
  }
  t++;
}

// credit: Jim Bumgardner for spiral moire.


