
int a = 20;
float[] x = new float[a];
float[] y = new float[a];
float[] z = new float[a];
float[] vx = new float[a];
float[] vy = new float[a];
float[] vz = new float[a];
float[] g = new float[a];
float[] r = new float[a];
float G;


void setup(){
  size(1000,800,P3D);
  frameRate(30);
  colorMode(RGB,300);
  noStroke();
  int i;
  for(i=0;i<a;i++){
    x[i] = int(random(250,750));
    y[i] = int(random(100,600));
    z[i] = int(random(-1000,1000));
    vx[i] =int(random(-4,4));
    vy[i] =int(random(-4,4));
    vz[i] =int(random(-4,4));
    g[i] =random(0.1,1);
    r[i] =int(random(10,40));
  }
}

void draw(){
  background(300);
  lights();
  for(int i=0; i<a; i++){
    pushMatrix();
    fill(550-x[i],550-y[i],150);
    translate(x[i],y[i],z[i]);
    sphere(10);
    //vx[i] = vx[i] +g[i];
    x[i] = x[i] + vx[i];
    vy[i] = vy[i] +1;
    y[i] = y[i] + vy[i];
    z[i] = z[i] + vz[i];
    
    if (x[i] > 750) {
      vx[i] = vx[i] * -1;
      x[i]=750;
    }
    if (x[i] < 250) {
      vx[i] = vx[i] * -1;
      x[i]=250;
    }
    if (y[i] > 600) {
      vy[i] =vy[i] * -1;
      y[i] =600;
    }
    if (y[i] < 100) {
      vy[i] =vy[i] * -1;
      y[i] =100;
    }
    if (z[i] > 300) {
      vz[i] =vz[i] * -1;
      z[i] =300;
    }
    if (z[i] < -300) {
      vz[i] =vz[i] * -1;
      z[i] =-300;
    }
    popMatrix();
  }
}
