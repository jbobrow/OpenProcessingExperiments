
// Regular orbits of a pendulum
// Eulers methods
float eps=0.001;
float mx=PI;
float my=5.0;
float nbo=-30.0;
float lx=1000;
float ly=800;

void setup()
{
 // size((int)lx,(int)ly);
  size(1000,800);
  background(0);
  smooth();
  stroke (255,0,0);
}
 
void draw()
{
  if (nbo<30)
    {
    traceOrbite(0.0,nbo/8,12.0);
    nbo++;
    }
}
void traceOrbite(float x,float v,float t){
  float i,x1,v1;
  i=1.0;
  while (i<t/eps){
    x1=x+eps*v;
    v1=v-eps*(float)Math.sin(x);
    trace(x,v,x1,v1);
    if (x1>PI)
      x1=x1-2*PI;
    if (x1<-PI)
      x1=x1+2*PI;  
    x=x1;
    v=v1;
    i++;  
  }
}
void trace(float xa,float ya,float xb,float yb){
 line ( (1+xa/mx)*lx/2,(1+ya/my)*ly/2, 
       (1+xb/mx)*lx/2,(1+yb/my)*ly/2);
}
void keyPressed() {
  if (key == 's') {
    save("orbite.jpg");
  }
}


