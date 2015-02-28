
int a = 0;
float b = 0;

void setup () {
  size(600, 600);
  background(255);
}

void draw () {
  while (a < 600) {
    stroke(b);
    line(a, 0, a, 600);
    a=a+1;
    b=b+(.425);
  }
}



