
int x = 352;
int y = 240;
int numr = 5;
int numc = 5;
float sfac = .50;
void setup(){ 
  size(int(x*numc*sfac),int(y*numr*sfac));
  
}  
void draw() {
  scale(sfac);
  int i = 3;
  for (int r=0;r<numr;r++) {
    for (int c=0;c<numc;c++) {
      String s = String.format("http://207.251.86.248/cctv%d.jpg",i++);
      PImage p = loadImage(s);
      if (p != null) {
          image(p, x*c, y*r);
      }
    }
  }
}

