
void setup () {
  //esto se ejecuta una sola vez al principio y sera 
  // entorno general del sketch
  size (400, 400);
  smooth();
    dibujaUnSputnik();
}

void draw () {
  background (0);
  dibujaUnSputnik ();

}
  void dibujaUnSputnik () {
    strokeWeight (3);
    stroke (255, 255, 255);
    line (mouseX-100, mouseY-100, mouseX+100, mouseY+100);

    strokeWeight (3);
    stroke (255, 255, 255);
    line (mouseX+100, mouseY-100, mouseX-100, mouseY+100);

    strokeWeight (3);
    stroke (255, 255, 255);
    fill (255, 0, 0);
    ellipse (mouseX, mouseY, width/4, height/4);

    strokeWeight (3);
    stroke (255, 255, 255);
    fill (255, 0, 0);
    ellipse (mouseX-100, mouseY-100, width/8, height/8);

    strokeWeight (3);
    stroke (255, 255, 255);
    fill (255, 0, 0);
    ellipse (mouseX+100, mouseY-100, width/8, height/8);
  }
