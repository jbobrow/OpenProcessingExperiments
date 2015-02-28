
float [] x=new float [3000];
void setup() {
  size(1000,500);
  smooth();
  noStroke();
  for(int i=0;i<x.length;i++) {
    x[i] =random(-100,200);
}
}
void draw() {
 background(0);
 for(int i=0;i<x.length;i++) {
     
      x[i]+=10;
      float y=i*0.4;
      arc(x[i],y,12,12,0.52,5.76);
    if(x[i]>=width) {
      x[i] =random(-100,400);
    }
  }

}
  
  
    


