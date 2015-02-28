
void setup() {
  size(500, 500);
  background(255);
  smooth();
}

void draw() {
  int i = 100;
  while ( i <= 400 ) {
    int j = 100;
    while ( j <= 400 ) { 
      stroke(i,mouseX,mouseY)
      noFill();
      rect(20,20,460,460);
      stroke(255);
      fill(i,mouseX,mouseY,100);
      ellipse(j,i, 10, 10);      
      j = j +20;
    }
    i = i + 20;
  }
}

