
float[] x =new float[100000];
float[] y =new float[100000];
void setup() {
  size(800,800);
  for (int i = 0; i<100000 ; i++){
    x[i] = random(width);
    y[i] = random(height);
  }
}
void draw(){
  background(255);
  for (int i = 0; i<100000 ; i++){
    y[i]++;
    ellipse(x[i],y[i],5,5);
  }
}
