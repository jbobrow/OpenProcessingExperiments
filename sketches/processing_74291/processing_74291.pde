
int a = 20;
float[] theta1 = new float[a];
float[] theta2 = new float[a];
float[] x = new float[a];
float[] z = new float[a];
float[] y = new float[a];
float[] ve = new float[a];
float[] vf = new float[a];


void setup() {
    size(1024,768,P3D);
    frameRate(24);
    noStroke();
    for(int i=0; i<a; i++){
      theta1[i] = random(1000);
      theta2[i] = random(1000);
      ve[i] = random(0.05,0.3);
      vf[i] = random(0.05,0.3);
    }
}

void draw() {
  background(255);
  lights();
  
  
  for(int i=0; i<a; i++){
    //y=80*tan(i);
    translate(x[i]+mouseX,y[i]+mouseY,z[i]);
    sphere(10);
    x[i]=80*sin(theta1[i]);
    y[i]=80*sin(theta2[i]);
    z[i]=80*cos(theta1[i]);
    theta1[i]+=ve[i];
    theta2[i]+=vf[i];
    translate(-x[i]-mouseX,-y[i]-mouseY,-z[i]);
  }
}
