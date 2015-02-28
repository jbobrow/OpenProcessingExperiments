
PImage f1,f2,f3,f4;
Figura mig;
Figura2 supesq;
Figura2 supdret;
Figura2 infesq;
Figura2 infdret;
Temps cronometre;
Ranking score;
int pantalla = 1;
boolean pasa = true;
int pantallaActual;
int pantallaDesti;

void setup(){
 size(450,450); 
 f1= loadImage("1.gif");f2 = loadImage("2.gif");f3 = loadImage("3.gif");f4 = loadImage("4.gif");
score = new Ranking();
 
}

void draw(){
  
  
  //if (mousePressed)
  
  
  
  switch(pantalla){
  case 1:
 cronometre = new Temps();
 mig = new Figura();
  supesq = new Figura2(70,70,60,60,color(0,0,255),3,3.1);
 supdret = new Figura2(275,60,60,50,color(0,0,255),3,3.1);
 infesq = new Figura2(70,320,30,60,color(0,0,255),3,3.1);
 infdret = new Figura2(310,330,91,20,color(0,0,255),3,3.1);
 
  stroke(0);
  background(0);
  fill(0);
  stroke(255);
  fill(255);
  rect(width/2,height/2,350,350);
 
 
  
  mig.dibuixa();
  mig.apreta();
  
  supesq.dibuixa();
  supdret.dibuixa();
  infesq.dibuixa();
  infdret.dibuixa();
  if(mousePressed == true && mouseX >= width/2-40 && mouseX <= width/2+2 && mouseY >= height/2-40 && mouseY <= height/2+2){
    pantalla =2;
    
  }
  
  break;
  
  case 2:
  stroke(0);
  background(0);
  fill(0);
  stroke(255);
  fill(255);
  rect(width/2,height/2,350,350);
  textSize(18);
  text(cronometre.segons(),225,20);
 
 if(colisio1(supdret.xPos, supdret.yPos, mig.xPos, mig.yPos)){
   pantalla = 3;
 }
 if(colisio2(supesq.xPos, supesq.yPos, mig.xPos, mig.yPos)){
   pantalla = 3;
 }
 if(colisio3(infdret.xPos, infdret.yPos, mig.xPos, mig.yPos)){
   pantalla = 3;
 }
 if(colisio4(infesq.xPos, infesq.yPos, mig.xPos, mig.yPos)){
   pantalla = 3;
 }
  
  mig.dibuixa();
  mig.apreta();
  
  supesq.dibuixa();
  supdret.dibuixa();
  infesq.dibuixa();
  infdret.dibuixa();
  
  supesq.moureX();
  supesq.moureY();
  supdret.moureX();
  supdret.moureY();
  infesq.moureX();
  infesq.moureY();
  infdret.moureX();
  infdret.moureY();
  
  
  
  
  
  break;
  

  
  case 3:
  
  cursor();
  cronometre.dibuixaCronometre();
  cronometre.pausa();
  
  
  
  if (mousePressed == true | keyPressed == true){
    pasa = false;
    pantalla = 4;
    
  }


  break;
  
  case 4:
 
  //background(0); si esta activo no salen los trofeos, si esta desactivado y el record es igual a uno existente se sobreponen dos pantallas
  
  score.dibuixa();
  
  
  if (mousePressed == true | keyPressed == true && pasa==true){
    
    pantalla = 1;
  }
  
}
  
}

void mouseReleased(){
  pasa = true;
}
void i1(){
  image(f1,0,0);
}
 class Ranking {
  float xPos;
  float yPos;

int [] Ranking = {0,0,0,0,0};

  Ranking(){
    
    xPos = 220;
    yPos = 100;
    
    
  }
  
  void dibuixa(){
    int posicio =-1;
    int n0 =0;
    int n1 =0;
    int n2 =0;
    int n3 =0;    
    
    if(cronometre.segons()>Ranking[0]){
        cronometre.pausa();
        n0 = Ranking[0];n1 = Ranking[1];n2 =Ranking[2];n3 = Ranking[3];
        Ranking[1] = n0;
        Ranking[2] = n1;
        Ranking[3] = n2;
        Ranking[4] = n3;
        i1();
        Ranking[0] = cronometre.segons();
    } 
    if (cronometre.segons()>Ranking[1] && cronometre.segons()<Ranking[0]){
      cronometre.pausa();
      n1 = Ranking[1];n2 =Ranking[2];n3 = Ranking[3];
      Ranking[2] = n1;
      Ranking[3] = n2;
      Ranking[4] = n3;   
      i2();
      Ranking[1] = cronometre.segons();
    }
    if(cronometre.segons()>Ranking[2] && cronometre.segons()<Ranking[1]){
      cronometre.pausa();
      n2 = Ranking[2];n3 = Ranking[3];
      Ranking[3] = n2;
      Ranking[4] = n3;
      i3();
      Ranking[2] = cronometre.segons();
    }
    if(cronometre.segons()>Ranking[3] && cronometre.segons()<Ranking[2]){
      cronometre.pausa();
      n3 = Ranking[3];
      Ranking[4] = n3;
      i4();  
      Ranking[3] = cronometre.segons();
    }
    if(cronometre.segons()>Ranking[4] && cronometre.segons()<Ranking[3]){
    cronometre.pausa();
    Ranking[4] = cronometre.segon();
    i4();
  }
  if(cronometre.segons()<=0){
    cronometre.pausa();
    i4();
  }
 
  cronometre.pausa(); 
    
    
    fill(255);
    textSize(26);
    text("1r Puesto "+Ranking[0]+" Segundos",xPos,yPos);
    textSize(20);
    text("2º Puesto "+Ranking[1]+" Segundos",xPos,yPos+40);
    textSize(18);
    text("3r Puesto "+Ranking[2]+" Segundos",xPos,yPos+80);
    textSize(14);
    text("4º Puesto "+Ranking[3]+" Segundos",xPos,yPos+120);
    text("5º Puesto "+Ranking[4]+" Segundos",xPos,yPos+160);
    text("Click o toca la pantalla para volver a jugar",225,325);
    
  }
}
void i2(){
  image(f2,0,0);
}
void i3(){
  image(f3,0,0);
}
class Figura2{
  
  color c;
  float xPos;
  float yPos;
  float llarg;
  float alt;
  boolean mouse = false;
  float velocitatX;
  float velocitatY;
  
  
  Figura2(){
   c =color(0,0,255);
   xPos= (width/2)-20;
   yPos= (height/2)-20;
   llarg = 40;
   alt = 40;
   velocitatX = 1;
   velocitatY = 1;
  }
   
   Figura2 (float x, float y, float xx, float yy, color newC, float xSpeed, float ySpeed) {
   c = newC;
   xPos = x;
   yPos = y;
   llarg =xx;
   alt = yy;
   velocitatX = xSpeed;
   velocitatY = ySpeed;
   
   
   }
   
  void dibuixa(){
    fill(c);
    noStroke();
    rectMode(CENTER);
    rect(xPos,yPos,llarg,alt);
  }
  
  float moureX(){
    
    
    xPos = xPos + velocitatX;

    velocitatX = velocitatX * 1.0002;
    
   if (xPos > width - llarg/2){
     
    velocitatX = velocitatX -velocitatX-velocitatX;
   }
   if (xPos < 0 + llarg/2){
    
    velocitatX = velocitatX -velocitatX-velocitatX;
   }
   return (xPos);
  }
  
 
  
  float moureY(){
    
    yPos = yPos + velocitatY;
    
    velocitatY = velocitatY * 1.0002;
    
    if (yPos > height - alt/2){
     
    velocitatY = velocitatY -velocitatY-velocitatY;
   }
   if (yPos < 0 + alt/2){
    
    velocitatY = velocitatY -velocitatY-velocitatY;
   }
   return (yPos);
  }
 
  
 
}
class Figura{
  
  color c;
  float xPos;
  float yPos;
  float llarg;
  float alt;
  boolean mouse = false;

  
  
  Figura(){
    c= color(255,0,0);
    xPos= (width/2)-20;
    yPos= (height/2)-20;
    llarg = 40;
    alt = 40;
    
  }
  
  
  
    
  Figura (float x, float y, float xx, float yy, color newC) {
   c = newC;
   xPos = x;
   yPos = y;
   llarg =xx;
   alt = yy;
  }
   
  void dibuixa(){
    fill(c);
    noStroke();
    rectMode(CENTER);
    rect(xPos,yPos,llarg,alt);
  }
  
  
  
  void apreta(){
    if (mousePressed == true && mouseX >= xPos-20 && mouseX <= xPos+20 && mouseY >= yPos-20 && mouseY <= yPos+20){
      mouse = true;
      noCursor();
      
    }
      
    if ( mouse == true){  
    xPos = mouseX;
    yPos = mouseY;    
    }
    if (xPos < 50+20){
      xPos = 70;      
    }
    if (xPos > 400-20){
      xPos = 380;      
    }
    if (yPos < 50+20){
      yPos = 70;      
    }
    if (yPos > 400-20){
      yPos = 380;      
    }
    
}
}
boolean colisio1(float x, float y,float figura2x, float figura2y){
     return ((figura2x>x-50&&figura2x<x+50)&&(figura2y>y-50&&figura2y<y+50));
  }//supesq
  boolean colisio2(float x, float y,float figura2x, float figura2y){
     return ((figura2x>x-50&&figura2x<x+50)&&(figura2y>y-45&&figura2y<y+45));
  }//supdret
boolean colisio3(float x, float y,float figura2x, float figura2y){
     return ((figura2x>x-65.1&&figura2x<x+65.1)&&(figura2y>y-30&&figura2y<y+30));
  }//infdret
  boolean colisio4(float x, float y,float figura2x, float figura2y){
     return ((figura2x>x-35&&figura2x<x+35)&&(figura2y>y-50&&figura2y<y+50));
  }//infesq
void i4(){
  image(f4,0,0);
}
class Temps{
  int principi;
  boolean pausat;
  int pausaV;
  
  Temps(){
    principi = millis();
    pausat = false;
  }
  int segons(){
    return (int)((millis() - principi)/1000)%60;
  }
  int minuts(){
    return (int)((millis() - principi)/60000);
  }
  
  void dibuixaCronometre(){
    fill(255);
    background(0);
    textSize(26);
    textAlign(CENTER);
    text("Has aguantado: "+minuts()+":"+segons(),width/2,height/2);
    textSize(16);
    text("Click o toca la pantalla para ver el ranking",225,325);
    
  }
  
  void reinicia(){
    principi = millis();
  }
  //fer que principi sempre tingui la mateixa diferencia amb millis per aixo cal fer millis - principi = diferencia(nova variable), despres principi = a diferencia
  void pausa(){
    if (pausat == false){
      pausaV = millis() - principi;
      pausat = true;
    }
    principi = millis() - pausaV;
  }  
}


