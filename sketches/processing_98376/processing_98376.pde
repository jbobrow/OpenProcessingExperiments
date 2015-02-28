
// Fizz Buzz test for HackerSchool
// Processing 1.5.1
// by Diego Zaks

int c = 1;

void setup() {
  size(640, 480);
  background(255);
  frameRate(10);
}


void draw() {
  if (c < 101) {
    // Create a void to handle the math
    fizzbuzz();
    c += 1;
  }
  else {
    println("HackerSchool Application Complete");
    noLoop();
  }
}

void fizzbuzz() {
  // Define if divisible by 3 & 5
  if (c % 3 == 0 && c % 5 == 0) {
    println("FizzBuzz");
  }
  // Multiple of 3
  else if (c % 3 == 0) {
    println("Fizz");
  }
  // Multiple of 5
  else if (c % 5 == 0) {
    println("Buzz");
  }
  // Everybody else
  else {
    println(c);
  }
}
