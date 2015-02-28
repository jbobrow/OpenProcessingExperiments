
void setup(){
  size(600,600);
}

void draw(){
  stroke(255,255,255);
  fill(0,0,0);
  for(int i=30; i<height; i+=60){
    for(int j=30; j<width; j+=60){
      float distance = dist(j,i,mouseX,mouseY);
      float radius = map(distance,0,50,1,30);
      ellipse(j,i,radius, radius);
    }
  }
}

