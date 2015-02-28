
float [] x = new float [100];
float[] y= new float[100];
float[] t= new float [100];
float[] v= new float [100];
float[] c= new float [100];


void setup () {
  size(500,500);
  for(int p = 0; p <x.length; p++){
    x[p] = random(width);
    y[p]=random(height);
    t[p]=random(5,50);
    v[p]=random(0.1,5);
    c[p]=random (1,255);
  }
}
void draw(){
  background(0);

  for (int p = 0; p <x.length; p++){
    //x[p]++;
    x[p]+=v[p];
    if(x[p] >width){
      x[p]=0;
    }
    ellipse(x[p],y[p],t[p],t[p]);
  }
}
