
void setup() {
  size(600, 600);
 
  smooth();
}
 
void draw() {
  background(0);
  int i = 100;
  while ( i <= 500 ) {
    int j = 100;
    while ( j <= 500 ) {
 
        noStroke();
        fill(i, j,random(0,255), 100);
        ellipse(j,i, map(mouseX,0,500,0,20), map(mouseX,0,500,0,20)); 
        j = j +20;
      }
    i = i + 20;
  }
}



