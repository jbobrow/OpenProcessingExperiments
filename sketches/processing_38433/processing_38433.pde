
void setup() {
  size (500, 500);
  background (0);
  rectMode(CENTER);
  ellipseMode(CENTER);
}

void draw() {
}

void mouseClicked() {  //setup redraw
  background (0);
  
  for (int x=20; x<width; x+=30) {  //Setup grid
    for (int y=20; y<height; y+=30) {

      float count;
      count=random(8);

      fill (255);
      rect (x, y, random(10), random(10));  //white rectangles

      if (count < 6) {
        noStroke();
        fill (0, 250, 100, random(100));  //green Circles
        ellipse (x, y, 40, 40);
      } 
      count ++;
    }
  }
}


