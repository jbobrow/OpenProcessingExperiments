
void setup() {
  size(600, 600);
}
int yVar = 0;
int xVar = 4;
int aVar = 600;
int bVar = 0;


void draw() {
  line(0, xVar, yVar, 600);
  xVar += 4;
  yVar += 4;
  
  line(0, aVar, bVar, 0);
  aVar -= 4;
  bVar += 4;
  
    line(0, xVar, yVar, 600);
  xVar += 4;
  yVar += 4;
}
