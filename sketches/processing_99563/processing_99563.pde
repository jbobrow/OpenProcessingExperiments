
import oscP5.*;
import netP5.*;


import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


Minim minim;//creem un objecte de so
AudioOutput out;//creem un output
SineWave sine;//i un objecte d'ona sinusoïdal per fer soroll

 
MouTe mt = new MouTe();//Objecte mouTe
 
 //Creamos un objeto PImage, de nombre barco


PImage barco;




//definim les variables que utilitzem//
float szel,szrect;
float[] Posicionselipse = new float[24];

int rectmov = 10;


//hem de fenerar una matriu per a les posX en els "ullsmov" elements:

float[] posX = new float[rectmov];
//el mateix per posY:
float[] posY = new float[rectmov];
//i per velX:
float[] velX = new float[rectmov];
//i velY:
float[] velY = new float[rectmov];



void setup(){
size(600,600);


  //cargamos un archivo de imágen en afoto
  //(que tiene que estar en el sketch folder, y moejor dentro de la carpeta data)
barco=loadImage("barco.png");
  //anulamos la flechita del cursor


  //inicialitzem posicions i velocitats//
  for(int i = 0; i<rectmov; i++){
    posX[i] = random (100,500);
    posY[i] = random (100,500);
    velX[i] = random(1,6);
    velY[i] = random(1,6);
  } 
     szel=25;
     szrect=20;
     

noCursor();
}
 
void draw() {

  background(#94BEDE);
  
  
 
  
// ratllem la diagonal superior del fons amb línies negres //
strokeWeight(3);

stroke(0);
line(0,0,width,height);
for (int i = 0; i <width; i = i+25) {
  line(i,0, i, i);
}

for (int i = 0; i < height; i = i+25) {
  line(i,i,width, i);
}

// ratllem la diagonal inferior del fons amb línies blanques //
stroke(#FFFFFF);
for (int i = 0; i < 600; i = i+25) {
  line(i,600,i,i);
}

for (int i = 0; i < 600; i = i+25) {
  line(i,i,0,i);
}


// creem aleatoriament totes les posicions //
  for(int i=0; i<24; i++){
 Posicionselipse[i] = i*szel;
  }
//  i dibuixem les elipses de la primera diagonal //
  for(int i=0; i<Posicionselipse.length; i++){
    fill(50,50,50);
   ellipse(Posicionselipse[i]+(szel/2),Posicionselipse[i]+(szel/2),szel,szel);
  }
  
    for(int i=0; i<Posicionselipse.length; i++){
      fill(100,50,50);
   ellipse(Posicionselipse[i]+(szel/2),Posicionselipse[i]+(szel/2),szel/2,szel/2);
  }
  
  //  i dibuixem les altres elipses //
  for(int i=0; i<Posicionselipse.length; i++){
    fill(100,50,50);
   ellipse(width-(Posicionselipse[i]+(szel/2)),(Posicionselipse[i]+(szel/2)),szel,szel);
  }
  
    for(int i=0; i<Posicionselipse.length; i++){
     fill(50,50,50);
   ellipse(width-(Posicionselipse[i]+(szel/2)),Posicionselipse[i]+(szel/2),szel/2,szel/2);
  }
  
  //formes en moviment//

  //iniciem un bucle perquè faci les mateixes accions //
  //a tots els valors de les matrius
  for(int i = 0; i<rectmov; i++){
    //actualitzem posicions
    posX[i] += velX[i];
    posY[i] += velY[i];

    //comprobem límits X
    if((posX[i]<0+(szrect/2))||(posX[i]>width-(szrect/2))){
      velX[i] = -velX[i];
    } 
    //comprobem límits Y
    if((posY[i]<0+(szrect/2))||(posY[i]>height-(szrect/2))){
      velY[i] = -velY[i];
    } 
    
    //generem un canvi de color //
      if((posX[i]<posY[i])||(posY[i]>posX[i])){
     stroke(255); 
      fill(0);
      }
      else{
           fill(255);
      stroke(0);
     
    } 
  // dibuixem els rectangles que es mouran //
rect(posX[i]-10,posY[i]-10,szrect,szrect);

  }
  
//foto
image(barco,mt.getCenterXRelative(),mt.getCenterYRelative()-12,100,25);

  
}
  
  
//per reiniciar el programa //
void mousePressed(){
  //reinicialitzem les velocitats //
  for(int i = 0; i<rectmov; i++){
    velX[i] = random(4,8);
    velY[i] = random(4,8);
   
  }
    minim = new Minim(this);//posem l'objecte de so
  daSound = minim.loadFile("93846__cgeffex__huge-explosion6.flac");
    daSound.cue(0);
    daSound.play();
}


 
///////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
// Inici de la documentació.
// Amb el que hi ha descrit en aquesta secció n'hi ha prou per operar amb
// la classe MouTe
// moute.joan.cat
////////////////////////////////////////////////////////////////////////////////

/*
 MÈTODES DISPONIBLES:
 
 **** DADES DIRECTES DE MouTe: ****
 
 getBox();         // retorna un array de 4 ints, x-y superior esquerre; x-y inferior dreta
 getActives();     //retorna un array de 192 ints, amb valors de 0 o 1, corresponents a cada cel·la de la matriu de 16x12
 getTotalActives();//retorna un int amb el total de cel·les actives   
 getSilhouette();  //retorna un array de 240 valors, corresponents cada parella a una de les línies (de les 120 que analitza 
 el MouTe. Els valors són de la X esquerra i X dreta per cada línia, i són -1 ambdós si no es detecta 
 presència en aquesta línia. Per exemple, silh[20] és el valor esquerre de la x en la línia 11. silh[21]
 la x dreta de la mateixa línia
 
 **** DADES CALCULADES: ****
 
 getCenterXAbsolute();  //retorna un float amb la X del centre de gravetat sobre 160
 getCenterYAbsolute();  //retorna un float amb la Y del centre de gravetat sobre 120
 
 getCenterXRelative();  //retorna un float amb la X del centre de gravetat sobre width
 getCenterYRelative();  //retorna un float amb la Y del centre de gravetat sobre height
 
 getLeftXBox();   //Límit esquerre (en X) de la caixa contenidora sobre 160
 getRightXBox();   //Límit dret (en X) de la caixa contenidora sobre 160
 getUpperYBox();   //Límit superior (en Y) de la caixa contenidora sobre 120
 getLowerYBox();   //Límit inferior (en Y) de la caixa contenidora sobre 120
 
 getLeftXBoxRelative();   //Límit esquerre (en X) de la caixa contenidora sobre width
 getRightXBoxRelative();   //Límit dret (en X) de la caixa contenidora sobre width
 getUpperYBoxRelative();   //Límit superior (en Y) de la caixa contenidora sobre height
 getLowerYBoxRelative();   //Límit inferior (en Y) de la caixa contenidora sobre height
 
getMatrixCoord(x,y);  //Retorna un booleà segons si la cel·la corresponent als dos paràmetres (x i y) és activa (true) o no (false)

**** DIBUIX: ****
 
 dibuixaCaixa(); //Dibuix de la caixa contenidora a 160 x 120
 dibuixaCentre();  //Dibuix del centre de gravetat a 160 x 120
 dibuixaCelles();  //Dibuix de la matriu de les cel·les a 160 x 120
 dibuixaSilueta();   //Dibuix de la silueta a 160 x 120
 
 dibuixaCaixaRelatiu(); //Dibuix de la caixa contenidora proporcional a width i height
 dibuixaCentreRelatiu();  //Dibuix del centre de gravetat proporcional a width i height
 dibuixaCellesRelatiu();  //Dibuix de la matriu de les cel·les proporcional a width i height
 dibuixaSiluetaRelatiu();   //Dibuix de la silueta proporcional a width i height
 
 */

////////////////////////////////////////////////////////////////////////////////
// Fi de la documentació
///////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////


//CLASSE MOUTE

class MouTe {

  int[] cC = new int[4];  //creamos array per la caixa contenidora
  int[] cells = new int[192];  //i un array per totes les cel·les
  int[] silh = new int[240];  //array per la silueta
  int totalActives;  //una variable pel total de cel·les actives

    //Objectes OSC:
  OscP5 oscP5Box,oscP5Cells, oscP5TotalCells, oscP5Silh;

  //Constructor amb els ports com a paràmetres:
  MouTe(int _box, int _sil, int _cells, int _total) {
    oscP5Box = new OscP5(this,_box);
    oscP5Silh = new OscP5(this,_sil);
    oscP5Cells = new OscP5(this,_cells);
    oscP5TotalCells = new OscP5(this,_total);
  }

  //Contructor simple:
    MouTe() {
    oscP5Box = new OscP5(this,7001);
    oscP5Silh = new OscP5(this,7002);
    oscP5Cells = new OscP5(this,7003);
    oscP5TotalCells = new OscP5(this,7004);
  }

  ////////////////////////////////////////////////
  //////// OSC
  /////////////////////////////////////////////

  //Aquí rebem els missatges OSC i els associem a les arrays i variables creades 

  //  void gotOSC(OscMessage theOscMessage) {
  void oscEvent(OscMessage theOscMessage) {

    /* print the address pattern and the typetag of the received OscMessage */
    //print(" addrpattern: "+theOscMessage.addrPattern());
    //println(" typetag: "+theOscMessage.typetag());
    if(theOscMessage.checkAddrPattern("/box")) {
      //guardamos los valores de la caja contenedora en el array
      for (int i = 0; i < 4; i++) {
        cC[i] = theOscMessage.get(i).intValue();
        // if(i<2)println(theOscMessage.get(i).intValue());
      }
    } 
    else if (theOscMessage.checkAddrPattern("/act")) {
      totalActives = theOscMessage.get(0).intValue();
    } 
    else if (theOscMessage.checkAddrPattern("/st")) {

      for (int i = 0; i < 192; i++) {
        cells[i] = theOscMessage.get(i).intValue();
      }
    }
    else if (theOscMessage.checkAddrPattern("/silh")) {
      for (int i = 0; i < 240; i++) {
        //     print(theOscMessage.get(i).intValue());

        silh[i] = theOscMessage.get(i).intValue();
        //        println(silh[i]);
      }
      //       println("______");
    }
  }
  //fi d'OSC


  /////////////////////////////////////////////
  /////////////////////////////////////////////
  /////  FUNCIONS DE DIBUIX:
  /////////////////////////////////////////////
  /////////////////////////////////////////////

  ///////////////////////////////////////////////////////////
  /* Dibuix absolut (160x120): */
  ///////////////////////////////////////////////////////////

  //Dibuix de la caixa contenidora:
  void dibuixaCaixa() {
    rectMode(CORNERS);
    stroke(0,255,0);
    noFill();
    rect(cC[0],cC[1],cC[2],cC[3]);
  }

  //Dibuix del centre de gravetat:
  void dibuixaCentre() {
    noStroke();
    fill(255,0,0);
    ellipse((cC[0]+(cC[2]-cC[0])/2),(cC[1]+(cC[3]-cC[1])/2),3,3);
  }

  //Dibuix de la matriu de les cel·les:
  void dibuixaCelles() {
    rectMode(CORNERS); //indiquem que el metode de dibuix del rectangle es donant-li els vertex de dalt a l esquerra i a baix a la dreta
    fill(255);
    stroke(255);
    for(int i=0; i<16; i++) {
      for(int j=0; j<12; j++) {
        //dibuixem així perquè estem utilitzant rectMode(CORNERS):
        if(cells[i+j*16]==1) {
          rect(i*10,j*10,(i+1)*10-1,(j+1)*10+1);
        }
      }
    }
  }

  //Dibuix de les siluetes:
  void dibuixaSilueta() {
    stroke(#76E9FF);
    for(int i=0; i<240; i+=2) {
      // print(silh[i]);
      if(silh[i]!=-1) {
        line(silh[i],i/2,silh[i+1],i/2);
        //line(silh[i],i/2,silh[i+1],i/2);
      }
    }
  }

  ///////////////////////////////////////////////////////////
  /* Dibuix relatiu (width x height): */
  ///////////////////////////////////////////////////////////

  //Dibuix de la caixa contenidora:
  void dibuixaCaixaRelatiu() {
    rectMode(CORNERS);
    strokeWeight(height/120);
    stroke(0,255,0);
    noFill();
    rect(map(cC[0],0,160,0,width),map(cC[1],0,120,0,height),map(cC[2],0,160,0,width),map(cC[3],0,120,0,height));
    strokeWeight(1);
  }

  //Dibuix del centre de gravetat:
  void dibuixaCentreRelatiu() {
    noStroke();
    fill(255,0,0);
    ellipse(map((cC[0]+(cC[2]-cC[0])/2),0,160,0,width),map((cC[1]+(cC[3]-cC[1])/2),0,120,0,height),map(3,0,160,0,width),map(3,0,120,0,height));
  }

  //Dibuix de la matriu de les cel·les:
  void dibuixaCellesRelatiu() {
    rectMode(CORNERS); //indiquem que el metode de dibuix del rectangle es donant-li els vertex de dalt a l esquerra i a baix a la dreta
    fill(255);
    stroke(255);
    for(int i=0; i<16; i++) {
      for(int j=0; j<12; j++) {
        //dibuixem així perquè estem utilitzant rectMode(CORNERS):
        if(cells[i+j*16]==1) {
          rect(i*map(10,0,160,0,width),j*map(10,0,120,0,height),(i+1)*map(10,0,160,0,width)-1,(j+1)*map(10,0,120,0,height)+1);
        }
      }
    }
  }

  //Dibuix de les siluetes:
  void dibuixaSiluetaRelatiu() {
    stroke(#76E9FF);
    strokeWeight(height/120);
    for(int i=0; i<240; i+=2) {
      // print(silh[i]);
      if(silh[i]!=-1) {
        //line(silh[i],i/2,silh[i+1],i/2);
        line(silh[i]*width/160,(i/2)*height/120,silh[i+1]*width/160,(i/2)*height/120);
      }
    }
    strokeWeight(1);
  }

  void dibuixaSiluetaRelatiuAlpha() {
    stroke(255,236,198,32);
    strokeWeight(height/120);
    for(int i=0; i<240; i+=2) {
      // print(silh[i]);
      if(silh[i]!=-1) {
        //line(silh[i],i/2,silh[i+1],i/2);
        line(silh[i]*width/160,(i/2)*height/120,silh[i+1]*width/160,(i/2)*height/120);
      }
    }
    strokeWeight(1);
  }
  
  //fi de funcions de dibuix

  /////////////////////////////////////////////
  /////////////////////////////////////////////
  /////  FUNCIONS DEL MouTE:
  /////////////////////////////////////////////
  /////////////////////////////////////////////

  /* DADES DIRECTES D'OSC: */

  //Obtenir caixa contenidora:
  int[] getBox() {
    return cC;
  }

  //obtenir array d'activacions:
  int[] getActives() {
    return cells;
  }

  //obtenir el total de cel·les actives:
  int getTotalActives() {
    return totalActives;
  }

  //obtenir array de sil·lueta:
  int[] getSilhouette() {
    return silh;
  }

  ///////////////////////////////////////////////////////////
  //ALTRES FUNCIONS:
  ///////////////////////////////////////////////////////////

  ///////////////////////////////////////////////////////////
  /* CENTRE DE GRAVETAT: */
  ///////////////////////////////////////////////////////////

  //Obtenir la X del centre de gravetat (de 0 a 160):
  float getCenterXAbsolute() {
    return cC[0]+(cC[2]-cC[0])/2;
  }

  //Obtenir la Y del centre de gravetat (de 0 a 120):
  float getCenterYAbsolute() {
    return  cC[1]+(cC[3]-cC[1])/2;
  }

  //Obtenir la X del centre de gravetat (de 0 a 160):
  float getCenterXRelative() {
    float r = map(cC[0]+(cC[2]-cC[0])/2,0,160,0,width);
    return r;
  }

  //Obtenir la Y del centre de gravetat (de 0 a height):
  float getCenterYRelative() {
    float r = map(cC[1]+(cC[3]-cC[1])/2,0,120,0,height);
    return r;
  }

  ///////////////////////////////////////////////////////////
  /* CAIXA CONTENIDORA*/
  ///////////////////////////////////////////////////////////

  //Obtenir la X esquerra de la caixa(de 0 a 160):
  int getLeftXBox() {
    return cC[0];
  }

  //Obtenir la X dreta de la caixa(de 0 a 160):
  int getRightXBox() {
    return cC[2];
  }

  //Obtenir la X esquerra de la caixa(de 0 a 160):
  int getUpperYBox() {
    return cC[1];
  }

  //Obtenir la X esquerra de la caixa(de 0 a 120):
  int getLowerYBox() {
    return cC[3];
  }

  ///////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////

  //Obtenir la X esquerra de la caixa(de 0 a width):
  float getLeftXBoxRelative() {
    float r = map(cC[0],0,160,0,width);
    return r;
  }

  //Obtenir la X dreta de la caixa(de 0 a width):
  float getRightXBoxRelative() {
    float r = map(cC[2],0,160,0,width);
    return r;
  }

  //Obtenir la X esquerra de la caixa(de 0 a height):
  float getUpperYBoxRelative() {
    float r = map(cC[1],0,120,0,height);
    return r;
  }

  //Obtenir la X esquerra de la caixa(de 0 a height):
  float getLowerYBoxRelative() {
    float r = map(cC[3],0,120,0,height);
    return r;
  }

  /////////////////////////////////////////////
  
  //Cel·la de matriu d'activacions
  
  boolean getMatrixCoord(int _x, int _y){
    int value = cells[(_y*16)+_x];
    if(value==1)return true;
    else return false;
  }
  /////////////////////////////////////////////
  /////////////////////////////////////////////
  /////////////////////////////////////////////
}



