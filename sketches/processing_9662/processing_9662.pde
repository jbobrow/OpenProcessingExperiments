
int a = 0;

void setup() {
  size(400, 100);
  //frameRate(1);
}

void draw() {
  // use mouse position to change a
  background(200);
  
  // 2^n
  int myresult = power2(a);
  //println("2 ^ " + a + " = " + myresult);
  String sa = "2 ^ " + a + " = " + myresult;
  
  // N!
  myresult = factorial(a);
  //println(a + "! = " + myresult);
  String sb = a + "! = " + myresult;
  
  // Fibonacci Numbers
  myresult = fibonacci(a);
  //println("Fibonacci numbers at position " + a + " is " + myresult);
  String sc = "Fibonacci numbers at position " + a + " is " + myresult;
  
  PFont font = loadFont("Arial-BoldMT-12.vlw");
  textFont(font, 12);
  fill(0);
  text(sa, 20, 20);
  text(sb, 20, 50);
  text(sc, 20, 80);
}

int power2 (int n) {
  int answer;
  if ( n == 0 ) {
    return 1;
  } else {
    answer = power2(n-1) * 2;
    return answer;
  }
}

int factorial(int n) {
  if ( n == 0 ) {
    return 1;
  } else {
    int answer = n * factorial(n-1);
    return answer;
  }
}

int fibonacci(int n) {
  if ( n <= 1 ) {
    return 1;
  } else {
    int answer = fibonacci(n-1) + fibonacci(n-2);
    return answer;
  }
}

void mouseReleased() {
  a = mouseX%15;
  println(a);
  redraw();
}

