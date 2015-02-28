
PImage bild;


void setup () {
  size (480, 478);
  
  bild = loadImage("Eichh_rnchen.jpg");
}

void draw () {
  //image( bildvariable, x , y );
  image(bild, 0, 0);
  
}
