
void setup() {
  size(800, 800);
  smooth();
}

void draw() {
  background(235);
  noFill();

  int i = 1;
  while (i<300) {
    stroke(26, 27, 77, 90);
    ellipse(400, 400, 200-i, 20-i);
    stroke(#A20013, 90);
    ellipse(400, 400, 20-i, 200-i);

    stroke(26, 27, 77, 20);
    ellipse(400, 400, 500-i, 5-i);
    stroke(#A20013, 20);
    ellipse(400, 400, 5-i, 500-i);

    stroke(21, 22, 62, 90);
    ellipse(400, 400, 50-i, 5-i);
    ellipse(400, 400, 5-i, 50-i);

    stroke(26, 27, 77, 70);
    ellipse(400, 0, 800-i, 1000-i);
    ellipse(400, 800, 800-i, 1000-i);
    stroke(#A20013, 70);
    ellipse(400, 400, 1000-i, 250-i);
    ellipse(400, 400, 250-i, 1000-i);
    stroke(26, 27, 77, 70);
    ellipse(400, 400, 1000-i, 100-i);
    ellipse(400, 400, 100-i, 1000-i);

    ellipse(400, 800, 20-i, 600-i);
    ellipse(400, 0, 20-i, 600-i);
    ellipse(0, 400, 600-i, 20-i);
    ellipse(800, 400, 600-i, 20-i);

    ellipse(400, 400, 1000, 1300-i);
    stroke(26, 27, 77, 50);
    ellipse(400, 400, 300, 1300-i);
    ellipse(400, 400, 1300-i, 300);
    
    stroke(#A20013, 80);
    ellipse(40, 40, 800-i, 750-i);
    ellipse(760, 760, 800-i, 750-i);
    stroke(26, 27, 77, 80);
    ellipse(760, 40, 750-i, 800-i);
    ellipse(40, 760, 750-i, 800-i);
    
    stroke(#A20013, 30);
    ellipse(400, 0, 1100-i, 300-i);
    ellipse(400, 800, 1000-i, 300-i);
    ellipse(0, 400, 300-i, 1100-i);
    ellipse(800, 400, 300-i, 1100-i);
    
    stroke(26, 27, 77, 30);
    ellipse(400, 200, 1100-i, 300-i);
    ellipse(400, 600, 1100-i, 300-i);


    i=i+5;
  }
}

