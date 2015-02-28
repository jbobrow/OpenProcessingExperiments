
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/65731*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
import sojamo.drop.*;

SDrop drop;
// 4 images à charger, donc 4 objets PImage :
PImage HautGauche ;
PImage HautDroit ;
PImage BasGauche ;
PImage BasDroit ;
PImage Source;
String myurl;

void setup() {
size(800,600);
noCursor();
drop = new SDrop(this);
// Chargement des 4 fichiers jpeg à l'intérieur des objets image :
Source = loadImage("1.jpg");
HautGauche = createImage(400,300,RGB);
HautDroit = createImage(400,300,RGB);
BasGauche = createImage(400,300,RGB);
BasDroit = createImage(400,300,RGB);
divideImage(Source);
}

void draw() {
background(0);
// Afficher les 4 images :
image (HautGauche, 0, 0, mouseX, mouseY) ;
image (HautDroit, mouseX, 0, width - mouseX, mouseY) ;
image (BasGauche, 0, mouseY, mouseX, height - mouseY) ;
image (BasDroit, mouseX, mouseY, width - mouseX, height - mouseY) ;
}
void dropEvent(DropEvent theDropEvent) {
if(theDropEvent.isImage()){
  if(theDropEvent.isFile()){
    Source = loadImage(theDropEvent.file().getPath());
  }else{
  Source = loadImage(theDropEvent.url());
  }
  Source.resize(width,height);
  divideImage(Source);
}
}
void divideImage(PImage img){
  HautGauche.copy(img, 0, 0, 400, 300, 0, 0, 400,300);
  HautDroit.copy(img, 400, 0, 400, 300, 0, 0, 400,300);
  BasGauche.copy(img, 0, 300, 400, 300, 0, 0, 400,300);
  BasDroit.copy(img, 400, 300, 400, 300, 0, 0, 400,300);
}

