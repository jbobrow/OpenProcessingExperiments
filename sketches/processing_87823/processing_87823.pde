
void setup() {
  size(500, 500);
  smooth();
  background(0);
}

void draw() {
  stroke(255);
  for (int i = 0; i <= width+20; i += 30) {
    for (int j = 0; j <= height+20; j += 10) {
      line(i++,j++,width/5,height/5);
      
    }
  }
}


