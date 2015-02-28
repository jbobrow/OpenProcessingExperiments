
int howMany=400;

float[] x=new float[howMany];
float[] y=new float[howMany];
float[] dia=new float[howMany];
float[] speed=new float[howMany];

void setup() {
  size(400,400);
  for(int i=0;i<howMany;i++){
  x[i]=random(width);
  dia[i]=random(5,20);
  speed[i]=random(0.5,5);
}
  
  smooth();
}
//프로세싱은 좌표값이 소수점을 지원한다.

void draw() {
  background(255);
  for(int i=0;i<howMany;i++) {
  strokeWeight(dia[i]);
  point(x[i],y[i]);
  if (y[i]>height+dia[i]/2) {
    x[i]=(random(width));
    y[i]=-1*dia[i]/2;  
      //speed[i]=random(0.5,5);
  }
  else {
  y[i]+=speed[i];  
  }
 }
}

