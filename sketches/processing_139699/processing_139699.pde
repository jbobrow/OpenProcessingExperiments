
/*
Jenny Hsu
 Benjamin Bacon
 Creative Computing Section B
 13 March 2014
 
 Week 5 Assignment
 Conditionals
 */

int x = round(random(0,255));

void setup() {
  size(400, 400);
  background(255);
}

void draw() {
  int i = 80;
  while ( i <= 300 ) {  // outter
    int j = 90;
    while ( j <= 300 ) {  // inner
      fill(i, x, x, 100);
      noStroke();
      rect(j, i, x, 20);      
      j = j + 50;
    }
    i = i + 50;
  }
}



