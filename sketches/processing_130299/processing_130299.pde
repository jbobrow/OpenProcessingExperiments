
Input entrada;
boolean solucio=false;

void setup(){
  size(400,400);
  entrada= new Input();
}

void draw(){
  background(250,50,50);
  entrada.dibuixa();
  //Enunciat
  fill(0);
  textSize(25);
  text ("PETIT JOC DE MATEMATIQUES",15,110);
  textSize(18);
  text ("Esbrina quan val la X:",20,160);
  textSize(20);
  text ("4x-6=6+x",80,230);
 if (keyCode == ENTER && entrada.texte == 4) {
  text("CORRECTE!",150,300);
  }else if(solucio==true){
    text("INCORRECTE!",150,300);
  }

 
}
void keyReleased() {
  if (keyCode == ENTER || keyCode == RETURN) {
   solucio=true;
  }
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


