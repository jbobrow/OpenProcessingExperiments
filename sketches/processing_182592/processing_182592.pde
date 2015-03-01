

int suma = 20;
boolean suma2 = false;
Temps cronometre;
void setup(){
  size(800, 400);
  cronometre = new Temps();
}
void draw(){
  background(255);
  cronometre.dibuixaCronometre();
  cronometre.dibuixaComptaEnrere();
  bolas();
  text("No pots parar de pulsar!", 250, 20);
  if (cronometre.fiEnrera()){
    text("Game Over", 40, 20);

    cronometre.reinicia();
  }
  if(suma2 == true){
    suma = suma + 1;
  }
  if(suma == 150 ){
    suma = 0;
  }
  
  
  println("Hora:"+hour()+":"+minute()+":"+second()+ " Millis:" + millis() + "principi:"+cronometre.principi);
}
void mousePressed(){
    cronometre.reiniciaEnrera(11);
    suma2 = true;
  
}
void mouseReleased(){
   
    suma2 = false;
  
}
class Temps{
  int suma = 20;
  int principi;
  int enrera;
  Temps(){
    principi = millis();
    enrera = 10000 + principi;
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
    text("El teu temps es de: " + minuts()+":"+segons(), 600, 20);
    line(0,30,800,30);
  }
  void dibuixaComptaEnrere(){
    fill(0);
    text(minutsEnrera()+":"+segonsEnrera(), 10, 20);
  }
  void reinicia(){
    principi = millis();
    
  }
 

  
}
 void bolas(){
    fill(0);
    ellipse(300,200,suma,suma);
    ellipse(400,200,suma,suma);
    ellipse(500,200,suma,suma);
  }
  


