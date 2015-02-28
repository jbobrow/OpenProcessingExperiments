
size(500, 500);

int i = 50;

while (i < 500) {
  int j = 50;
  while ( j < 500) 
  {
    //ears
    fill(255);
    ellipse(j-10, i-10, 20, 20); 
    ellipse(j+10, i-10, 20, 20);
    
     fill(255);
    ellipse(j, i, 30, 30);
    
    //eyes
    fill(0);
    ellipse(j-7, i-3, 3, 5); 
    ellipse(j+7, i-3, 3, 5);
    
    triangle(j-2, i, j+2, i, j, i+2);
    
    
    j = j + 60;
  }
  i = i + 60;
}



