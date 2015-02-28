
int pal []=new int [100];
float xx=0,yy=0;

void setup() {
  size(320,200);
  int i;
  float s1,s2,s3;
  for (i=0;i<50;i++) {
    s1=sin(i*PI/50);
    s2=sin(i*PI/50+PI/4);
    s3=sin(i*PI/50+PI/2);
    pal[i]=color(128+s1*128,128+s2*128,0);
  }
  for (i=50;i<100;i++) {
    s1=sin(i*PI/50);
    s2=sin(i*PI/50+PI/4);
    s3=sin(i*PI/50+PI/2);
    pal[i]=color(128+s1*128,0,128+s3*128);
  }
  frameRate(30);
}

void draw() {
  loadPixels();
  int i,j,offs=0,c;
  for (i=0;i<199;i++) {
    for (j=0;j<319;j++) {
      c=int(sin(i*PI/100*2+yy)*25+sin(i*PI/100*3+PI/6+yy)*25+cos(j*PI/160+xx)*25+cos(j*PI/160*2+PI/2+xx)*25)+50;
      c=constrain(c,0,99);
      pixels[offs++]=pal[c];
    }
  }
  updatePixels();
  xx+=0.1;
  yy+=0.1;
}

