
int posX = 100; 
int posY = 200; 
int posZ = 550; 
int posA = 500; 
int posR = 580; 
int posS = 900; 
int posO = 20; 
int posP = 700; 
boolean fi = false;
String missatge = ""; 
String missatg = ""; 
String missat = ""; 
String miss = "";

Temps cronometre;
void setup(){
  size(1000,600);
  cronometre = new Temps();
}

void draw(){
  background(255); 
   fill(15, 131, 111);
   textSize(20);
   text(" CUANTOS 1 HAY ? ", 350, 50, 500);  
   fill(15, 131, 111);
   textSize(20);
   text(" a = 4 ", 350, 100, 500);  
   fill(15, 131, 111);
   textSize(20);
   text(" b = 5 ", 350, 130, 500);  
   fill(15, 131, 111);
   textSize(20);
   text(" c = 6 ", 350, 160, 500);   
   cronometre.dibuixaComptaEnrere(); 
  
  if (mouseX < 100 && mouseY < 200){ 
    textSize(30);
    text("1",100 ,400);
  } 
   if (mouseX > 500 && mouseY < 550){ 
    textSize(30);
    text("1",400 ,400);
  } 
  if (mouseX < 580 && mouseY < 900){ 
    textSize(30);
    text("1", 500 ,100);  
  }  
   if (mouseX < 100 && mouseY < 200){ 
    textSize(30);
    text("1", 700 ,500);  
  } 
  if (mouseX < 700 && mouseY < 20){ 
    textSize(30);
    text("1", 850 ,40);  
  } 
  textSize(60);
  text(missatge,350 ,300);
  textSize(80);
  text(missatg,300 ,300); 
  textSize(60);
  text(missat,350 ,300); 
  textSize(60);
  text(miss,350 ,300);
  
 if (fi == false){
  if (cronometre.fiEnrera()){ 
    missatge = "GAME OVER";  
     fi = true;
  } 
}
  println("Hora:"+hour()+":"+minute()+":"+second()+ " Millis:" + millis() + "principi:"+cronometre.principi);
}

void mousePressed(){
  cronometre.reinicia();

} 
void keyPressed(){
  if (fi == false){ 
   if (key == 'a'){
      missatge = "GAME OVER";  
      fi = true;
    } 
    if (key == 'b'){
      missatge = "YOU WIN !!!!";  
      fi = true;
    } 
    if (key == 'c'){
      missatge = "GAME OVER";  
      fi = true;
    }  
  }
}

class Temps{
  int principi;
  int enrera;
  Temps(){
    principi = millis();
    enrera = 25000 + principi;
  }
  
  
  int minutsEnrera(){
      int resultat = (int)((enrera-millis())/ 25000); 
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
    text(minutsEnrera()+":"+segonsEnrera(), 10, 20);
  } 
  
  void reinicia(){
    principi = millis();
  }

  
}


