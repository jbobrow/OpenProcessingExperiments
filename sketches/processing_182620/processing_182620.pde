
Temps cronometre;
int puntuacio = 0;
int r = 0;
boolean boton = false;
void setup(){
  size(400, 400);
  cronometre = new Temps();
}
void draw(){
  textSize (20);
  background(232,189,63);
  fill(r,130,0);
  text ("Clicks: " + puntuacio, 265, 50);
  rectMode(CORNERS);
  rect(width/4,height/4,width/4+width/2,height/4+height/2);
  if (mousePressed == true){
    r = 150;
    
  }
 
  cronometre.dibuixaComptaEnrere();
  
  if (cronometre.fiEnrera()){
    fill(43,135,158);
    text("Temps!!!", 120, 70);
    text("La teva mitjana ha sigut de "+ (puntuacio/12), 5, 340);
    text( "clics/seg i has clicat  " + puntuacio + " vegades!",50, 370);
   
  }
  
  
  println("Hora:"+hour()+":"+minute()+":"+second()+ " Millis:" + millis() + "principi:"+cronometre.principi);
}

void mousePressed(){
   if (mouseX>=width/4 && mouseX<=width/4+width/2 && mouseY>=height/4 && mouseX<=height/4+height/2){
   boton = true;
   puntuacio++;
  }
 
 
}

void mouseReleased(){
  r = 255;
}
class Temps{
  int principi;
  int enrera;
  Temps(){
    principi = millis();
    enrera = 12000 + principi;
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
    fill(0);
    text(minutsEnrera()+":"+segonsEnrera(), 30, 50);
  }

  
}


