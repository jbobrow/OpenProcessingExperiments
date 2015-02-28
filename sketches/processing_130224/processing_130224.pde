
Input entrada;
String res = "255";
boolean correcte = false;
void setup(){
  size(400,400);
  entrada = new Input();
  }

void draw(){
  background(entrada.aEnter());
  entrada.dibuixa();  

  textSize(15);
  text("De quin color es el caball blanc de santiago?? ",10,25);
  textSize(15);
  text("(Escriu el color de la resposta)",10,45);
  println(correcte);
  println(res);
  if (keyCode == ENTER && entrada.texte == "255") {
  text("CORRECTE!",200,170);
  }
}



void keyReleased() {
  /*if (keyCode == ENTER || keyCode == RETURN) {
    if(Input.texte == res){
    correcte = true;
    }
    if(correcte = true){
    text("CORRECTE!",60,20);
  }
    }*/
  
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
    xPos = width/2;
    yPos = height/2;
    limit = 3;
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
    rect (xPos, yPos, 0, 0);
    fill(#030000);
    text (texte+(frameCount/10 % 2== 0 ? "_" : ""), xPos + 120, yPos + 190);
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


