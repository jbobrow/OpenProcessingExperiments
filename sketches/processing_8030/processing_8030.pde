
PImage img;
float angle=0;
float scalee=1;
float dscalee=0.01;

void setup() {
  size(320,200);
  img=loadImage("astro.jpg");
}

void draw() {
  int x,y,offs=0,soffs;
  float tx,ty,txx=0,tyy=0,ca,sa;
  loadPixels();
  for (y=0;y<200;y++) {
    ca=scalee*cos(angle);
    sa=scalee*sin(angle);
    txx+=-sa;
    tyy+=ca;
    ty=tyy;
    tx=txx;
    for (x=0;x<320;x++) {
      tx+=ca;
      ty+=sa;
      soffs=int(ty)<<8;
      soffs+=int(tx);
      pixels[offs++]=img.pixels[soffs&0xffff];
    }
  }
  updatePixels();
  angle+=0.01;
  scalee+=dscalee;
  if (scalee<0.33 || scalee>3) {
    dscalee*=-1;
  }
}

void keyPressed() {
  saveFrame("c:/rotozoom.jpg");
}

