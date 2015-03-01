
float mida = 50;

void setup () {

  size (255, 255);
  stroke (255);
  
}

void draw () {

  background (0);
   
   noFill ();
  strokeWeight (3);

  ellipse (mouseX, mouseY, mouseY-mida, mouseY+mida);
  ellipse (mouseX, mouseY, mouseY+mida, mouseY-mida);

  line (mouseX+mida, mouseY+mida, mouseX-mida, mouseY-mida);
  line (mouseX+mida, mouseY-mida, mouseX-mida, mouseY+mida);

  fill (mouseX, 100, mouseX);
  strokeWeight (5);

  ellipse (mouseX, mouseY, mouseY/2, mouseY/2);
  ellipse (mouseX+mida, mouseY+mida, mouseY/4, mouseY/4);
  ellipse (mouseX-mida, mouseY-mida, mouseY/4, mouseY/4);
  ellipse (mouseX+mida, mouseY-mida, mouseY/4, mouseY/4);
  ellipse (mouseX-mida, mouseY+mida, mouseY/4, mouseY/4);

 
}

