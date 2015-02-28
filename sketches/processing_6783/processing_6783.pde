
// Harmonograph
// by Steven Kay
// 6-pendulum formula, 2 pendulums per axis (x,y,z)
// 

float f1,f2,f3,f4,f5,f6; //frequencies
float fscale=20.0;

float p1,p2,p3,p4,p5,p6; //phase shifts
float pscale=TWO_PI;

float a1,a2,a3,a4,a5,a6; //amplitudes
float ascale=1.0;

float k=220.0; //SIZE
float E=2.71828; // 
float damping=0.001; // increase to make figure shrink over size, e.g 0.1 or 0.01

float tstart=0.0;

int LENGTH=200; // length of trail in boxes
int SIZE=20; // size of largest box

void setup() {
  size(512,512,P3D);
  background(0);
  color(255);
  fill(255);
  reset();
}

void mousePressed() {
  reset();
}

void draw() {

  background(0);
  
  float step=.01; // gap between boxes
  float damp=k*pow(E,-damping*tstart); // damping

  camera(0.0,0.0,500.0,0.0,0.0,0.0,0.0,-1.0,0.0);
  
  // tumble
  rotateX(radians(frameCount%360));
  rotateZ(radians(frameCount%360));
  
  // draw trails
  for (int i=0;i<LENGTH;i++) {
    float t=tstart+(step*(float)i);    
    float x=damp*(a1*sin(f1*t + p1) + a2*sin(f2*t + p2)); 
    float y=damp*(a3*sin(f3*t + p3) + a4*sin(f4*t + p4)); 
    float z=damp*(a5*cos(f5*t + p5) + a6*cos(f6*t + p6));
    float pc=(float)i/LENGTH;
    float op=pc*255.0; //color
    fill(op);
    pushMatrix();
      translate(x,y,z);
      box(pc*SIZE,pc*SIZE,pc*SIZE);
    popMatrix();
  }
  tstart+=step;
  
}

void reset(){
  // 
  tstart=0.0;
  // frequencies
  f1=random(0,1.0)*fscale;
  f2=random(0,1.0)*fscale;
  f3=random(0,1.0)*fscale;
  f4=random(0,1.0)*fscale;
  f5=random(0,1.0)*fscale;
  f6=random(0,1.0)*fscale;
  
  // phase angles
  p1=random(0,1.0)*pscale;
  p2=random(0,1.0)*pscale;
  p3=random(0,1.0)*pscale;
  p4=random(0,1.0)*pscale;
  p5=random(0,1.0)*pscale;
  p6=random(0,1.0)*pscale;
  
  // amplitudes
  a1=random(0,1.0)*ascale;
  a2=random(0,1.0)*ascale;
  a3=random(0,1.0)*ascale;
  a4=random(0,1.0)*ascale;
  a5=random(0,1.0)*ascale;
  a6=random(0,1.0)*ascale;
  
}

