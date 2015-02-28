
PFont font, font2;
Puntuacio score;
int punts = 0;
//quantitat de punts que augmenta el comptador amb cada polsacio
int quantitat = 1;
//transparencia de la mosca (el +1)
float transpa = 255;
//posicio de la mosca
float x;
float y;
Punt mosca;
Logro medalla;

void setup(){
  size(400,400);
  font = createFont("System Negrita", 20);
  textFont(font);
  score = new Puntuacio(80,30,quantitat);
  mosca = new Punt(quantitat);
  medalla = new Logro();
}

void draw(){
  background(0);
  //crida del marcador
  score.dibuixa();
  //crida de la mosca
  mosca.dibuixa(x, y);
  //crida de les medalles
  if(punts>=10){
    medalla.dibuixa();
    
    medalla.desapareix();
  }
}

void mousePressed(){
  //crida de la funcio puntua
   score.puntua();
   //reinicialitzacio de transpa i nova posicio per a la x i la y
   transpa = 255;
   x = mouseX+random(-25,25);
   y = mouseY+random(-25,25);
}
class Logro{
  float xpos;
  float ypos;
  float trans;
  float comptador = 0;
  Logro(){
    xpos = 195;
    ypos = 10;
    trans = 255;
  }
  
  void dibuixa(){
    noStroke();
    fill(40, trans);
    rect(xpos,ypos,195,40);
    fill(60, trans);
    rect(xpos+6,ypos+5,30,31);
    
    tint(255,trans);
    
   // textMode(CENTER);
    fill(220, trans);
    textSize(14);
    
    text("¡Has hecho 10 clicks!",xpos+186, ypos+24);
    
    strokeWeight(2);
    stroke(255, trans);
    strokeCap(SQUARE);
    line(xpos,ypos,xpos+195,ypos);
    line(xpos,ypos,xpos,ypos+40);
    stroke(150, trans);
    line(xpos,ypos+40,xpos+195,ypos+40);
    line(xpos+195,ypos,xpos+195,ypos+40);
    comptador+=1;
    
    tint(255);
    strokeWeight(1);
    strokeCap(ROUND);
    
  }
  void desapareix(){
    if(comptador>100){
    trans *= 0.96;
    }
  }


}
class Punt{
  int valor;
  
  Punt(int p){
    valor = p;
  }
  
  void dibuixa(float xMosca, float yMosca ){
    fill(255,transpa);
    textSize(20);
    text("+"+valor,xMosca,yMosca);
    //velocitat a la que puja la mosca
    y -= 1.5;
    //velocitat a la que desapareix la mosca
    transpa -= 4;  
  }
  
}
class Puntuacio{
  int xPos;
  int yPos;
  float augment;
  
  Puntuacio(int x, int y, float a){
    xPos = x;
    yPos = y;
    augment = a;
  }

  void dibuixa(){
    if(punts>=99999){
      punts=99999;
    }
    noStroke();
   // fill(30,30,200);
    fill(40);
    rect(xPos-56,yPos-16,58,19);
    fill(255);
    textAlign(RIGHT);
    textSize(20);
    strokeWeight(2.5);
    text(punts, xPos, yPos);
    strokeCap(SQUARE);
    stroke(255);
    line(xPos-57,yPos-18,xPos+1,yPos-18); //primera horitzontal
    line(xPos-58,yPos-17,xPos-58,yPos); //primera vertical
    stroke(150);
    line(xPos-57,yPos+2,xPos+1,yPos+2); //segona horitzontal
    line(xPos+2,yPos-17,xPos+2,yPos+1); //segona vertical
  }
  
  void puntua(){
    if(punts<=99999){
      punts += augment;
    }else{
      punts = 99999;
    }
  }
}


