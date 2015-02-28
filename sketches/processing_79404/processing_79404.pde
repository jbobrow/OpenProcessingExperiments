
int num=100;
float[] x=new float[num];
float[] y=new float[num];
int r=50;
float theta;
int idx;
int i=0;


void setup(){
  size(400,400);
  smooth();
}

void mousePressed(){
  x[idx]=mouseX;
  y[idx]=mouseY;
  idx++;
}

void draw(){
  for(int i=0;i<num;i++){
  theta+=5;
  x[i] = x[i]+r*cos(theta);
  y[i] = y[i]+r*sin(theta);
  ellipse(x[i],y[i],20,20);
}
}
