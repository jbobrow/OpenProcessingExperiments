
int a;


void setup() {
  size(200, 200);
  a = 10;
}
void draw() {


  rect(a, 180, 10, 10);
  if (key == 'd') {
    a += 10;
  }
}


