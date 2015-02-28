
int a = 20;
int b = 40;
int c = 60;

void setup () {
  size(200, 200);
 
  
}

void drawSum(int a, int b, int c) {
  int total = a + b + c;
  println(total);
}

void draw() {
  background(0);
  drawSum(a, b, c);
}

