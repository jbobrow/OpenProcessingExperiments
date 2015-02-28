
void setup() {
  size(500, 500);
  smooth();
  background(255);
}

void draw() {
  for (int i = 10; i <= width-10; i += 20) {
    for (int j = 10; j <= height-10; j += 20) {
      line(i,j,width/2,height/2);
      
    }
  }
}


