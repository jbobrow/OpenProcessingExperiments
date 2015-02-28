
float noy;
int c=5;
int [] center=new int [c];
int [] csize=new int [c];
int [] cnow=new int [c];
int r,g,b;

void addpixel(int p) {
  r+=(p>>16)&0xff;
  g+=(p>>8)&0xff;
  b+=p&0xff;
}

color getpixel(int div) {
  return color(r/div,g/div,b/div);
}

void setup() {
  size(320,200);
  int i;
  loadPixels();
  for (i=0;i<64000;i++) {
    pixels[i]=0;
  }
  updatePixels();
  for (i=0;i<c;i++) {
    newcenter(i);
  }
}

void newcenter(int i) {
  center[i]=int(random(319));
  csize[i]=int(random(30))+1;
  cnow[i]=1;
}

void draw() {
  int i,j,offs=0,l;
  loadPixels();
  /*for (j=0;j<5;j++) {
    offs=int(random(318));
    l=int(random(319-offs));
    l=constrain(l,1,50);
    offs+=199*320;
    r=int(random(50)+200);
    g=int(random(r/2));
    for (i=0;i<l;i++) {
      pixels[offs++]=color(r,g,0);
    }
  }*/
  /*offs=199*320;
  for (i=0;i<320;i++) {
    r=int(512*noise(float(i)/25,noy));
    r=constrain(r,100,255);
    pixels[offs++]=color(r,int(random(r/4)),0);
  }
  noy+=0.2;*/
  offs=199*320;
  for (i=0;i<320;i++) {
    r=int(64*noise(float(i)/25,noy));
    r=constrain(r,150,200);
    g=int(random(r/4));
    pixels[offs++]=color(r,0,0);
  }
  noy+=0.2;
  offs=199*320;
  for (i=0;i<5;i++) {
    //int rad=int(csize[i]*sin(float(cnow[i])/float(csize[i])*PI/2));
    int rad=csize[i]+int(random(-csize[i]/1.5,csize[i]/1.5));
    int startx=constrain(center[i]-rad,0,320);
    int endx=constrain(center[i]+rad,0,320);
    for (j=startx;j<endx;j++) {
      pixels[offs+j]=color(int(random(150,200)),int(random(100,150)),0);
    }
    cnow[i]++;
    if (cnow[i]>csize[i]) {
      newcenter(i);
    }
  }
/*  offs++;
  for (i=0;i<318;i++) {
    r=g=b=0;
    addpixel(pixels[offs-1]);
    addpixel(pixels[offs]);
    addpixel(pixels[offs+1]);
    pixels[offs++]=getpixel(3);
  }*/
  offs=0;
  for (i=0;i<199;i++) {
    l=320;
    if (i==198) {
      l=319;
    }  
    for (j=0;j<l;j++) {
      r=g=b=0;
      addpixel(pixels[offs]);
      addpixel(pixels[offs+320]);
      addpixel(pixels[offs+319]);
      addpixel(pixels[offs+321]);
      pixels[offs]=color(r>>2,g>>2,b>>2);
      //pixels[offs]=getpixel(4);
      offs++;
    }
  }
  updatePixels();
}

