

int s=1000;
int s2=600;
//how many pixels each cell is - square

int n=8;
int[] x=new int[n];
int[] y=new int[n];
int[] dx=new int[n];
int[] dy=new int[n];
int[] c=new int[n];
int[] f=new int[n];
int[] t=new int[n];
//frame rate
int rate=32;




void setup() 
{


  frameRate(rate);

  noStroke();


  for (int i=0;i<x.length;i++) {
    x[i]=int(random(s));
    y[i]=int(random(s2));

     y[i]=400;
    x[i]=int(random(s));
    c[i]=color(random(256), random(256), random(256), 255);

    f[i]=int(random(40,40));

    dx[i]=int(random(-1*f[i], 1*f[i]));
    dy[i]=int(random(-1*f[i], 1*f[i]));
    dy[i]=0;
    if (i>0){
      dx[i]=0;
      
      }else{
        dx[i]=int(random(f[i], 2*f[i]));
       
      };
      x[i]= 200+2*f[i]*i;
  }
  size(1000, 600);

  background(0, 0, 0);
}


void draw()
{

 // filter(ERODE);
  //filter(DILATE);
  // filter(BLUR);
  fill(color(0, 0, 0, 255));
  rect(0, 0, s, s2);


  for (int i=0;i<x.length;i++) {
    fill(c[i]);

    ellipse(x[i], y[i], f[i], f[i]);






    x[i]=x[i]+dx[i];
    y[i]=y[i]+dy[i];
    if (x[i]<0) {
      dx[i]=dx[i]*-1;
      x[i]=1;
    }
    if (x[i]>s) {
      dx[i]=dx[i]*-1;
      x[i]= s-1;
    }
    if (y[i]<0) {
      dy[i]=dy[i]*-1;
      y[i]=1;
    }
    if (y[i]>s2) {
      dy[i]=dy[i]*-1;
      y[i]=s2-1;
    }
  }
  for (int m=0;m<x.length;m++) {
    for (int n=0;n<x.length;n++) {
      if (m<n) {
        float d=sqrt(((x[m]-x[n])*(x[m]-x[n]))+(y[m]-y[n])*(y[m]-y[n]));
        float r=(f[m]+f[n])/2;
        if (d<r) {
          int f1;
          int f2;
          int dx1;
          int dy1;
          int dx2;
          int dy2;
          int mx0;
          int mx1;
          int mx2;
          f1=f[m];
          f2=f[n];
          int my0;
          int my1;
          int my2;
          dx1=dx[m];
          dy1=dy[m];
          dx2=dx[n];
          dy2=dy[n];
          mx0=(dx1*f1+dx2*f2);
       
          mx1=(dx2*f2);
          mx2=mx0-mx1;
        
           my0=(dy1*f1+dy2*f2);
       
          my1=(dy2*f2);
          my2=my0-my1;
         
          dx[m]=mx1/f1;
          dy[m]=my1/f1;;
          dx[n]=mx2/f2;
          dy[n]=my2/f2;
             
        }
      }
    }
  }

}





void keyPressed()
{
  if ( key == 's' ) save(str(millis())+".jpg");
  if ( key == 'r' ) setup();
}



