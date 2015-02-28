
import peasy.*;

PeasyCam cam;

int points;
float sigma,r,b, bound,step,roff;
float[][] uni;
color[] colors;

void setup() {
  size(640, 360, P3D);
  colorMode(HSB);
  noFill();
  
  cam = new PeasyCam(this, width);
  
  sigma=10;
  r=28;
  b=(8/3);
  
  points=25000;
  bound=50;
  step=0.003;
  
  reset();
}

void reset() {
  uni=new float[points][3];
  colors=new color[points];
  
  float maxd=sqrt(3*bound*bound);
  for(int i=0;i<points;i++) {
    float[] n = new float[3];
    for(int j=0;j<3;j++)
      n[j]=random(-bound,bound);
    uni[i]=n;
    colors[i]=color(sqrt(n[0]*n[0]+n[1]*n[1]+n[2]*n[2])*255/maxd,255,200);
  }
}

void draw() {
  background(255);
  
  stroke(0);
  box(200);
  translate(0,0,-130);
  scale(5);
  
  float x,y,z;
  for(int i=0;i<points;i++) {
    x=uni[i][0];
    y=uni[i][1];
    z=uni[i][2];
    
    uni[i][0]+=(sigma*(y-x))*step;
    uni[i][1]+=((-x*z)+(r*x)-y)*step;
    uni[i][2]+=((x*y)-(b*z))*step;
      
    stroke(colors[i]);
    line(x,y,z,uni[i][0],uni[i][1],uni[i][2]);
  }
}

void keyPressed() {
  reset();
}

