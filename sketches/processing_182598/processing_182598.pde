
PImage alarma;
Temps cronometre;
void setup(){
  alarma = loadImage("alarma.jpg");
  size(600, 400);
  cronometre = new Temps();
}
void draw(){
 
  background(255);
  image(alarma, 0,0);
  cronometre.dibuixaComptaEnrere();
  
  if (cronometre.fiEnrera()){
    text("DESPERTA!!", 50, 100);
  }
}
 void mousePressed(){
  cronometre.reiniciaEnrera(60);
} 

class Temps{
  int principi;
  int enrera;
  Temps(){
    principi = millis();
    enrera = 10000 + principi;
  }
  
  
void reiniciaEnrera(int segons){
    textSize(15);
    text("DEIXA'M DORMIR UNA ESTONA MES!", 325, 187);
    enrera = millis() + segons * 500;
  }  int segons(){
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
 
  void dibuixaComptaEnrere(){
    fill(0);
     textSize(60);
    text(minutsEnrera()+":"+segonsEnrera(), 361, 70);
  }
  void reinicia(){
    principi = millis();
  }
    
}


