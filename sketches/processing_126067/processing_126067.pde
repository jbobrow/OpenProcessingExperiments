

Temps cronometre;
Follow[] us = new Follow[100];
int size = 0;
void setup(){
  size(420, 200);
  cronometre = new Temps();
  for (int i = 0;i < us.length;i++){
    us[i] = new Follow(random(width), random(height), random (5,20), color(random(55,180)));
  }
  }
void draw(){
  background(#D89337);
  for (int i = 0;i < us.length && i < size;i++){
    us[i].dibuixa();
    us[i].moure();
  }
   
  if(cronometre.fiEnrera()){
    fill(255,0,0);
    textSize(16);
    text("Dejadme en paz!!", 175,150);
  }
  cronometre.dibuixaComptaEnrere();
}
void mousePressed(){
  size = size + 1;
}

class Temps{
  int principi;
  int enrera;
   
  Temps(){
    principi = millis();
    enrera = 12000 + principi;
  }
   
  void reiniciaEnrera (int segons){
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
   

  void dibuixaComptaEnrere(){
    fill(0);
    text(minutsEnrera()+":"+segonsEnrera(), 60, 104);
 
  }
  void reinicia(){
    principi = millis();
  }
 

}

class Follow{
  float xPos;
  float yPos;
  float radi;
  color c;
  
  Follow(){
  xPos = width/2;
  yPos = height/2;
  radi = 20;
  c = color(0,0,255);
  }
  
  Follow(float x, float y, float r, color col){ 
    xPos = x;
    yPos = y;
    radi = r;
    c = col;
  }
  void dibuixa(){
    fill(c); 
    ellipse(xPos, yPos, radi, radi);
  }
  void moure(){
    xPos =  xPos + (mouseX-xPos)/radi;
    yPos =  yPos + (mouseY-yPos)/radi;
  }
}



