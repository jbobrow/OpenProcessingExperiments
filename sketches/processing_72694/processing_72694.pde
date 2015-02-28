
void setup() {
  for (int x =0;x<100;x+=1) {
    for (int y=0;y<100;y+=1) {
      stroke(x+y*2,0,0);
      point(x, y);
    }
  }
}


