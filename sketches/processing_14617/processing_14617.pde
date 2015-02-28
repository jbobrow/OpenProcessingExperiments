
void setup() {
  size(200,200);
  background(255);
}

void draw() {
  for(int i = 20; i < 180; i = i + 3) {
    for(int x = 20; x < 180; x = x + 3) {
      if(!(i>60 && x>60 && i<140 && x<140)) {
        point(i,x);
      }
    }
  }
}
