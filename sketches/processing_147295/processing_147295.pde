
float theta=0;
color[] c= {
  #FE0000, #0000FE, #FFFF01
};
int n=50;
float[] x=new float[n];
float[] y=new float[n];
int[] col=new int[n];

void setup() {
  size(700, 700, JAVA2D);
  background(#FFFFFF);
  for (int i=0;i<n;i++) {
    float radius = random(50, 200);
    float a = random(2*PI);
    x[i]=sin(a)*radius;
    y[i]=cos(a)*radius;
    col[i]=int(random(0, 3));
  }
  smooth(8);
  blendMode(SCREEN);
}

void draw() {
  background(#FFFFFF);
  theta+=.01;
  translate(width/2, height/2);
  for (int i=0;i<n;i++) {
    strokeWeight(abs(5*sin(theta*5-i)));
    stroke(3);
    fill(c[col[i]]);
    pushMatrix();
    translate(sin(theta*10-i)*15, cos(theta*10-i)*15);
    rect(x[i], y[i], 50*sin(theta*5-i), 50*sin(theta*5-i));
    popMatrix();
  }
}


