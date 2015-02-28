
void setup() {
  size(600,600);
  background(0);
}

void draw() {
  

  
  noStroke ();
  int i = 0;
  while ( i <= mouseY ) {
    fill(i,40,200,1);
    rect(0,i, 600,20);
    i = i + 50;
  }
  
  int j = 0;  
  while ( j <= mouseX*2 ) {
    fill(j,mouseX,mouseY,100);
    rect(j,i, 20,20);
    j = j + 50;
  }
  
}


