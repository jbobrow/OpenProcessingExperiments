
void setup() {
  size(400,400);
  stroke(255);
  colorMode(RGB,100);
  background(0);
}

int fib(int n) {
  if(n <= 0) {
    return 0;
  } 
  if(n == 1) {
    return 1; 
  }
  return fib(n-2)+fib(n-1);
}

void strokeFib(int n) {
  for(int i = 0 ; i < n ; i++) {
    int fx = fib(i);
    stroke(100,100,100,10);
    line(0, 0, fx, 0);
    translate(fx,0);
    rotate(PI*.5);
  }
}

void draw() {
  translate(width/2,height/2);
  rotate(frameCount/TWO_PI);
  strokeFib(20);
}
