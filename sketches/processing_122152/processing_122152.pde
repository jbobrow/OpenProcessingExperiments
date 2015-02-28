
///////////////////////////////////////////////////////////////////////////////////
// Newton's Method:  User defined section.
// Define the function
float f(float x) {
  return cos(x)-x;
}

// Define the derivative of the function (must be consistent with above)
float df(float x) {
  return -sin(x)-1;
}

// Define an initial guess
float x_current = 1;

// Define max number of iterations.
int N=5;

// End user defined section.
///////////////////////////////////////////////////////////////////////////////////
float newton(float x) {
  return x-f(x)/df(x);
}
void setup() {
  // Canvas size
  size(200,100);
  println("Newton's Method.");
  println("Iteration 0: " + x_current);
  for(int i=1; i<=N; i++) {
    x_current = newton(x_current);
    println("Iteration " + i + ": " + x_current);
  }
}

void draw() {
  background(255);
  fill(0);
  textAlign(CENTER);
  textSize(16);
  text("Newton's Method", width/2, height/2 - 20);
  text("(see console output below)", width/2, height/2 + 20);
  
}


