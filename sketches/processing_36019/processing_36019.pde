
void setup() {

  size(700,400);
}

void draw() {
  stroke(0,0,0);
  fill(255,255,255);
  for(int i=30;i<height;i+=60) {
    for(int j=30;j<width;j+=60) {
      float distance = dist(j,i,mouseX,mouseY);
      float radius   =  map(distance,0,50,1,30);
      ellipse(j,i,radius,radius);
    }
  }
}       
                
