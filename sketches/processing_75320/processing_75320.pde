
void setup () {
  size (255, 255);
  smooth ();
}

void draw () {

background (255);
rectMode (CENTER);

stroke (0);
fill (mouseX, mouseY, 0);
rect (mouseX, mouseY, pmouseX, pmouseY);
}




