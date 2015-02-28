
color [] pal=new color [256];
double mx0,my0,mx1,my1;
double xori=-1.5,yori=-1.5,wi=4.5/320,he=3.0/200;
float rot=0;

void setup() {
  size(320,200);
  frameRate(5);
  randpal();
}

void randpal() {
  int nrc=4;
  int [] colr=randvalues(nrc);
  int [] colg=randvalues(nrc);
  int [] colb=randvalues(nrc);
  for (float i=0;i<256;i++) {
    //pal[int(i)]=color(cos(i*HALF_PI/255)*192,sin(i*HALF_PI/64)*32+32,max(sin(i*HALF_PI/255-PI/6),0)*255);
    pal[int(i)]=color(colval(colr,i/256),colval(colg,i/256),colval(colb,i/256));
  }
}

int colval(int [] c,float t) {
  return int(curvePoint(c[0],c[1],c[2],c[3],t));
}

int [] randvalues(int n) {
  int [] ret=new int [n];
  for (int i=0;i<n;i++) {
//    ret[i]=int(random(i*64,i*64+63));
    ret[i]=int(random((i&1)*128,(i&1)*128+127));
  }
  return ret;
}

void draw() {
  loadPixels();
  int i,j,offs=0,iter;
  double x,y,xo,yo=yori,c,d;
  c=0.7*cos(rot);
  d=0.3*sin(rot);
  while (cos(rot)>0.75) {
    rot+=0.05;
  }
  rot+=0.05;
  for (i=0;i<200;i++) {
    xo=xori;
    for (j=0;j<320;j++) {
      x=xo+c;
      y=yo+d;
      iter=iterate(x,y,c,d);
      if (iter==256) {
        pixels[offs++]=pal[255];
      }
      else {
        pixels[offs++]=pal[iter-1];
      }
      xo+=wi;
    }
    yo+=he;    
  }
  updatePixels();
}

int iterate(double x,double y,double c,double d) {
  int iter=0;
  double xx;
  while (iter<256 && (x*x+y*y)<100) {
     xx=x*x-y*y+c;
     y=2*x*y+d;
     x=xx;
     iter++;
   }
   return iter;
}

void mousePressed() {
  randpal();
}

void keyPressed() {
//  save("m:/julia.png");
}

