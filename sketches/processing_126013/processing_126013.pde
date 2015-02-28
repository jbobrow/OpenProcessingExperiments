
PImage relog,relog2;
int hoy=day();
Temps cronometre;
void setup(){
  size(700, 360);
  relog = loadImage("fondo.png");
  relog2 = loadImage("fondo2.png");
  cronometre = new Temps();
 }
void draw(){
  if (hoy<=20){
      image(relog, 0, 0, width, height);
      cronometre.dibuixaComptaEnrere();
        if (cronometre.fiEnrera()){
        text("Entrega Cerrada", 500, 350);
      }
  }
   if (hoy<=31&&hoy>=21){
        image(relog2, 0, 0, width, height);
      cronometre.dibuixaComptaEnrere();
        if (cronometre.fiEnrera()){
        text("Feliz Año Nuevo", 500, 350);
      }        
  }
}
class Temps{
  int segundos;
  int minutos;
  int horas;
  int dias;
  Temps(){
    if (hoy<=20){
    segundos=60;
    minutos=45;
    horas=23;
    dias=20;}
    if (hoy<=31&&hoy>=21){
    segundos=60;
    minutos=59;
    horas=23;
    dias=31;
  }
  }
  int diesEnrera(){
      int resultat = (int)(dias-day()); 
      if (resultat < 0){
        resultat = 0;
      }
      return resultat;
  }  
  int horesEnrera(){
      int resultat = (int)(horas-hour());
      if (resultat < 0){
        resultat = 0;
      }
      return resultat;
  }  
    int minutsEnrera(){
      int resultat = (int)(minutos-minute());
      if (resultat < 0){
        resultat = 0;
      }
      return resultat;
  }  
  int segonsEnrera(){
    int resultat = (int)(segundos-second()%60);
    if (resultat < 0){
        resultat = 0;
      }
      return resultat; 
   }  
  boolean fiEnrera(){
    return minutsEnrera() == 0 && segonsEnrera() == 0 && horesEnrera() == 0 && diesEnrera() == 0;
  }  
  void dibuixaComptaEnrere(){
    fill(255,0,0);
    textSize(16);
    text(diesEnrera(),254, 303);
    text(horesEnrera(), 311, 303);
    text(minutsEnrera(),368, 303);
    text(segonsEnrera(), 429, 303);
  }  
}


