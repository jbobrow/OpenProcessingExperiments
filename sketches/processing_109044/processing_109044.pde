
void setup () {
  size(1200, 900);
  background(252, 249, 181);
  smooth();
  noStroke();


  for (int y = 0; y <= height; y += 60) {
    for (int x = 0; x <= width; x += 60) {
      color c = color(random(255), random(255), random(255));
      fill(c);
      ellipse(x, y, 40, 40);
      
//horizontal black
      for (int g = -300; g < 4000; g= g+60) { 
        ellipse(g-60, 120, 40, 40);
        fill(0, 0, 0);
      }
      
//vertical black
     for (int j = 300; j<4000; j=j+60) { 
        ellipse(120, j-420, 40, 40);
        fill(0, 0, 0);
      }
    }
  }
}
