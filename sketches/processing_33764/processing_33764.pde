
void setup() { 
  size(800, 500);
  background (33);
  smooth();
}

//input fibonacci sequence, unknown number of items
int[] fibonacci = { 
  0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946, 17711, 28657, 46368, 75025, 121393, 196418, 317811, 514229, 832040, 1346269, 2178309, 3524578, 5702887, 9227465, 14930352, 24157817, 39088169
};


void draw() {
  // background (33);

//for loop, count from 0 to fibonacci sequence length
  for (int i = 0; i<fibonacci.length; i+=2) {
    for (int j = 0; j<fibonacci.length; j+=2) {
      
      //mapping fibonacci length to doc's width and height
      float fib = map(i, 0, fibonacci.length, 0, width);
      float fib2 = map(i, 0, fibonacci.length, 0, height);

      //draw a set of rectangles, color and position based on fibonacci seq
      fill (fib, 0, 0, 1);
      noStroke();      
      rect (fib+2, fib2+2, 25, 25);

      //lines' pos based on fibonacci sequence
      stroke(random(0, fib), 10);
      strokeWeight(1);
      line (fib+2, fib2+2, mouseX, mouseY);
      line (fib+2+25, fib2+2+25, mouseX, mouseY);

    }
  }
}

// press a to know length of array
void keyPressed() {
  if (key == 'a') {
    println (fibonacci.length);
  }
}


