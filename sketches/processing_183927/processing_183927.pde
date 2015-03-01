
Input entrada;
Raspa[] raspes = new Raspa[1];
int punts = 0;
boolean start = false;
int opac1 = 255;
int opac2 = 0;
boolean inici = true;
boolean clicI = false;
boolean crono = false;
boolean clic = false;
boolean restart = false;

void setup() {
      
      size(450, 550);
      entrada = new Input();
      cronometre = new Temps();
    
    
       
      for (int i = 0; i < raspes.length; i++) {  
        
            raspes[i] = new Raspa(140, 250, 255, (int)random(0, 15), (int)random(0, 15));
       
      }       
  
}

void draw() {
  
  background(213, 249, 185);
  fill(0);
  noStroke();
  rect(0, 0, 450, 50);
      
     //Temps
     if (crono == true) {
         cronometre.dibuixaComptaEnrere();
     }
  
     //Pantalla inici
        if (inici == true) {
                   start = false;
                   opac1 = 255;
                   opac2 = 0;
                   crono = false;
            if (clicI == true) {
                    opac1 = 0;
                    inici = false;
                    
                    start = true;
                    crono = true;
                    cronometre.reinicia();
                    cronometre.reiniciaEnrera(30);
                  }
        }
     
             
        if (start == true) {
           entrada.dibuixa();
           cronometre.dibuixaComptaEnrere();
           cronometre.reinicia();
           opac1 = 0;       
           opac2 = 0;
           textSize(24);
           fill(255);
           text("Puntuació: " + punts, 20, 36);     
              
               for (int i = 0; i < raspes.length; i++) {
                         raspes[i].dibuixaR();
                         raspes[i].moureR();
               }
             
         }
            
    //Quan s'acaba el temps
         if (cronometre.fiEnrera()){
               start = false;
               crono = false;
                   
         }
         if (start == false) {
               opac2 = 255;
         }
   
    //Pulsar botó torna-ho a intentar
          if (start == false && clic == true){
              start = true;
              punts = 0;
              restart = true;
              crono = true;
              opac2 = 0;
           } 
            
           if (restart == true) {
              cronometre.reinicia();
              cronometre.reiniciaEnrera(30);
              clic = false;
              restart = false;
           }
                   
   //Pantalla reiniciar
              noStroke();
              fill(213, 249, 185, opac2);
              rect(0, 0, 450, 550);
              strokeWeight(6);
              stroke(50, 108, 5, opac2);
              fill(255, opac2);
              rect (75, 140, 300, 300, 16);
              textSize(24);
              fill(0, opac2);
              text("S'ha acabat el temps!", 115, 250); 
              text("La teva puntuació:", 135, 285);
              text(punts, 200, 320);
              
              fill(213, 249, 185, 0);
              rect (135, 350, 180, 50, 16);
              textSize(24);
              fill(50, 108, 5, opac2);
              text("Tornar a jugar", 145, 385); +
              
    //Pantalla inici
              noStroke();
              fill(213, 249, 185, opac1);
              rect(0, 0, 450, 550);
              strokeWeight(6);
              stroke(50, 108, 5, opac1);
              fill(255, opac1);
              rect (75, 140, 300, 300, 16);
              textSize(24);
              fill(0, opac1);
              text("Fes els càlculs tant", 120, 250); 
              text("ràpid com puguis! ", 130, 285);
              fill(213, 249, 185, 0);
              rect (165, 350, 130, 50, 16);
              textSize(24);
              fill(50, 108, 5, opac1);
              text("Jugar", 200, 385); 
       
}



void keyPressed() {

        if (keyCode == BACKSPACE || keyCode == DELETE){
          entrada.borrar();
        } else if (key != CODED){
            if(entrada.texte.length() < entrada.limit){
              entrada.afegeix(key);
            }
        }
        
}

void mousePressed() {
    
    //Entrada mouse
    if (start == false && inici == false && mousePressed && mouseX > 135 && mouseX < 315 && mouseY > 350 && mouseY < 400){
      clic = true;
    }
      
    if (inici == true && mouseX > 165 && mouseX < 295 && mouseY > 350 && mouseY < 400){
      clicI = true;
    }
  }
class Input {
  String texte;
  float xPos;
  float yPos;
  int limit;
  PFont fonBoto;
 
  Input (){
    texte = "";
    xPos = 0;
    yPos = 0;
    limit = 8;
    fonBoto = createFont("Arial", 12);
    textFont(fonBoto);

  }
  
  Input (String r, float x, float y, int l){
    texte = r; 
    xPos = x;
    yPos = y;
    limit = l;
    fonBoto = createFont("Aarial", 12);
    textFont(fonBoto);
  }
  
  void dibuixa(){
    stroke (0);
    strokeWeight(2);
    fill(255);
    rect (xPos + 180, yPos + 450, 100, 40, 16);
    fill(#030000);
    textSize(28);
    text (texte, xPos + 220, yPos + 480);
  }
  void borrar(){ 
      texte = texte.substring(0,max(0,texte.length()-1));
  }
  
  void afegeix(char key){
    texte = texte.concat (new String(key));
  }
  
  int aEnter(){
    return parseInt(texte);
  }
}
class Raspa {
  float xRas;
  float yRas;
  float opR;
  int xifra1;
  int xifra2;
  boolean enter = false;
 
 
   Raspa() {
  
       xRas = 0;
       yRas = 0;
       opR = 255;
       xifra1 = 0;
       xifra2 = 0;
      
    }
  
    Raspa(float xR, float yR, float oR, int xf1, int xf2){
    
      xRas = xR;
      yRas = yR;
      opR = oR;
      xifra1 = xf1;
      xifra2 = xf2;
      
      
    }
  
    void dibuixaR() {
       
        fill(0, opR);
        textSize(66);
        text(xifra1 + " + " + xifra2, xRas, yRas);
        
    }
    
    void moureR() {
      
         if (entrada.texte == xifra1 + xifra2 && keyCode == ENTER) {
                  enter = true;
                  punts = punts + 50;
                  xifra1 = (int)random(0, 15);
                  xifra2 = (int)random(1, 15);
    
         }
       
        if( keyReleased ){
                  enter = false;
        }
        
        if (keyCode == ENTER && enter == false){
                  entrada.borrar();
        
        }
       
        if (keyCode == RETURN || keyCode == BACKSPACE || keyCode == DELETE) {
           entrada.borrar();
        }
     
     }

}

 
class Temps{
  int principi;
  int enrera;
  Temps(){
    principi = millis();
    enrera = 30000 + principi;
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
    return minutsEnrera() == 0 && segonsEnrera() == 0 ;
  }
  boolean limitCrono(int seg){
      return minuts()*60 + segons() == seg;
  }
  
  
  void dibuixaComptaEnrere(){
    fill(0);
    textSize(24);
    stroke(255);
    strokeWeight(2);
    rect(374, 8, 63, 30, 16);
    fill(255);
    if (segonsEnrera() >= 0 && segonsEnrera() < 10) {
     text(minutsEnrera()+":0"+segonsEnrera(), 382, 32);
    }else {
      text(minutsEnrera()+":"+segonsEnrera(), 382, 32);
    }
    
    
  }
  void reinicia(){
    principi = millis();
  }
 

  
}


