
/* @pjs preload="Inici.jpg, Contactes.jpg, Google.jpg, Missatges.jpg, Telefon.jpg, Menu_Principal.jpg"; 
 */

Input entrada;
PImage Inici;
PImage Telefon;
PImage Contactes;
PImage Missatges;
PImage Google;
PImage Menu_Principal;


void setup(){
  size(360,640);
  Inici = loadImage("Inici.jpg");
  Telefon = loadImage("Telefon.jpg");
  Contactes = loadImage("Contactes.jpg");
  Missatges = loadImage("Missatges.jpg");
  Google = loadImage("Google.jpg");
  Menu_Principal = loadImage("Menu_Principal.jpg");
  entrada = new Input();
}

void draw(){
  background(Inici); //Pantalla inicial (Amb les quatre opcions)
  
  if (key == 't' | key == 'T') {
    background(Telefon); //Primera opció: Telèfon
  }
  
  else if (key == 'c' | key == 'C') {
    background(Contactes); //Segona opció: Contactes
  }
  
  else if (key == 'm' | key == 'M') {
    background(Missatges); //Tercera opció: Missatges
  }
  
  else if (key == 'g' | key == 'G') {
    background(Google); //Quarta opció: Google Chrome 
  }
  
  else if (key == 'p' | key == 'P') {
    background(Menu_Principal); //Cinquena opció: Menú principal
  }

  else {
    background(Inici); //Opció de tornar a la pàgina principal, seleccionant qualsevol tecla excepte les que hem assignat anteriorment, lògicament
  }  
}
class Input {
  String texte;
  float xPos;
  float yPos;
  int limit;
  PFont fonBoto;
 
  Input (){
    texte = "";
    xPos = width/2;
    yPos = height/2;
    limit = 1; //El límit serà 1 dígit (ja sigui lletra o número)
    fonBoto = createFont("Georgia", 12);
    textFont(fonBoto);

  }
  
  Input (String r, float x, float y, int l){
    texte = r; 
    xPos = x;
    yPos = y;
    limit = l;
    fonBoto = createFont("Georgia", 12);
    textFont(fonBoto);
  }
  
  void dibuixa(){
    stroke (0);
    fill(255);
    rect (xPos, yPos, 100, 40);
    fill(#030000);
    text (texte+(frameCount/10 % 2== 0 ? "_" : ""), xPos + 10, yPos + 20);
  }
  void borrar(){ 
      texte = texte.substring(0,max(0,texte.length()-1));
  }
  
  void afegeix(char key){
    texte = texte.concat (new String(key));
  }
  
  int aEnter(){
    return parseInt(texte);
  }
}


