
int[] p = new int[20]; //random parameters
int[][] ca; //cache
int n;
int PER = 72; // period, in frames

void setup() {
  size(480,480);
  for (int i=0;i<p.length;i++) {p[i] = int(random(4));}
  ca = new int[PER][width*height];
  n = (1+p[10])*(1+p[11]);
  frameRate(PER/6);
}

void mousePressed() {
  println(p);
}

void draw() {
  if (frameCount <= PER) newdraw();
  else cadraw();
}

void newdraw() {
  loadPixels();
  for (int i=0;i<width;i++) {
    for (int j=0;j<height;j++) {
      float x = i-(width+1)/2.;
      float y = j-(height+1)/2.;
      float t = atan2(y,x);
      float lr = 0.5*log(x*x+y*y);
      float f = frameCount*TWO_PI/PER;

      float phi = p[0]*n*t+p[5]*f;
      float phi2 = p[1]*t-p[2]*n*lr+(1+p[6])*f;
      float phi3 = p[3]*t+p[4]*n*lr-(1+p[6])*f;
      float br = sin(phi)+sin(phi2)+sin(phi3);

      color c;
      if (br < 0) c = color(0);
      else c = color(255);
      pixels[i+j*width] = c;
      ca[frameCount-1][i+j*width] = c;
    }
  }
  updatePixels();
}

void cadraw() {
  loadPixels();
  for (int i=0;i<width*height;i++) {
    pixels[i] = ca[(frameCount-1)%PER][i]; }
  updatePixels();
}
