

void setup () {
  size (300, 300);
  smooth();
}

void draw () {
fill(180);
rect(0, 0, width, height);
  //background (250);

  for (int i=0; i < width; i = i + 30) {
    for (int j= 0; j < height; j = j + 30) {

      fill (250);
      ellipse(i, j, 20, 20);
      noFill ();

     // fill (0);
    triangle(random (0,300), random (0,300), random (0,300), random (0,300), mouseX, mouseY);
      noFill ();
    }
  }
}


