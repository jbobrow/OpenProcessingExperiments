
size(600,600);
noStroke();
background(0);

  int b = 10;
  while (b <= 700) {
    int c = 10;
    while ( c <= 700) {
      fill(b, c, 255, 10);
      rect(0+sin(c)*500, b, 200, 10);
      c = c + 10;
    }
    b = b + 10;
    
  }
  
 int i = 0;
  while ( i <= 700) {
     int a = 0;
  while ( a <= 700 ) {
     fill (a, 100, 100, 50);
    ellipse(a, 500+sin(i)*100, 50, 50);
    a = a + 50;
  }
        i = i + 50;
  }
  
  
 int k = 10;
  while ( k <= 380 ) { 
    int j = 50;
    while ( j <= 700 ) { 
      fill(k,j,250,50);
      rect(k, 100+sin(j)*100, 50,1);      
      j = j + 10;
    }
    k = k + 10;
    
  }
  
      


