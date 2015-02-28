
float[] x = new float[100];

void setup(){
  size(300,300);
  smooth();
  noStroke();
  fill(255,200);
  for(int i = 0; i< x.length; i++){
    x[i] = random(-1000,200);
  }
}
void draw(){
  background(5);
  fill(252,143,8);
  for(int i =0;i < x.length; i++){
    x[i] +=1;
    float y = i *5;
    arc(x[i],y,12,12,0.52,5.76);
  }
}


