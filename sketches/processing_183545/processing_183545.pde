
Temps cronometre;
int x = 10;
int y = 10;
PImage gatdreta, gatesq, gatamunt, gatavall, raspa, casc, food, gatinici, gatfi, terra;
int opac = 255;
int opac2;
int opac3;
int opac4;
int suma = 0;
int resta = 0;
boolean go = true;
boolean clic = false;
boolean restart = false;
boolean inici = true;
boolean clicI = false;
boolean crono = false;
int opacfi = 0;
int opacinici = 255;
boolean pulsa = false;
boolean pulsd = false;
boolean pulsw = false;
boolean pulss = false;


Raspa[] raspes = new Raspa[3];
Casc[] cascs = new Casc[14];
Food[] foods = new Food[3];



void setup() {
  
  size(800, 600);
  
   gatdreta = loadImage("gatdreta.png");
   gatesq = loadImage("gatesq.png");
   gatamunt = loadImage("gatamunt.png");
   gatavall = loadImage("gatavall.png");
   raspa = loadImage("raspa.png");
   casc = loadImage("casc.png");
   food = loadImage("food.png");
   gatinici = loadImage("gatinici.png");
   gatfi = loadImage("gatfi.png");
   terra = loadImage("terra.png");
  
  cronometre = new Temps();

          for (int i = 0; i < raspes.length; i++) {
              
                raspes[i] = new Raspa(random(10, width-58), random(70, height-150), 255);
          }
          for (int i = 0; i < cascs.length; i++) {
              
                cascs[i] = new Casc(random(10, width-18), random(70, height-150), 255);
          }
          for (int i = 0; i < foods.length; i++) {
              
                foods[i] = new Food(random(10, width-41), random(70, height-150), 255);
          }
  
}


void draw() {
  
       //Fons
       tint(255, 255);
       image(terra, 0, 0);
       fill(0);
       rect(0, 0, 800, 40);
       
       //Temps
       if (crono == true) {
         cronometre.dibuixaComptaEnrere();
       }
       
       //Pantalla inici
       if (inici == true) {
             go = false;
             opacinici = 255;
             opacfi = 0;
             crono = false;
     
        
            if (clicI == true) {
              opacinici = 0;
              inici = false;
              
              go = true;
              crono = true;
              cronometre.reinicia();
              cronometre.reiniciaEnrera(10);
            }
        }
       //Creació dels objectes
             for (int i = 0; i < raspes.length; i++) {
                  
                    raspes[i].dibuixaR();
                    raspes[i].moureR();
             }
             for (int i = 0; i < cascs.length; i++) {
                  
                    cascs[i].dibuixaC();
                    cascs[i].moureC();
             }
             for (int i = 0; i < foods.length; i++) {
                  
                    foods[i].dibuixaF();
                    foods[i].moureF();
             }
       
       //Gat
       tint(255, opac);
       image(gatdreta, x, y);
       tint(255, opac2);
       image(gatesq, x, y);
       tint(255, opac3);
       image(gatamunt, x, y);
       tint(255, opac4);
       image(gatavall, x, y);
       
       if (go == true) {
            opacfi = 0;
            
            
           //Moviment esquerra
            if (pulsa == true && x >= 0 && x <= width - 110){
              x = x - 5;
              opac2 = 255;
              opac = 0;
              opac3 = 0;
              opac4 = 0;
            }
            
            if (x<0) {
               opac2 = 255;
              opac = 0;
              opac3 = 0;
              opac4 = 0;
              x = 1;
              pulsa = false;
            }
            
            //Moviment dreta
            if (pulsd == true && x >= 0 && x <= width - 110) {
              x = x + 5;
               opac2 = 0;
              opac = 255;
              opac3 = 0;
              opac4 = 0;
            } 
            
            if (x > width - 110) {
               opac2 = 0;
              opac = 255;
              opac3 = 0;
              opac4 = 0;
              x = 690;
              pulsd = false;
            }
            
            //Moviment avall
            if (pulss == true && y >= 0 && y <= height - 110){
              y = y + 5;
              opac2 = 0;
              opac = 0;
              opac3 = 0;
              opac4 = 255;
            } 
            
            if (y > height - 110) {
              opac2 = 0;
              opac = 0;
              opac3 = 0;
              opac4 = 255;
              y = 489;
              pulss = false;
            }
            
            //Moviment amunt
            if (pulsw == true && y >= 0 && y <= height - 110) {
              y = y - 5;
              opac2 = 0;
              opac = 0;
              opac3 = 255;
              opac4 = 0;
            } 
            
            if (y < 0) {
             opac2 = 0;
              opac = 0;
              opac3 = 255;
              opac4 = 0;
              y = 1;
              pulsw = false;
            }
            
            //Quan s'acaba el temps
            if (cronometre.fiEnrera()){
              go = false;
              cronometre.reinicia();
            }
            //Missatge torna-ho a intentar
            if (go == false) {
              pulsa = false;
              pulsd = false;
              pulsw = false;
              pulss = false;
              opacfi = 255;
             
            }
       }
 

 
    //Pantalla torna-ho a intentar
      fill(0, 191, 208, opacfi);
      rect(0, 0, 800, 600);
      fill(255, opacfi);
      stroke(24, 60, 63, opacfi);
      strokeWeight(15);
      rect(150, 150, 500, 300, 12);
      fill(0, opacfi);
      textSize(24);
      text("S'ha acabat el temps!", 283, 250);
      text("Has fet " + suma/1000 + " punts", 308, 300);
      strokeWeight(3);
      fill(0, opacfi);
      text("Tornar a jugar", 317, 390);
      fill(0, 0);
      rect(300, 355, 200, 50, 12);
      tint(255, opacfi);
      image(gatfi, 80, 400);
      
    //Pantalla inici
      fill(0, 191, 208, opacinici);
      rect(0, 0, 800, 600);
      fill(255, opacinici);
      stroke(24, 60, 63, opacinici);
      strokeWeight(15);
      rect(150, 150, 500, 300, 12);
      fill(0, opacinici);
      textSize(16);
      text("S'han deixat la porta de la cuina oberta!", 245, 250);
      text("Aprofita per agafar tant menjar com puguis.", 225, 280);
      text("Compte amb els cascabells! Faràn que t'enxampin abans.", 180, 310);
      strokeWeight(3);
      fill(0, opacinici);
      textSize(24);
      text("Jugar", 370, 388);
      fill(0, 0);
      rect(350, 355, 100, 50, 12);
      tint(255, opacinici);
      image(gatinici, 550, 400);
  
  
       
    
   //Pulsar botó torna-ho a intentar
      if (go == false && clic == true){
        go = true;
        suma = 0;
        resta = 0;
        restart = true;
        crono = true;
      } 
      
      if (restart == true) {
        cronometre.reinicia();
        cronometre.reiniciaEnrera(10);
        clic = false;
        restart = false;
        x = 10;
        y = 10;
        opac2 = 0;
        opac = 255;
        opac3 = 0;
        opac4 = 0;
      }
}


void keyPressed() {
      
  //Entrada teclat
      if (key == 'd') {
        pulsd = true;
        pulsa = false;
        pulsw = false;
        pulss = false;
      }
      if (key == 'a') {
        pulsa = true;
        pulsw = false;
        pulsd = false;
        pulss = false;
      }
      if (key == 'w') {
        pulsw = true;
        pulsa = false;
        pulsd = false;
        pulss = false;
      }
      if (key == 's') {
        pulss = true;
        pulsa = false;
        pulsd = false;
        pulsw = false;
      }
}
  void mousePressed() {
    
    //Entrada mouse
    if (inici == false && mouseX > 300 && mouseX < 500 && mouseY > 355 && mouseY < 405){
      clic = true;
    }
      
    if (inici == true && mouseX > 300 && mouseX < 500 && mouseY > 355 && mouseY < 405){
      clicI = true;
    }
  }

  


class Casc {
  float xCas;
  float yCas;
  float opC;
 
   Casc() {
  
       xCas = 0;
       yCas = 0;
       opC = 255;
    }
  
    Casc(float xC, float yC, float oC){
    
      xCas = xC;
      yCas = yC;
      opC = oC;
      
    }
  
    void dibuixaC() {
    tint(255, opC);
    image(casc, xCas, yCas);
    }
    
    void moureC() {
      if (go == true) {
        if (xCas + 5 > x && xCas + 5 < x + 110 && yCas > y && yCas < y + 71 || xCas + 33 > x && xCas + 33 < x + 110 && yCas > y && yCas < y + 71 || xCas + 5 > x && xCas + 5 < x + 110 && yCas + 33 > y && yCas + 33 < y + 71 || xCas + 33 > x && xCas + 33 < x + 110 && yCas + 33 > y && yCas + 33 < y + 71){
        
           xCas = random(10, width-18);
           yCas = random(70, height-150);
           resta = resta + 10000;
        }
      }
     
    }
    
    
}
  
 
class Raspa {
  float xRas;
  float yRas;
  float opR;
 
   Raspa() {
  
       xRas = 0;
       yRas = 0;
       opR = 255;
    }
  
    Raspa(float xR, float yR, float oR){
    
      xRas = xR;
      yRas = yR;
      opR = oR;
      
    }
  
    void dibuixaR() {
    tint(255, opR);
    image(raspa, xRas, yRas);
    }
    
    void moureR() {
      if (go == true) {
        if (xRas + 5 > x && xRas + 5 < x + 110 && yRas > y && yRas < y + 71 || xRas + 18 > x && xRas + 18 < x + 110 && yRas > y && yRas < y + 71 || xRas + 5 > x && xRas + 5 < x + 110 && yRas + 19 > y && yRas + 19 < y + 71 || xRas + 18 > x && xRas + 18 < x + 110 && yRas + 19 > y && yRas + 19 < y + 71){
        
           xRas = random(10, width-58);
           yRas = random(70, height-150);
           suma = suma + 5000;
        }
      }
       
    }
}
  
 
class Food {
  float xFoo;
  float yFoo;
  float opF;
 
    Food() {
  
       xFoo = 0;
       yFoo = 0;
       opF = 255;
    }
  
    Food(float xF, float yF, float oF){
    
      xFoo = xF;
      yFoo = yF;
      opF = oF;
      
    }
  
    void dibuixaF() {
    tint(255, opF);
    image(food, xFoo, yFoo);
    }
    
    void moureF() {
      if (go == true) {
        if (xFoo + 5 > x && xFoo + 5 < x + 110 && yFoo > y && yFoo < y + 71 || xFoo + 18 > x && xFoo + 18 < x + 110 && yFoo > y && yFoo < y + 71 || xFoo + 5 > x && xFoo + 5 < x + 110 && yFoo + 19 > y && yFoo + 19 < y + 71 || xFoo + 18 > x && xFoo + 18 < x + 110 && yFoo + 19 > y && yFoo + 19 < y + 71){
        
           xFoo = random(10, width-41);
           yFoo = random(70, height-150);
           suma = suma + 5000;
        }
      }
      
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
    return (int)((millis() - principi)/ 1000)%60;
  }
  int minuts(){
    return (int)((millis() - principi)/ 60000);
  }
  
  int minutsEnrera(){
      int resultat = (int)((enrera-millis()+suma-resta)/ 60000); 
      if (resultat < 0){
        resultat = 0;
      }
      return resultat;
  }
  
  int segonsEnrera(){
    int resultat = (int)((enrera-millis()+suma-resta)/ 1000)%60;
    if (resultat < 0){
        resultat = 0;
      }
     
      return resultat; 
   }
  
  boolean fiEnrera(){
    return minutsEnrera() == 0 && segonsEnrera() == 0 ;
  }
  boolean limitCrono(int seg){
      return minuts()*60 + segons() == seg;
  }
  
  
  void dibuixaComptaEnrere(){
    fill(255, 0);
    textSize(24);
    stroke(255);
    strokeWeight(2);
    rect(724, 5, 63, 30, 12);
    fill(255);
    if (segonsEnrera() >= 0 && segonsEnrera() < 10) {
     text(minutsEnrera()+":0"+segonsEnrera(), 730, 29);
    }else {
      text(minutsEnrera()+":"+segonsEnrera(), 730, 29);
    }
    
    
  }
  void reinicia(){
    principi = millis();
  }
 

  
}


