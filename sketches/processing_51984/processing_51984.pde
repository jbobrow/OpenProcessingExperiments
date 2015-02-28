
void setup() {
  size(500, 500);
  smooth();
}


void draw() {
  background(255);

  if (mouseX > width/2 && mouseY > height/2) {
    fill(255, 18, 18);
    rect(width/2, height/2, width/2, height/2);
  }


  else if (mouseX > width/2 && mouseY < height/2) {
    fill(26, 26, 26);
    rect(width/2, 0, width/2, height/2);
  }
  else if (mouseX < width/2 && mouseY < height/2) {
    fill(255, 18, 18);
    rect(0, 0, width/2, height/2);
  }

  else if (mouseX < width/2 && mouseY > height/2) {
    fill(26, 26, 26);
    rect(0, height/2, width/2, height/2);
  }


fill(255, 192, 203);
rect(200, 125, 125, 215);
ellipse(180, 220, 40, 50);
ellipse(345, 220, 40, 50);
ellipse(320, 350, 100, 50);
ellipse(220, 350, 100, 50);

fill(0);
smooth();

triangle(220, 125, 250, 70, 300, 110);
ellipse(220, 120, 30, 30);
triangle(140, 140, 175, 190, 235, 120);


fill(255);
smooth();
ellipse (250, 145, 30, 40);
ellipse (275, 145, 30, 40);

fill(0);
smooth();
ellipse(250, 145, 20, 20);
ellipse(270, 145, 20, 20);

fill(255, 0, 0);
rect(222, 200, 80, 50);

fill(255);
//x1, y1, x2, y2, x3, y3

triangle(245, 200, 222, 200, 235, 225);
triangle(275, 200, 242, 200, 255, 225);
triangle(285, 200, 262, 200, 275, 225);
triangle(300, 200, 282, 200, 290, 225);

}

