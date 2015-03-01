
float[] sX,sY,dX,dY;
float d,z,dMin;
int n;
color c;

void setup() {
  size(400,400);
  setS();
}

void setS() {
  n  = round(random(5,20));
  z  = random(0.1,1.0);
  sX = new float[n];sY = new float[n];
  dX = new float[n];dY = new float[n];
  for(int i=0;i<n;i++){
    sX[i] = random(width);sY[i] = random(height);
    dX[i] = random(-1,1);dY[i] = random(-1,1);
  }
}

void draw() {
  for(int i=0;i<n;i++) {
    sX[i]+=dX[i];
    sY[i]+=dY[i];
    if(sX[i]<0||sX[i]>width) {dX[i]*=-1;}
    if(sY[i]<0||sY[i]>height) {dY[i]*=-1;}
  }
  loadPixels();
  for(int x=0;x<width;x++) {
    for(int y=0;y<height;y++) {
      dMin = sq(width);
      for(int s=0;s<n;s++) {
        d = (abs(sX[s]-x)+abs(sY[s]-y))*z;
        if(d<dMin) {
          dMin = d;
        }
      }
      dMin = sin(dMin);
      if(dMin<0) {c = color(0);} else {c = color(dMin*255);}
      pixels[y*width+x]=c;
    }
  }
  updatePixels();
}

void keyPressed() {
  setS();
}


