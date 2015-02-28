
int i =0;
void setup() {
  size(800, 800);
}
void draw() {
  translate(200, 200);
  for (int x=0;x<510;x+=1) {
    for (int y = 0;y<510;y+=1) {
      i = i+1;

      stroke(i/2, x/2, y/2);
      point(x, y);
    }
  }
}


