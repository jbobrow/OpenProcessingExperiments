

float[] x = new float[100];
float[] y = new float[100];


void setup(){
  size(screen.width,500);
  smooth();
  for (int i=0;i<100;i++){
    x[i]=0;
    y[i]=0;
  }
}

void draw(){
  background(0);
  fill(random(10,255),255,255,100);
  
  for (int i=99;i>0;i--){
    ellipse(x[i],y[i]-10*i,30,30);
    x[i]=x[i-1];
    y[i]=y[i-1];
  }
  ellipse(x[0],y[0],30,30);
  x[0]=mouseX;
  y[0]=height;

}










