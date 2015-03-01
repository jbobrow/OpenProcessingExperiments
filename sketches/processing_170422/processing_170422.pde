
PImage familie;
PImage portrait;

void setup () {
  size(500, 500);
  familie = loadImage ("LydiaPanas1.jpg");
  portrait = loadImage ("LydiaPanas2.jpg");
}

void draw () {
  // display image (imagename,x,y,width,height)
  // seiten verhältnis: zB: 2500:600 = 4,16… -> 500:4,16… = Wert der bei Image für die unbekannte Seite eingesetzt wird


  image (portrait, -170, 0, 600, 500);

  if (mousePressed) {
    tint (150, 0, 0);
    image (portrait, 0, 0, 600, 500);
  } else {
    noTint ();
    image (familie, 250, 0, 600, 500);
  }
  if (mouseX > 250) {
    fill(255, 111, 0);
    image(familie, 0, 0, 600, 500);
  }
}



