
void setup() {
  size(800, 600);
  smooth();
  loop();
}

void draw() {
  for (int x=0; x<width; x+=10)
    for (int y= 0; y<height; y+=10) {

     
      fill(random(180,200), random(50,80), 0);
      
      beginShape();
      vertex(x + random(-10, 10), y + random(-10, 10));
      vertex(x + random(-10, 10) + 10, y + random(-10, 10));
      vertex(x + random(-10, 10) + 10, y + random(-10, 10) + 10);
      vertex(x + random(-10, 10), y + random(-10, 10) + 10);
      endShape(CLOSE);
    }
}


