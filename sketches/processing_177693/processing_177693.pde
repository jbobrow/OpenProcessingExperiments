
PShape blume = null;
PShape blatt = null;

void setup() {

  size(600, 600);
  smooth();
  blume = loadShape("blume.svg");
  blatt = loadShape("blatt.svg");
}

void draw () {
  background (#ffedbc);

  // shape(PShape, x, y);
  // shape(PShape, x, y, breite, höhe);
  shape(blume, width/2, height/2, blume.width*0.5, blume.height*0.5);

  shape(blatt, width/2, height/2, blatt.width*0.4, blatt.height*0.4*(-1));
}



