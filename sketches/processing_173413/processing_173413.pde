
int drawWidth = 500;
void setup() {
  size(1000, 500);
  background(0);
  stroke(255);
  textAlign(CENTER);
  textSize(32);
  text("The Sieve of Eratosthenes", 750, 40);
  textSize(16);
  text("White = composite\nBlack = prime", 750, 100);
  text("The Sieve of Erathosthenes starts iterating at 2 and " +
    "if\nthe current number is found to be prime, goes through\nall " +
    "the other numbers and draws a white point if the\nprime number" +
    " is a factor.  In this case, there are\n500*500 numbers, so we" +
    " only need to iterate from\n2 - 500 to confirm that all " + 
    "composite numbers from\n2 - 500*500 have been colored white. " +
    " The result is an\ninteresting pattern in the primes.", 750, 160);
  text("Press any key to restart.", 750, 380);
}

void drawInfo() {
  textSize(32);
  text("The Sieve of Eratosthenes", 750, 40);
  textSize(16);
  text("White = composite\nBlack = prime", 750, 100);
  text("The Sieve of Erathosthenes starts iterating at 2 and " +
    "if\nthe current number is found to be prime, goes through\nall " +
    "the other numbers and draws a white point if the\nprime number" +
    " is a factor.  In this case, there are\n500*500 numbers, so we" +
    " only need to iterate from\n2 - 500 to confirm that all " + 
    "composite numbers from\n2 - 500*500 have been colored white. " +
    " The result is an\ninteresting pattern in the primes.", 750, 160);
  
  text("Press any key to restart.", 750, 380);
}

int row = 0;
int col = 2; 
void draw() {
  if (keyPressed) {
    row = 0;
    col = 2;
    clear();
    drawInfo();
  }

  int num = row*drawWidth + col;
  if (num <= Math.sqrt(drawWidth*height)) {
    if (isPrime(num)) {  

      int x = (col+1) == drawWidth ? 0 : col + 1;
      int y = (col+1) == drawWidth ? row + 1 : row;

      // find what num divides
      for (int i = num+1; i < drawWidth*height; i++) {
        // Make sure it hasn't already been found composite
        // and then check
        if (i % num == 0) {
          point(x, y);
        }
        // Control point variables
        if (x + 1 == drawWidth) {
          y++;
          x = 0;
        } else {
          x++;
        }
      }
      // println(num);
    }
  } else {
    textSize(22);
    text("Done", 750, 430);
  }

  if (col+1 == drawWidth) {
    row++;
    col = 0;
  } else {
    col++;
  }
}

boolean isPrime(int num) {
  for (int i = 2; i*i < num; i++) {
    if (num % i == 0) {
      return false;
    }
  }
  return true;
}



