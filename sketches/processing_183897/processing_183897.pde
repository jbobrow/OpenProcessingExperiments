
PImage foto1;

Input entrada;
void setup(){
  size(300,550);
  foto1 = loadImage("foto1.jpg");
  
  entrada = new Input();
}

void draw(){
  image(foto1, 0, 0);
  entrada.dibuixa();
  println(mouseX + " : " + pmouseY);
}


void keyReleased() {
  if (keyCode == ENTER || keyCode == RETURN) {
    text("OK", 20,20);
  }
  // y para cada pantalla
  if (keyCode == BACKSPACE || keyCode == DELETE){
    entrada.borrar();
  } else if (key != CODED){
    if(entrada.texte.length() < entrada.limit){
        entrada.afegeix(key);
      }
  }
}

/*
!!!! CODI PER SUBCLASSE QUE NOMÉS LLEGEIXI NOMBRES
!!!! FER BOTO PER BORRAR
  if ( key == '0' ||key == '1' || key == '2' ||key == '3' ||key == '4' ||key == '5' ||key == '6' ||key == '7' ||key == '8' ||key == '9' || key == '-') {
      if(resultat.length()<8){
        resultat = resultat.concat (new String(key));
      }
  }
  
}
void mostrarnombre(){
  fill(#030000);
  textFont(font,60);
  text(typedText+(frameCount/10 % 2== 0 ? "_" : ""), 190, 200); 
}
*/

class Input {
  String texte;
  float xPos = 63;
  float yPos = 269;
  int limit;
  PFont fonBoto;
 
  Input (){
    texte = "";
    xPos = width/2;
    yPos = height/2;
    limit = 8;
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
    noStroke (0);
    fill(255);
    rect (63, 271, 100, 15);
    fill(#030000);
    text (texte+(frameCount/10 % 2== 0 ? "_" : ""),63 + 10, 263 + 20);
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


