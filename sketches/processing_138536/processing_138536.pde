
int nbolas =200;
float[] x = new float[nbolas];
float[] y = new float[nbolas];
float[] t = new float[nbolas];
void setup () {
  size (800,800);
  for (int i = 0; i < nbolas; i++) {
    x[i] = random(width);
    y[i] = random(height);
    t[i] = random(2,10);
  }
}
void draw(){
  background(255);
  for(int i = 0; i <nbolas ; i++){
    y[i]++;
    if(y[i]>5){
    fill(0);
    }else{
      fill(255);
    }
    ellipse(x[i],y[i],t[i],t[i]);
    if(y[i]>height){
      y[i] = 0;
    }
  }
}

