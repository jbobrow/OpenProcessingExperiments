

int a = 200;

size(600, 600);
background(225);

  while ( a <= 400 ) {
    int b = 50;
    
    while (b <= 400) {
      fill(100, 100,200);
      noStroke();
      ellipse(a, b, 50,50);
      b = b + 50;
    }
    
    a = a + 100;
  }
  


