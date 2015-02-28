
void setup() {
  size(600, 200);
}

void draw() {
  background(231,136,111);
  stroke(255);
  strokeWeight(2);
  for (int j= 0; j<= width; j+=width/25) {
    for (int i=0; i<=600; i+=600) {
      float distance=dist(mouseX,mouseY,j,i);
      line(j, i, distance, distance); 
    }
  }
}
