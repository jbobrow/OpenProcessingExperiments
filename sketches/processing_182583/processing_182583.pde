
PImage fons, victoria, derrota;
int posResultatX = 920;
int posResultatY = 222;
int memoria1 = 0;
int memoria2 = 0;
int resta = 0;
int r1s = 0;
int r2s = 0;
int r3s = 0;
int r1m = 0;
int r2m = 0;
int principi;
int click = 0;
int calc = (r2m-r1m);
int calcs = (r2s-r1s);
Temps cronometre;

void setup(){
size(1366, 768);
//img
  fons = loadImage("fons1.png"); 
  victoria = loadImage("victoria.png");
  derrota = loadImage("derrota.png");
  cronometre = new Temps();
}


void draw(){
  
  image(fons, 0, 0);
  textSize(12);
  fill(255);
  text(hour()+":"+minute(), 1295, 747);
  text(day()+"/"+month()+"/"+year(), 1280, 762);
  
  cronometre.dibuixaCronometre();
    textSize(65);
    fill(0);
  if(memoria1 >= 1){
    //fijando
   int posResultatYdef1 = posResultatY;
       posResultatYdef1 = (posResultatYdef1 - resta);
    text("1-> "+r1m+":"+r1s, posResultatX, posResultatYdef1);
  }
  if(memoria2 >= 2){
    //fijando
    int posResultatYdef2 = posResultatY;
       posResultatYdef2 = (posResultatYdef2 - resta)+80; //el 10 es la diferencia de altura entre la de arriba y la de abajo
  text("2-> "+(r2m-r1m)+":"+(r2s-r1s), posResultatX, posResultatYdef2);
  }
//fin del juego

  if (click >= 3){
    if(calcs == r1s && calc == r1m){
      image(victoria, 0, 0);
    }else{
      image(derrota, 375, 130);
    }
  
  }

}
void mousePressed(){
  cronometre.reinicia();
  cronometre.reiniciaEnrera(60);
  memoria1 = memoria1 +1;
  memoria2 = memoria2 +1;
  posResultatY = posResultatY + 10;
  resta = resta + 10;
  click = click +1;
}  
void mouseReleased(){ 
  if (memoria1 == 1){
     r1m = millis()/ 60000;
     r1s = (millis()/10)%6000;
   }
   if (memoria2 == 2){
     r2m = millis()/ 60000;
     r2s = (millis()/10)%6000;
   }
}
class Temps{
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
    return (int)((millis() - principi)/ 10)%6000;
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
    //color y tamaño
    textSize(85);
    fill(0, 102, 153);
    text(minuts()+":"+segons(), 564, 501);
  }
  
  void reinicia(){
    principi = millis();
  }

  
}



