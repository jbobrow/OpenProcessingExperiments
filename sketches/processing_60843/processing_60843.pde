
int h_length=160;
int h_width = 10;
int m_length=230;
int m_width = 10;
int s_length=200;
int s_width = 10;
int path_elems=1500;

int [][] paths;

float h = 0;
float m = 0;
float s = 0;

float speed = 1500;

int       clock;
int       dTime;
int       iteration = 0;


void setup() {
  size(600,600,P3D);
  paths = new int[path_elems][2];
  for (int i=0;i<path_elems;i++) {
    paths[i][0]=0;
    paths[i][1]=0;
  }
}

void draw() {
  dTime=millis()-clock;
  int fps = int(1000/dTime);
  clock=millis();
  iteration++;
  background(0);
  lights();
//  smooth();
  
  s=speed*millis()/1000;
  m=speed*millis()/1000/60;
  h=speed*millis()/1000/60/60;
  
  if (m>60) {
    m-=60*int(m/60);
  }
  if (s>60) {
    s-=60*int(s/60);
  }
  
  translate(width/2,width/2);
  
//  translate(h_length/2,0);
  
  int xh=int(h_length*cos(2*PI*h/12-PI/2));
  int yh=int(h_length*sin(2*PI*h/12-PI/2));
  
  int xm=int(m_length*cos(2*PI*m/60-PI/2));
  int ym=int(m_length*sin(2*PI*m/60-PI/2));
  
  int xc=(xh+xm)/2;
  int yc=(yh+ym)/2;
  
  paths[path_elems-1][0]=xc;
  paths[path_elems-1][1]=yc;
  
  for (int i=0;i<path_elems;i++) {

    if (i<path_elems-1) {
      paths[i][0]=paths[i+1][0];
      paths[i][1]=paths[i+1][1];
    }
//    print(paths[i][0]+" ");

    if (i>0 && (paths[i-1][0]!=0 || paths[i-1][1]!=0)) {
      stroke(mkColor(float(i)/path_elems));
      line(paths[i-1][0],paths[i-1][1],paths[i][0],paths[i][1]);
    }
  }
  
  noStroke();
  fill(255);
  
  pushMatrix();
  rotateZ(2*PI*h/12-PI/2);
  rotateX(0.7);
  translate(h_length/2,0);
  box(h_length,h_width,h_width);
  popMatrix();
  
  pushMatrix();
  translate(xh,yh);
  sphere(10);
  popMatrix();
  
  pushMatrix();
  rotateZ(2*PI*m/60-PI/2);
  rotateX(0.7);
  translate(m_length/2,0);
  box(m_length,m_width,m_width);
  popMatrix();
  
  pushMatrix();
  translate(xm,ym);
  sphere(10);
  popMatrix();
  
  pushMatrix();
  translate(xc,yc);
  sphere(10);
  popMatrix();
  
  sphere(20);
  
  stroke(55);
  line(xh,yh,xm,ym);
  
  //println("FPS: "+fps+" uptime "+millis()/1000+" "+int(h)+":"+int(m)+":"+int(s)+" dbg"+iteration);
  
}


color mkColor(float c) {
  color cl = color(255*c,0,4*255*(1-c)*c);
  return cl;
}

