
void setup() {
  size(500, 500);
  smooth();
  background(0);
}

void draw() {
  stroke(1);
  fill(255);
  for (int i = 0; i <= width+50; i += 10) {
    for (int j = 0; j <= height+50; j += 20) {
      ellipse(i,j++,width/10,height/10);
      
    }
  }
  noStroke();
  fill(0);
  for (int i = 0; i <= width+50; i += 0) {
    for (int j = 0; j <= height+50; j += 20) {
      ellipse(i++,j-5,20,10);
    }
  }
  noStroke();
  fill(255);
  for (int i = 0; i <= width+50; i += 0) {
    for (int j = 0; j <= height+50; j += 20) {
      ellipse(i++,j++,15,10);
    }
  }
}


