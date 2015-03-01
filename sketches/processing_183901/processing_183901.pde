
Temps cronometre;
Input entrada;

void setup(){
  size(600,500);
  entrada = new Input();
  cronometre = new Temps();
}
 
void draw(){
  background(#00CCCC);
  entrada.dibuixa();
  cronometre.dibuixaCronometre();
   
   if(entrada.texte.length() == entrada.limit){
        fill(255);
        text("Seeeh!!", 300,300);
        limitCrono = segons;
      }
}

/*He posat la funcio d'esborrar al keyPressed per borrar més ágilment i escriure la mateixa lletra sense clicar 1000 cops */
void keyPressed(){
   
  if(key == 'm'){
    cronometre.reinicia();
  }
  if (keyCode == BACKSPACE || keyCode == DELETE){
      entrada.borrar();
  }
else if (key != CODED){
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
  String texte2;
   
  
  Input(){   
    texte = "";
    xPos = 50;
    yPos = 100;
    limit = 5;
    fonBoto = createFont("Comic Sans", 12);
    textFont(fonBoto);
    texte2 = "";
    
  }
   
   
  Input (String r, float x, float y, int l, String t){
    texte = r;
    xPos = x;
    yPos = y;
    limit = l;
    fonBoto = createFont("Comic Sans", 12);
    textFont(fonBoto);
    texte2 = t;
 
  }
   
  void dibuixa(){
    fill(255);
    ellipse(330, 223, 90,40);
    noStroke (0);
    fill(#1B3EBA);
    strokeWeight(95);
    textSize(20);
    text (texte+(frameCount/10 % 2== 0 ? "_" : ""), 300, 230);
    fill(#CC0066);
    textSize(20);
    text(texte2+("Quin grup de musica t'agrada?"), 150,157);
      
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
  Temps(){
    principi = millis();
  }
  int segons(){
    return (int)((millis() - principi)/1000)%60;
  }
  void dibuixaCronometre(){
    fill(255);
    text(segons(), 300, 60);
  }
  void reinicia(){
    principi = millis();
  }
   boolean limitCrono(int seg){
      return minuts()*60 + segons() == seg;
  }
}



