
/* @pjs preload="microondas.jpg"; 
 */

PImage microondas;
Temps cronometre;
void setup(){
  size(485, 289);
  microondas= loadImage("microondas.jpg");
  cronometre = new Temps();
}
void draw(){
  background(microondas);
  cronometre.dibuixaComptaEnrere();
  
  if(cronometre.fiEnrera()){
    PFont letra = createFont("Agency FB",18);
    textFont(letra);
    text("Ja pots treure el menjar!",80,70);
  } 
  
}
void mousePressed(){
  //Poso la funció de que al clicar es posi a 10 segons, per tal de no esperar tant
  cronometre.reiniciaEnrera(10);
}

class Temps{
  int principi;
  int enrera;
  Temps(){
    principi = millis();
    enrera = 60000 + principi;
  }
  
  void reiniciaEnrera(int segons){
    enrera = millis() + segons * 1000;
  }
  int segons(){
    return (int)((millis() - principi)/ 1000)%60;
  }
  int minuts(){
    return (int)((millis() - principi)/ 60000);
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
  boolean limitCrono(int seg){
      return minuts()*60 + segons() == seg;
  }
  
  void dibuixaCronometre(){
    fill(0);
    text(minuts()+":"+segons(), 10, 40);
  }
  void dibuixaComptaEnrere(){
    fill(#FF0000);
    text(minutsEnrera()+":"+segonsEnrera(), 335, 130);
  }
  void reinicia(){
    principi = millis();
  }

  
}


