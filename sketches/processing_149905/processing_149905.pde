
void setup() {
  size(200,200);
}

void draw() {
  for(int a=0; a<width; a++) {
    line(0,(a*10),(height-(a*10)), 0);
  }
}


