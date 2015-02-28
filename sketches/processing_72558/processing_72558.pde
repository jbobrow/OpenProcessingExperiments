
void setup() {
  size (400, 600);
}
void draw() {
  background (96, 29, 206);
  noStroke();
  for (int counter = 0; counter < 200; counter = counter + 1) {
    fill (random (36), random (240), random (180));
    ellipse (random(width), random(height), 40, 40);
  }

  for (int line_x = 0; line_x < width; line_x +=20) {
    line (line_x, 0, line_x, height);
  };
}



//ellipse (random(width), random(height), 40, 40);
//ellipse (random(width), random(height), 40, 40);
//ellipse (random(width), random(height), 40, 40);
//ellipse (random(width), random(height), 40, 40);
//ellipse (random(width), random(height), 40, 40);
//ellipse (random(width), random(height), 40, 40);
//ellipse (random(width), random(height), 40, 40);
//ellipse (random(width), random(height), 40, 40);
//ellipse (random(width), random(height), 40, 40);
//ellipse (random(width), random(height), 40, 40);
//ellipse (random(width), random(height), 40, 40);
//ellipse (random(width), random(height), 40, 40);
//ellipse (random(width), random(height), 40, 40);
