
int i = 111;
boolean fi = false;
String missatge = ""; 
Temps cronometre;
Input entrada;
void setup(){
  size(400,400);
  entrada = new Input();
  cronometre = new Temps();
}

void draw(){
  background(entrada.aEnter());
  entrada.dibuixa(); 
  cronometre.dibuixaComptaEnrere(); 
  
  
  fill(0,255,0); 
  rect(70,100,60,70); 
  fill(255,255,0);
  rect(170,100,60,70); 
  fill(255,0,0);
  rect(270,100,60,70); 
  
  fill(255,0,0);
  textSize(60);
  text(missatge,50 ,300);
  
   if (cronometre.fiEnrera()){ 
    textSize(60);
    text("GAME OVER",15 ,300);
  } 
  println("Hora:"+hour()+":"+minute()+":"+second()+ " Millis:" + millis() + "principi:"+cronometre.principi);
  
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
  
void keyPressed(){
  if (fi == false){ 
   if (entrada.aEnter()  == i){
      missatge = "GOOD!!!";  
      fi = true;
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
    

  }
  
  Input (String r, float x, float y, int l){
    texte = r; 
    xPos = x;
    yPos = y;
    limit = l;
    
  }
  
  void dibuixa(){
    
    fill(255);
    rect (150, 200, 100, 40);
    fill(#030000);
    text (texte+(frameCount/10 % 2== 0 ? "_" : ""), xPos + (-10), yPos + 23);
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
class Temps{
  int principi;
  int enrera;
  Temps(){
    principi = millis();
    enrera = 60000 + principi;
  }
  
  
  int minutsEnrera(){
      int resultat = (int)((enrera-millis())/ 60000); 
      if (resultat < 0){
        resultat = 0;
      }
      return resultat;
  }
  
  int segonsEnrera(){
    int resultat = (int)((enrera-millis())/ 1000)%60;
    if (resultat < 0){
        resultat = 0;
      }
      return resultat; 
   }
  
  boolean fiEnrera(){
    return minutsEnrera() == 0 && segonsEnrera() == 0;
  }

  void dibuixaComptaEnrere(){
    fill(255);
    text(minutsEnrera()+":"+segonsEnrera(), 10, 20);
  } 
  
  void reinicia(){
    principi = millis();
  }

  
}


