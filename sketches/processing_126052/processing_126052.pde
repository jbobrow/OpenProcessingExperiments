
/* @pjs preload="creepy.jpg, mira.png"; 
 */
//Adan bachir 1r asix
Temps cronometre;
PImage intro1;
PImage creepy1;

void setup(){
  size(400, 400);
  intro1 = loadImage("mira.png");
  creepy1= loadImage("creepy.jpg");
  cronometre = new Temps();

  }

void draw(){
  size(350,350);
  
  background(intro1);
   
   textSize(20);
   fill(255,5,5);
   
   text("Fijate en el centro", 74, 300);
  ellipse(175,175,5,5);
   
   cronometre.dibuixaComptaEnrere();
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
    textSize(30);
    fill(255,5,5);
    
     text(minutsEnrera()+":"+segonsEnrera(), 145, 330);
    
     if(minutsEnrera() == 0 && segonsEnrera() == 0){
     
     background(creepy1); 
     
    }
     
  }   
}



