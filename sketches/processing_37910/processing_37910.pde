
//import processing.pdf.*;

void setup() {
  //size(1024, 768, PDF, "wallpaper.pdf");
  size(1024, 768);
  smooth();
  background(255);
  strokeWeight(2);
}

void draw() {
  for (int a=1; a<120*10;a=a +120) {
    for (int i=20; i < 1024; i= i + 20) { 
      line(i, 0+a, i +i/3, 80+a);
      line(i + i/3, 80+a, i, 120+a);
    }
  }
}



