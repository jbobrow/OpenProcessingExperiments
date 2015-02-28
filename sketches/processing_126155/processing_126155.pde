
PImage F1,F2,F3;
float xPosF1 = 10;
int yPosF1 = 200;
float xPosF2 = 10;
int yPosF2 = 300;
float xPosF3 = 10;
int yPosF3 = 400;
float velocidadF1 = random(1,10);
float velocidadF2 = random(1,10);
float velocidadF3 = random(1,10);
boolean ganadorF1=false;
boolean ganadorF2=false;
boolean ganadorF3=false;
Temps cronometre;

void setup(){
  size(800,600);
  F1=loadImage("f1.png");
  F2=loadImage("f2.png");
  F3=loadImage("f3.png");
  cronometre =new Temps();
}
void draw(){
  background(125);
  noStroke();
  fill(0,126,0);
  rect(0,0,width,150);
  rect(0,475,width,150);
  stroke(255);
  strokeWeight(5);
  line(0,153,width,153);
  line(0,472,width,472);
  line(0,275,width,275);
  line(0,375,width,375);
  line(625,155,625,471);
  noStroke();
  fill(255,0,0);
  rect(100,500,260,50);
  fill(255);
  image(F1, xPosF1, yPosF1);
  image(F2, xPosF2, yPosF2);
  image(F3, xPosF3, yPosF3);
  cronometre.dibuixaComptaEnrere();
  if (cronometre.fiEnrera()==0){
    if (xPosF1<475){
      xPosF1=xPosF1+velocidadF1;
    }
    if (xPosF2<475){
      xPosF2=xPosF2+velocidadF2;
    }
    if (xPosF3<475){
      xPosF3=xPosF3+velocidadF3;
    }
  }
  if(ganadorF1==false && xPosF1>=475){
    fill(255,0,0);
    text("Guanyador",640,230);
    ganadorF2=true;
    ganadorF3=true;
  }
  if(ganadorF2==false && xPosF2>=475){
    fill(255,0,0);
    text("Guanyador",640,330);
    ganadorF1=true;
    ganadorF3=true;
  }
  if(ganadorF3==false && xPosF3>=475){
    fill(255,0,0);
    text("Guanyador",640,430);
    ganadorF2=true;
    ganadorF1=true;
  }
}

void mousePressed(){
  if(mouseX>100&&mouseX<360&&mouseY>500&&mouseY<550){
    xPosF1 = 10;
    yPosF1 = 200;
    xPosF2 = 10;
    yPosF2 = 300;
    xPosF3 = 10;
    yPosF3 = 400;
    velocidadF1 = random(1,10);
    velocidadF2 = random(1,10);
    velocidadF3 = random(1,10);
    ganadorF1=false;
    ganadorF2=false;
    ganadorF3=false;
    cronometre.Inicia();
  }  
}
class Temps {
  int inici;
  int enrera;
  PFont texto;
  
  void Inicia() {
      inici=millis();
      enrera = 5000 + inici;
  }

  int minutsEnrera() {
    int resultat = (int)((enrera-millis())/ 60000);
    if (resultat < 0) {
      resultat = 0; 
    }
    return resultat;
  }

  int segonsEnrera() {
    int resultat = (int)((enrera-millis())/ 1000)%60;
    if (resultat < 0) {
      resultat = 0;
    }
    return resultat;
  }

  int fiEnrera(){
      int resultat=1;
    if(inici!=0&&enrera!=0&&minutsEnrera() == 0 && segonsEnrera() == 0){
      resultat=0;
      }
      return resultat;
    }

  void dibuixaComptaEnrere() {
    fill(255, 0, 0);
    texto = createFont("Arial", 30);
    textFont(texto);
    text("La carrera comença en: "+minutsEnrera()+":"+segonsEnrera(), 100, 100);
    fill(255);
    text("INICIA / REINICIA",112.5,537.5);
  }
}



