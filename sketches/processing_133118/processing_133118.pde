
void setup(){
  size (400,400);
  noStroke();
  background(255);
  smooth();
}
void draw(){
  //background(255);
  for(int i=0; i<400; i+=3) {
    for(int g=400; g>0; g-=20) {
      float r=random(255);
      float h=random(255);
      float b=random(255);
      float a=random(255);
      fill(r,h,b,a);
      ellipse(g,i,r,b);
      line(0,400,r,h);
  }
 }
}
