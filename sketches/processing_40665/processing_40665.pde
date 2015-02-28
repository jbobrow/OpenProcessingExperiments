
void setup()
{
  size(600, 600);
  colorMode(RGB, 200);
  smooth(); // anti-aliasing
  noLoop();
  noStroke();
}
 
 
void draw() {
  noStroke();
  colorMode(HSB, 600);
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < width; j++) {
 
      stroke(i, j, 600);
      point(i, j);
    }
  }
 
  noStroke();
  for (int i=0;i <width;i+=20) {
    fill(random(100), 100, 100, 100);
    rect(width/2, width/2, width/2-50-i, width/7, width/5, width/2-65-i);
    fill(random(20), 50, 150, 15);
rect(width/8, width/3, width/2-50-i, width/2, width/1.5, width/2-30-i);
fill(random(50), 100, 50, 25);
        fill(random(50), 100, 50, 125);
    rect(width/6, width/9, width/2-25-i, width/5, width/7, width/2-30-i);
            fill(random(50), 100, 250, 150);
    rect(width/6, width/5, width/2-600-i, width/6.5, width/7.5, width/2-150-i);
  }
}

                
                
