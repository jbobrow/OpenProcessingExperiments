
int num = 1;

void setup() {
    size(250,70);
    background(35);
    textSize(32);
    fill(255);
    text(str(fib(num)), 10, 30);
    text(str(num), 10, 64);
    
}

int fib(int n){
  if(n <= 0){ return n * -1; }
  return fib(n - 1) + fib(n - 2);
}

void mouseClicked(){
    num++;
    background(35);
    textSize(32);
    fill(255);
    text(str(fib(num)), 10, 30);
    text(str(num), 10, 64);
}
