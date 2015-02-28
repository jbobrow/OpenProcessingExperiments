
void setup () {
  size (580,640);
  background (255);
  frameRate(10);
}

void draw () {
  int a=0;
  int b=1+a;
  int c=a+b;
  int d=b+c;
  int e=c+d;
  int f=d+e;
  int g=e+f;
  int h=f+g;
  int i=g+h;
  int j=h+i;
  int k=i+j;
  int l=j+k;
  int m=k+l;
  int n=l+m;

  float rad=random(50,200);
  smooth();
  noStroke();
  fill (54,51,random(40,80),25);
  ellipse (random(580),random(640),rad,rad);

  int gx1=40;
  int gx2=520;
  int gy1=40;
  int gy2=400;
  fill (random(150,250));
  text (a,random(gx1,gx2),random(gy1,gy2));
  text (b,random(gx1,gx2),random(gy1,gy2));
  text (c,random(gx1,gx2),random(gy1,gy2));
  text (d,random(gx1,gx2),random(gy1,gy2));
  text (e,random(gx1,gx2),random(gy1,gy2));
  text (f,random(gx1,gx2),random(gy1,gy2));
  text (g,random(gx1,gx2),random(gy1,gy2));
  text (h,random(gx1,gx2),random(gy1,gy2));
  text (i,random(gx1,gx2),random(gy1,gy2));
  text (j,random(gx1,gx2),random(gy1,gy2));
  text (k,random(gx1,gx2),random(gy1,gy2));
  text (l,random(gx1,gx2),random(gy1,gy2));
  text (m,random(gx1,gx2),random(gy1,gy2));
  text (n,random(gx1,gx2),random(gy1,gy2));


  int bx1=40;
  int bx2=520;
  int by1=440;
  int by2=600;
  fill (8,14,50);
  text (a,random(bx1,bx2),random(by1,by2));
  text (b,random(bx1,bx2),random(by1,by2));
  text (c,random(bx1,bx2),random(by1,by2));
  text (d,random(bx1,bx2),random(by1,by2));
  text (e,random(bx1,bx2),random(by1,by2));
  text (f,random(bx1,bx2),random(by1,by2));
  text (g,random(bx1,bx2),random(by1,by2));
  text (h,random(bx1,bx2),random(by1,by2));
  text (i,random(bx1,bx2),random(by1,by2));
  text (j,random(bx1,bx2),random(by1,by2));
  text (k,random(bx1,bx2),random(by1,by2));
  text (l,random(bx1,bx2),random(by1,by2));
  text (m,random(bx1,bx2),random(by1,by2));
  text (n,random(bx1,bx2),random(by1,by2));
}


