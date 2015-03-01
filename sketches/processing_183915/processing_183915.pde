
PImage barsa;

Input entrada;
void setup(){
  size(700,600);
  barsa = loadImage("barsa.png");
  entrada = new Input();
}

void draw(){
  println(mouseX, mouseY);
  background(255);
  entrada.dibuixa();
  
  
  if (entrada.texte.length() == entrada.limit){
   fill(0);
   image(barsa, 110, 400);
   text("CORRECTE!", 300, 300);
  }
}

void keyReleased() {
  // y para cada pantalla
  if (keyCode == BACKSPACE || keyCode == DELETE){
    entrada.borrar();
  } else if (key != CODED){
    if(entrada.texte.length() < entrada.limit){
        entrada.afegeix(key);
      }
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
    xPos = 100;
    yPos = 50;
    limit = 5;
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
    fill(34,139,34);
    rect (xPos, yPos, 500, 200);
    fill(#030000);
    text (texte+(frameCount/10 % 2== 0 ? "_" : ""), xPos + 10, yPos + 20);
    textSize(30);
    text("Quin és el millor equip del mon?", 116, 350);
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


