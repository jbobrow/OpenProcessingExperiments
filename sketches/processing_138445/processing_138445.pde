


String [] lineas;
PFont miFuente;
void setup(){
  size (1080,980);
  background (204,214,232);
  miFuente = loadFont ("0.vlw");
  textFont (miFuente);
  lineas = loadStrings ("Texto.txt");
    }

void draw (){
  fill (random (100), random (90), random (100));
  for (int i = 0; i<lineas.length; i++)
  {
    text (lineas [i], random (150), random (i*150), random (width), random  (height));
  }
}


