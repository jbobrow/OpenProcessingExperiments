

float [] ypos =new float [30];
float [] y=new float [30];
float [] x=new float [30];
float [] xpos =new float [30];
  float [] r = new float [255];
float [] g = new float [255];
float [] b =new float [255];
void setup() {
  size(600,600);
  for(int i=0; i<ypos.length; i++) {
    xpos[i]=random(10,590);
    ypos[i]=random(10,590);
    x[i]=random(1,9);
    y[i]=random(1,9);
 r[i]=random(255);
 g[i]=random(255);
 b[i]=random(255);
}
}

void draw() {
   background(0,0,0);
smooth();

 for(int i=0;i<ypos.length;i++) {
   ypos[i]+=y[i];
 xpos[i]+=x[i];
    ellipse(xpos[i],ypos[i],10,10); 
    fill(r[i],g[i],b[i]);
    if (ypos[i]<=10 || ypos[i]>=height-10) {
    y[i]=y[i]*-1;
    fill(r[i],g[i],b[i]);
  }
  if (xpos[i]<=10 || xpos[i]>=width-10) {
    x[i]=x[i]*-1;
    fill(r[i],g[i],b[i]);
  }
    
 
 
  
 }
 
}

