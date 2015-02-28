
int p=100;
float[] x=new float[p];
float[] y=new float[p];
float[] xv=new float[p];
float[] yv=new float[p];
float[] m=new float[p];
float[] c=new float[p];
float[] sel=new int[p];
float g=.001;
float s=1;
int cx=1;
int cy=1;
int clear=1;


for (int i=0; i<p; i++){
x[i]=random(500)+250;
y[i]=random(500)+250;
xv[i]=random(2)-random(2);
yv[i]=random(2)-random(2);
m[i]=random(100)+20;
c[i]=random(360);
sel[i]=0;
}
//x[0]=500;
//y[0]=500;
//xv[0]=0;
//yv[0]=0;
//m[0]=10000;

void setup() {  
   size(1000,1000); 
   colorMode(HSB);
   noStroke();

}

void draw() { 
  if (clear==1) {background(0);}
 
   for (int i=0; i<p; i++){
      
      if (sel[i]==1) {stroke(255,255,255);} else {noStroke();}
      fill(c[i],255,255);
      ellipse(x[i],y[i],sqrt(m[i]),sqrt(m[i]));
      x[i]+=xv[i];
      y[i]+=yv[i];
      if (sel[i]==1) {
         for (int n=0; n<p; n++){
            x[n]-=xv[i];
            y[n]-=yv[i];
            }
        }
    }
   for (int i=0; i<p; i++){
      for (int ii=0; ii<p; ii++){
         if (i!=ii && m[i]>0 && m[ii]>0) {
            float d=dist(x[i],y[i],x[ii],y[ii]);
            float force=(g*((m[i]*m[ii])/(d^2)))/m[i];
            float dir=atan2(y[i]-y[ii],x[i]-x[ii]);
            xv[i]-=cos(dir)*force;
            yv[i]-=sin(dir)*force;
           
            if ((d<(sqrt(m[i])+sqrt(m[ii]))/2) && m[i]>m[ii]) {
               m[i]+=m[ii];
              c[i]=(c[i]+c[ii])/2;
               m[ii]=0;
              x[ii]=2000;
              y[ii]=2000;
               xv[i]=((xv[i]*m[i])+(xv[ii]*m[ii]))/(m[i]+m[ii]);
              yv[i]=((yv[i]*m[i])+(yv[ii]*m[ii]))/(m[i]+m[ii]);
           }
         }
      }
   }
}

void keyPressed() {
   
 if ((key == 'z') || (key == 'Z')) {s-=.01; scale(s);}
 if ((key == 'x') || (key == 'X')) {s+=.01; scale (s);}
 if ((key == 'c') || (key == 'C')) {clear=1-clear;} 
   
  if (key == CODED) {
    if (keyCode == UP) {for (int q=0; q<p; q++;) {y[q]+=10;}}
    if (keyCode == DOWN)  {for (int q=0; q<p; q++;) {y[q]-=10;}}
    if (keyCode == RIGHT) {for (int q=0; q<p; q++;) {x[q]-=10;}}
    if (keyCode == LEFT) {for (int q=0; q<p; q++;) {x[q]+=10;}}
  }
}

void mousePressed() {
   for (int k=0; k<p; k++) {
    sel[k]=0;
    if (dist(mouseX,mouseY,x[k],y[k])<(sqrt(m[k])/2)) {
      sel[k]=1;     
     }
  }
}
  
 
 
 
