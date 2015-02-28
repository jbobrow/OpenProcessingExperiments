


void setup() {
  size(1000, 1000);
  smooth();
}


void draw() {
  background(164, 206, 250);
 noFill();

  int i = 1;
  while (i < 400) {
    ellipse(500,500, 500-i,500-i);
    ellipse(400,500, 500-i,500-i);
    ellipse(500,400, 500-i,500-i);
    ellipse(400,400, 500-i,500-i);
    ellipse(300,300, 500-i,500-i);
    ellipse(400,300, 500-i,500-i);
    ellipse(300,400, 500-i,500-i);
    ellipse(600,600, 500-i,500-i);
    ellipse(600,500, 500-i,500-i);
    ellipse(500,600, 500-i,500-i);
    ellipse(600,400, 500-i,500-i);
    ellipse(400,600, 500-i,500-i);
    ellipse(700,300, 500-i,500-i);
    ellipse(700,700, 500-i,500-i);
    ellipse(300,700, 500-i,500-i);

    i = i + 10; // or i++
  }
}



