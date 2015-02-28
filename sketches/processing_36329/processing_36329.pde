
void setup () {
  size (300, 300);
}

void draw() {
  if (mouseY<height/2) {
    background (180, 212, 255);  //morning
    fill (255, 255, 0);
    ellipse (width/2, mouseY, 50, 50);
  }
  else {
    background (66, 79, 95);  //night
    fill(255, 100, 0);
    ellipse(width/2, mouseY, 50, 50);
  }
  stroke (5);
  line (width/2, 80, width/2, 220);

  fill (0);  //building
  noStroke ();
  rect (100, 140, 100, 150);
  rect (40, 230, 220, 80);
  fill (0, 150, 0);
  rect (0, 290, width, 10);

  if (mouseY<height/2) {
    fill (100);  //windows
    rect (110, 150, 20, 15);  //5th story
    rect (140, 150, 20, 15);
    rect (170, 150, 20, 15);

    rect (110, 180, 20, 15);  //4th story
    rect (140, 180, 20, 15);
    rect (170, 180, 20, 15);

    rect (110, 210, 20, 15);  //3rd story
    rect (140, 210, 20, 15);
    rect (170, 210, 20, 15);

    rect (50, 240, 20, 15);
    rect (80, 240, 20, 15);
    rect (110, 240, 20, 15);  //2nd story
    rect (140, 240, 20, 15);
    rect (170, 240, 20, 15);
    rect (200, 240, 20, 15);
    rect (230, 240, 20, 15);

    rect (50, 270, 20, 15);  //1st story
    rect (80, 270, 20, 15);
    rect (110, 270, 20, 15);
    rect (140, 270, 20, 15);
    rect (170, 270, 20, 15);
    rect (200, 270, 20, 15);
    rect (230, 270, 20, 15);
  }
  else {
    fill (250);
    rect (110, 150, 20, 15);  //5th story
    rect (140, 150, 20, 15);
    rect (170, 150, 20, 15);

    rect (110, 180, 20, 15);  //4th story
    rect (140, 180, 20, 15);
    rect (170, 180, 20, 15);

    rect (110, 210, 20, 15);  //3rd story
    rect (140, 210, 20, 15);
    rect (170, 210, 20, 15);

    rect (50, 240, 20, 15);
    rect (80, 240, 20, 15);
    rect (110, 240, 20, 15);  //2nd story
    rect (140, 240, 20, 15);
    rect (170, 240, 20, 15);
    rect (200, 240, 20, 15);
    rect (230, 240, 20, 15);

    rect (50, 270, 20, 15);  //1st story
    rect (80, 270, 20, 15);
    rect (110, 270, 20, 15);
    rect (140, 270, 20, 15);
    rect (170, 270, 20, 15);
    rect (200, 270, 20, 15);
    rect (230, 270, 20, 15);
  }
}

