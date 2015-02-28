
int a = 20;
float[] x = new float[a];
float[] y = new float[a];
float[] vx = new float[a];
float[] vy = new float[a];
float[] g = new float[a];
float[] r = new float[a];
float G;


void setup(){
  size(480,480);
  frameRate(30);
  noStroke();
  fill(0);
  int i;
  for(i=0;i<a;i++){
    x[i] = int(random(width));
    y[i] = int(random(0,300));
    vx[i] =int(random(-4,4));
    vy[i] =int(random(-4,4));
    g[i] =int(random(0.1,1));
    r[i] =int(random(10,40));
  }
}

void draw(){
  background(255);
  for(int i=0; i<a; i++){
    ellipse(x[i],y[i],r[i],r[i]);
    //text("Processing",x[i]-35,y[i]);
    //vx[i] = vx[i] +g[i];
    x[i] = x[i] + vx[i];
    vy[i] = vy[i] +1;
    y[i] = y[i] + vy[i];
    
    if (x[i] > width) {
      vx[i] = vx[i] * -1;
      x[i]=width;
    }
    if (x[i] < 0) {
      vx[i] = vx[i] * -1;
      x[i]=0;
    }
    if (y[i] > height) {
      print(vy[i]);
      vy[i] =vy[i] * -1;
      y[i] =height;
      println(" "+vy[i]);
    }
    if (y[i] < 0) {
      vy[i] =vy[i] * -1;
      y[i] =0;
    }
  }
}
