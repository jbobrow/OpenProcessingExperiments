
size (400, 400);

int i = 100;
while ( i <= 300 ) {  // outter

  int j = 100;
  noStroke();
  rect (i, j + j, 30, 30);
  
  while ( j <= 300 ) {  // inner
    noStroke();
    fill(0, 0, 255, i);
    ellipse(j, i, 20, 20); 
    
    j = j + 50;
  }
  
  i = i + 50;
}



