
void setup() {
  println(factorial(5)+" valor factorial");
}


int factorial(int n) {
  for (int i=n-1;i>=1;i--) {
    n=n*i;
    println(i+" valor i");
    println(n+" valor n");
    
  }
  return n;
}
