
//Sergi Giménez
//1r A.S.I.X.

/* @pjs preload="1.jpg, 2.jpg"; 
 */

Temps cronometre;
PImage campanades;
PImage bon_2014;

void setup(){
  size(400, 400);
  campanades = loadImage("1.jpg");
  bon_2014 = loadImage("2.jpg");
  cronometre = new Temps();

  }

void draw(){
  
  //Fons de pantalla inicial 
  background(campanades);
   
   //Text
   fill(255);
   text("Comença el compte enrere", 5, 25);
   text("per a iniciar l'any 2014!!", 5, 55);
   
   //Rellotge
   noStroke();
   fill(255);
   ellipse(200,220,80,80);
   
   cronometre.dibuixaComptaEnrere();
}  
  
void mousePressed(){
  cronometre.reiniciaEnrera(13);
}

class Temps{
  int principi;
  int enrera;
  PFont font;
  
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
 
  void dibuixaComptaEnrere(){
    
    //Temps
    fill(0);
    font = createFont("Cooper Black", 30);
    textFont(font);
    text(minutsEnrera()+":"+segonsEnrera(), 170, 230);
    
    //Canvi de pantalla a l'acabar el compte enrere
    if(minutsEnrera() == 0 && segonsEnrera() == 0){
      
    //Fons de pantalla 2
    background(bon_2014);
    
    //Text
    fill(255);  
    text("Bon any nou a tots!!", 63, 210);
    }
  }   
}


