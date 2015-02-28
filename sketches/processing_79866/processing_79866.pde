
PFont font; // déclaration de "font"
String[] fontList = PFont.list(); // déclaration de la liste "fontList"
int i=0; // déclaration de i nombre entier

void setup(){
  
  // initialisation
  size(600,400); // taille de l'écran
  
  println(fontList.length);
  
  frameRate(10);
    
}
void draw(){
  
  // boucle de dessin
  
  i++; // incrémentation de i, de 1
  if(i==fontList.length){// nombre d'éléments dans la liste
    i=0; // limite à i à 255
  }
  background(0); // nuance de gris sur l'arrière plan
  fill(255); // remplissage à l'inverse
  String nomDeLaPolice = fontList[i]; //
  font = createFont(nomDeLaPolice, 32);
  textFont(font);  
  text(nomDeLaPolice,0,46);
}


