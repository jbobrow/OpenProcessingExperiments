
color [] pal=new color [256];
double mx0,my0,mx1,my1;
double xori=-2,yori=-1,wi=0.01*320,he=0.01*200;

void setup() {
  size(320,200);
  noLoop();
  for (float i=0;i<256;i++) {
    //pal[int(i)]=color(cos(i*HALF_PI/255)*192,sin(i*HALF_PI/64)*32+32,max(sin(i*HALF_PI/255-PI/6),0)*255);
    pal[int(i)]=color(0,0,log(i)*40);
  }
}

void draw() {
  loadPixels();
  int i,j,offs=0,iter;
  double xx,x,y,xo,yo=yori;
  for (i=0;i<200;i++) {
    xo=xori;
    for (j=0;j<320;j++) {
      iter=0;
      x=xo;
      y=yo;
      while (iter<256 && (x*x+y*y)<100) {
        xx=x*x-y*y+xo;
        y=2*x*y+yo;
        x=xx;
        iter++;
      }
      if (iter==256) {
        pixels[offs++]=pal[255];
      }
      else {
        pixels[offs++]=pal[iter-1];
      }
      xo+=wi/320;
    }
    yo+=he/200;    
  }
  updatePixels();
}

void mousePressed() {
  mx0=mouseX;
  my0=mouseY;
}

void mouseReleased() {
  mx1=mouseX;
  my1=mouseY;
  double temp;
  if (mx0>mx1) {
    temp=mx0;
    mx0=mx1;
    mx1=temp;
  }
  if (my0>my1) {
    temp=my0;
    my0=my1;
    my1=temp;
  }
  if (mx0!=mx1 && my0!=my1) {
    double aspect=(mx1-mx0)/(my1-my0);
    if (aspect>1.6) {
      mx1=mx0+1.6*(my1-my0);
    }
    else {
      my1=my0+1/1.6*(mx1-mx0);
    }
    aspect=(mx1-mx0)/(my1-my0);
    xori+=wi*(mx0)/320;
    yori+=he*(my0)/200;
    wi=wi*(mx1-mx0)/320;
    he=he*(my1-my0)/200;
    redraw();
  }
}

void keyPressed() {
  xori=-2;
  yori=-1;
  wi=0.01*320;
  he=0.01*200;
//  save("m:/mandelbrot.png");
  redraw();  
}

