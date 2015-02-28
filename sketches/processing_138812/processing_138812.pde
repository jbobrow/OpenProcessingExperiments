
void setup() {
  size(500, 500);

  smooth();
}

void draw() {
  background(255);
  int i = 50;
  while ( i <= 450 ) {
    int j = 50;
    while ( j <= 450 ) {

        noStroke();
        fill(i, j,random(0,255), 100);
        ellipse(j,i, map(mouseX,0,500,0,20), map(mouseX,0,500,0,20));  
        j = j +20;
      }
    
    i = i + 20;
  }
}

