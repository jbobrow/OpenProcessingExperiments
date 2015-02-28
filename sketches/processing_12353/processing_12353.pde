
void setup () {
  size (600, 500);
  background (0);
}

void draw () {
  stroke (0);
  fill (150);
  ellipseMode (CENTER);
  ellipse (mouseX, mouseY, 2, 2);
}

//When mouse is clicked it creates the firework explosion!!
void mousePressed () {
  stroke (0);
    fill (255);
  ellipseMode (CENTER);
  ellipse (mouseX+20, mouseY+20, 20, 20);
    fill (255);
  ellipseMode (CENTER);
  ellipse (mouseX-20, mouseY-20, 20, 20);
    fill (255);
  ellipseMode (CENTER);
  ellipse (mouseX+40, mouseY+40, 10, 10);
     fill (255);
  ellipseMode (CENTER);
  ellipse (mouseX-40, mouseY-40, 10, 10);
     fill (255);
  ellipseMode (CENTER);
  ellipse (mouseX+60, mouseY+60, 5, 5);
     fill (255);
  ellipseMode (CENTER);
  ellipse (mouseX-60, mouseY-60, 5, 5);
     fill (255);
  ellipseMode (CENTER);
  ellipse (mouseX+60, mouseY-60, 5, 5);
     fill (255);
  ellipseMode (CENTER);
  ellipse (mouseX-60, mouseY+60, 5, 5);
     fill (255);
  ellipseMode (CENTER);
  ellipse (mouseX+40, mouseY-40, 10, 10);
     fill (255);
  ellipseMode (CENTER);
  ellipse (mouseX-40, mouseY+40, 10, 10);
     fill (255);
  ellipseMode (CENTER);
  ellipse (mouseX+20, mouseY-20, 20, 20);
     fill (255);
  ellipseMode (CENTER);
  ellipse (mouseX-20, mouseY+20, 20, 20);
}


