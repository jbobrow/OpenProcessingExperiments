
Temps cronometre;
void setup(){
  size(500, 400);
  cronometre = new Temps();
}
void draw(){
  println (mouseX + "," + mouseY);
  background(#CCFFFF);
  //Pisarra
  fill(#006600);
  stroke(#006600);
  rect(145, 20, 210, 60);
  //taules
  fill(#994C00);
  stroke(0);
  //taules esquerra
  rect(40, 127, 190, 30);
  rect(40, 250, 190, 30);
  //exams esquerra
  fill(255);
  rect(64, 135, 10, 15);
  rect(129, 135, 10, 15);
  rect(191, 135, 10, 15);
  rect(64, 259, 10, 15);
  rect(130, 259, 10, 15);
  rect(192, 259, 10, 15);
   
  //taules dreta
  fill(#994C00);
  rect(264, 127, 190, 30);
  rect(264, 250, 190, 30);
  //exams dreta
  fill(255);
  rect(290, 135, 10, 15);
  rect(351, 135, 10, 15);
  rect(411, 135, 10, 15);
  rect(290, 259, 10, 15);
  rect(351, 259, 10, 15);
  rect(411, 259, 10, 15);  
  //alumnes 
  fill(#FFCC99);
  stroke(0);
  //alumnes esquerra
  ellipse(70, 165, 15, 15);
  ellipse(136, 165, 15, 15);
  ellipse(197, 165, 15, 15);
  ellipse(70, 289, 15, 15);
  ellipse(136, 289, 15, 15);
  ellipse(197, 289, 15, 15);
  //alumnes dreta
  ellipse(295, 165, 15, 15);
  ellipse(360, 165, 15, 15);
  ellipse(418, 165, 15, 15);
  ellipse(295, 288, 15, 15);
  ellipse(360, 288, 15, 15);
  ellipse(418, 288, 15, 15);

  cronometre.dibuixaComptaEnrere();
  
   if (cronometre.fiEnrera()){
    text("L'exàmen ha finalitzat", 170, 64);
    fill(#994C00);
    stroke(#994C00);
    rect(64, 135, 10, 15);
    rect(129, 135, 10, 15);
    rect(191, 135, 10, 15);
    rect(64, 259, 10, 15);
    rect(130, 259, 10, 15);
    rect(192, 259, 10, 15);
    rect(290, 135, 10, 15);
    rect(351, 135, 10, 15);
    rect(411, 135, 10, 15);  
    rect(290, 259, 10, 15);
    rect(351, 259, 10, 15);
    rect(411, 259, 10, 15); 
  }

}

void mousePressed(){
  cronometre.reinicia();
  //Resten ultims 10 segons
  cronometre.reiniciaEnrera(10);
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
    fill(255);
    font = createFont("Comic Sans", 17);
    textFont(font);
    text(minutsEnrera()+":"+segonsEnrera(), 240, 44);
  }

  void reinicia(){
    principi = millis();
  }

  
}


