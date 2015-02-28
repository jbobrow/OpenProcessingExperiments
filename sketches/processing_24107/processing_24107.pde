
void setup() {
  size(250, 250);
  colorMode(HSB, 360, 100, height);
  noStroke();
  background(0);
}

void draw() {
  for(int i=width; i>=0; i-=2) {
     for(int j=width; j>=0; j-=1) {
       fill(random(mouseX),random(mouseY),random(255));
       rect(i, j, 2, 1);
     }  
  }
}


