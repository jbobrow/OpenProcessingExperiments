
void setup() {
  size(500,500);
  background(0);
}

void draw() {
  int w = width;
  int c = width/2;
  stroke(255);
  for(float r=c*1.3;r>0;r-=.1) {
    float a=r*(mouseY+mouseX*270)*.0001;
    point(c+cos(a)*r*sin(r),c+sin(a)*r*sin(r));
  } 
  filter(BLUR);
  blend(0,0,w,w,-2,2,w+2,w-5,BLEND);
}



