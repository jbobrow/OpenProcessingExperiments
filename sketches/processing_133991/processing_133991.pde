
float x=0;
int y=55;
void setup() {
  size(100, 100);
}

void draw() {
  background(204);
  line(x,y, x+20, y-40);
  line(x+10, y, x+30, y-40);
  line(x+20, y, x+40, y-40);
  x= x+0.1;
  println( x );
  if (x > 100) {
    x= -10;
  }
}



