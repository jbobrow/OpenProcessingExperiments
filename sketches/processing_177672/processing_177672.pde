
PImage wasser_bg;
PImage libelle_cropped;
PImage fisch_cropped;
float counter = 0.0;

void setup()
{
  size(800, 500);
  wasser_bg         =   loadImage("wasser.jpg");
  libelle_cropped   =   loadImage("libelle.png");
  fisch_cropped      =   loadImage("fisch.png");
}

void draw()
{
  image(wasser_bg, 0, 0);
  float schwing = map(sin(counter), -1, 1, -10, 10);

  pushMatrix();                          //LibellenMatrix
  translate(mouseX, mouseY+schwing);
  imageMode(CENTER);
  image(libelle_cropped, 0, 0);
  imageMode(CORNERS);
  popMatrix();                            //LibellenMatrix_ENDE

  /* pushMatrix();                          //FischMatrix
   translate(mouseX, height);
   imageMode(CENTER);
   image(fisch_cropped, 0, 0);
   imageMode(CORNERS);
   popMatrix();                            //FischMatrix_ENDE
   */
   
   counter = (millis()/50.0);
}



