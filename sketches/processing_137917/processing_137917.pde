
void setup() {

  size(500, 500);
  background(255);
  noStroke();
}
int i = 10;
void draw() {
  while ( i <= 500 ) {  
    int j = 10;
    while ( j <= 500 ) {  
      fill(i, i/2, j/2, j);
      arc(i, j, 30, 30, 0, PI+QUARTER_PI, PIE);
      j = j + 60;
    }
    i = i + 60;
    
   
  }
}



