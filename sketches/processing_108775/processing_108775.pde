
void setup() {
  size(600, 600);
  smooth();
  colorMode(HSB, 540, 560, 50);
}

void draw() {
  background(220, 220, 220);
  noStroke();
  for (int x =800; x>0; x-=10) {
    rectMode(CENTER);
    fill(x/2, 100, 100);
    rect(width/2, height/2, x, x);
  }
//large circle
  for (int i = 20; i < 600; i+=40)
    for (int j = 20; j<600; j +=40) {
      fill(i/3, j/3, 100, 100);
      ellipse(i, j, 30, 30);
    }
    
//small circle
  for (int a = 20; a < 800; a+=40)
    for (int b = 20; b<800; b +=40) {
      fill(a, b, 100,100);
      ellipse(a, b, 10, 10 );
  }
}



