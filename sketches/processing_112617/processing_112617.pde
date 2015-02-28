
//import processing.pdf.*;

void setup() {
//  size(500, 500, PDF, "wallpaper.pdf");

  size(500, 500);
  background(255);
  stroke(1);
  smooth();
  int r = 80;
  for (int i = -r*2; i < r*2; i++) {
    float j = sqrt((r*r) - (i*i));
    rotate(radians(random(i, i*100)*i)); 
    for (int k = i - r/10; k < i + r/10; k++) {
      int posx = int(random(k, k*2));
      int posy = int(random(i, i*2));

      line(i+posx, k-i, i+posx+5, k+i);
    }
  }
}

void draw() {
//  println("Finished.");
//  exit();
}
