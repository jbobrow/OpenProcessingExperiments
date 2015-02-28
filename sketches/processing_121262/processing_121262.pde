



float xPos, xVel; 
float yPos, yVel; 
float sz = 20; 

MouTe mt= new MouTe(); //Objecte MouTe
 
void setup(){ 
 size(300,200); 
 xPos = width/2; 
 yPos = height/2; 
 xVel = 40; 
 yVel = 40; 
 smooth(); 
 noStroke(); 
 

} 
 
void draw(){ 
 fill(255,255,0,3); 
 rect(0,0,width,height); 
 
 mt.getCenterXRelative();
 mt.getCenterYRelative();  
 
 actualitzar(); 
 dibuixar(); 
} 
 
void actualitzar(){ 
 
  float distanceX = mt.getCenterXRelative()-xPos; 
  float distanceY = mt.getCenterYRelative()-yPos;
  
 xPos += distanceX/xVel; 
 yPos += distanceY/yVel; 
} 
 
void dibuixar(){ 
 fill(0,16); 
 ellipse(xPos,yPos,sz,sz); 
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
 
 isInsideSilhouette(x, y) //retorna un booleà si en la coordenada especificada en els paràmetres (escalada a width i height) hi ha contacte amb la silueta de l'usuari
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
  OscP5 oscP5Box, oscP5Cells, oscP5TotalCells, oscP5Silh;

  //Constructor amb els ports com a paràmetres:
  MouTe(int _box, int _sil, int _cells, int _total) {
    oscP5Box = new OscP5(this, _box);
    oscP5Silh = new OscP5(this, _sil);
    oscP5Cells = new OscP5(this, _cells);
    oscP5TotalCells = new OscP5(this, _total);
  }

  //Contructor simple:
  MouTe() {
    oscP5Box = new OscP5(this, 7001);
    oscP5Silh = new OscP5(this, 7002);
    oscP5Cells = new OscP5(this, 7003);
    oscP5TotalCells = new OscP5(this, 7004);
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
    if (theOscMessage.checkAddrPattern("/box")) {
      //guardamos los valores de la caja contenedora en el array
      for (int i = 0; i < 4; i++) {
        cC[i] = theOscMessage.get(i).intValue();
        // if(i<2)println(theOscMessage.get(i).intValue());
      }
    } else if (theOscMessage.checkAddrPattern("/act")) {
      totalActives = theOscMessage.get(0).intValue();
    } else if (theOscMessage.checkAddrPattern("/st")) {

      for (int i = 0; i < 192; i++) {
        cells[i] = theOscMessage.get(i).intValue();
      }
    } else if (theOscMessage.checkAddrPattern("/silh")) {
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
    stroke(0, 255, 0);
    noFill();
    rect(cC[0], cC[1], cC[2], cC[3]);
  }

  //Dibuix del centre de gravetat:
  void dibuixaCentre() {
    noStroke();
    fill(255, 0, 0);
    ellipse((cC[0]+(cC[2]-cC[0])/2), (cC[1]+(cC[3]-cC[1])/2), 3, 3);
  }

  //Dibuix de la matriu de les cel·les:
  void dibuixaCelles() {
    rectMode(CORNERS); //indiquem que el metode de dibuix del rectangle es donant-li els vertex de dalt a l esquerra i a baix a la dreta
    fill(255);
    stroke(255);
    for (int i=0; i<16; i++) {
      for (int j=0; j<12; j++) {
        //dibuixem així perquè estem utilitzant rectMode(CORNERS):
        if (cells[i+j*16]==1) {
          rect(i*10, j*10, (i+1)*10-1, (j+1)*10+1);
        }
      }
    }
  }

  //Dibuix de les siluetes:
  void dibuixaSilueta() {
    stroke(#76E9FF);
    for (int i=0; i<240; i+=2) {
      // print(silh[i]);
      if (silh[i]!=-1) {
        line(silh[i], i/2, silh[i+1], i/2);
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
    stroke(0, 255, 0);
    noFill();
    rect(map(cC[0], 0, 160, 0, width), map(cC[1], 0, 120, 0, height), map(cC[2], 0, 160, 0, width), map(cC[3], 0, 120, 0, height));
    strokeWeight(1);
  }

  //Dibuix del centre de gravetat:
  void dibuixaCentreRelatiu() {
    noStroke();
    fill(255, 0, 0);
    ellipse(map((cC[0]+(cC[2]-cC[0])/2), 0, 160, 0, width), map((cC[1]+(cC[3]-cC[1])/2), 0, 120, 0, height), map(3, 0, 160, 0, width), map(3, 0, 120, 0, height));
  }

  //Dibuix de la matriu de les cel·les:
  void dibuixaCellesRelatiu() {
    rectMode(CORNERS); //indiquem que el metode de dibuix del rectangle es donant-li els vertex de dalt a l esquerra i a baix a la dreta
    fill(255);
    stroke(255);
    for (int i=0; i<16; i++) {
      for (int j=0; j<12; j++) {
        //dibuixem així perquè estem utilitzant rectMode(CORNERS):
        if (cells[i+j*16]==1) {
          rect(i*map(10, 0, 160, 0, width), j*map(10, 0, 120, 0, height), (i+1)*map(10, 0, 160, 0, width)-1, (j+1)*map(10, 0, 120, 0, height)+1);
        }
      }
    }
    rectMode(CORNER);
  }

  //Dibuix de les siluetes:
  void dibuixaSiluetaRelatiu() {
    stroke(#76E9FF);
    strokeWeight(height/120);
    for (int i=0; i<240; i+=2) {
      // print(silh[i]);
      if (silh[i]!=-1) {
        //line(silh[i],i/2,silh[i+1],i/2);
        line(silh[i]*width/160, (i/2)*height/120, silh[i+1]*width/160, (i/2)*height/120);
      }
    }
    strokeWeight(1);
  }

  void dibuixaSiluetaRelatiuAlpha() {
    stroke(255, 236, 198, 32);
    strokeWeight(height/120);
    for (int i=0; i<240; i+=2) {
      // print(silh[i]);
      if (silh[i]!=-1) {
        //line(silh[i],i/2,silh[i+1],i/2);
        line(silh[i]*width/160, (i/2)*height/120, silh[i+1]*width/160, (i/2)*height/120);
      }
    }
    strokeWeight(1);
  }

  void dibuixaSiluetaRelatiuMillorat() {

    noStroke();  
    fill(255, 0, 0, 127);
    int interval = 12; //ha de ser múliple de 2 y entre 2 y 238
    beginShape();
    int firstWithSilh = -1;
    boolean notYet = true;

    for (int i=239; i>0; i-=interval) {
      if (notYet) {
        if (silh[i]!=-1) {
          firstWithSilh = i;
        }      
        notYet = false;
      }
    }

    if (firstWithSilh !=-1) {
      curveVertex(silh[firstWithSilh]*width/160, (239/2)*height/120);//LEFT
    }

    for (int i=238; i>0; i-=interval) {
      if (mt.silh[i]!=-1) {
        curveVertex(silh[i+1]*width/160, (i/2)*height/120);//LEFT
      }
    }
    for (int i=0; i<240; i+=interval) {
      if (mt.silh[i]!=-1) {
        curveVertex(silh[i]*width/160, (i/2)*height/120);
      }
    }

    for (int i=0; i<240; i+=interval) {
    }

    if (firstWithSilh !=-1) {
      curveVertex(silh[firstWithSilh]*width/160, (239/2)*height/120);//LEFT
      curveVertex(silh[firstWithSilh]*width/160, (239/2)*height/120);//LEFT
    }
    endShape(CLOSE);
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
    float r = map(cC[0]+(cC[2]-cC[0])/2, 0, 160, 0, width);
    return r;
  }

  //Obtenir la Y del centre de gravetat (de 0 a height):
  float getCenterYRelative() {
    float r = map(cC[1]+(cC[3]-cC[1])/2, 0, 120, 0, height);
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
    float r = map(cC[0], 0, 160, 0, width);
    return r;
  }

  //Obtenir la X dreta de la caixa(de 0 a width):
  float getRightXBoxRelative() {
    float r = map(cC[2], 0, 160, 0, width);
    return r;
  }

  //Obtenir la X esquerra de la caixa(de 0 a height):
  float getUpperYBoxRelative() {
    float r = map(cC[1], 0, 120, 0, height);
    return r;
  }

  //Obtenir la X esquerra de la caixa(de 0 a height):
  float getLowerYBoxRelative() {
    float r = map(cC[3], 0, 120, 0, height);
    return r;
  }

  /////////////////////////////////////////////

  //Cel·la de matriu d'activacions

  boolean getMatrixCoord(int _x, int _y) {
    int value = cells[(_y*16)+_x];
    if (value==1)return true; else return false;
  }
  /////////////////////////////////////////////

  boolean isInsideSilhouette(float _x, float _y) {
    _x = constrain(_x, 0, width);
    _y = constrain(_y, 0, height);

    int indexToCheck = int(map(_y, 0, height, 0, 119));
    //indexToCheck = constrain(indexToCheck,0,119);
    int xToCheck = mt.silh[indexToCheck*2];//RIGHT!
    int x2ToCheck = mt.silh[indexToCheck*2+1];//LEFT!

    xToCheck = int(map(xToCheck, 0, 159, 0, width));
    x2ToCheck = int(map(x2ToCheck, 0, 159, 0, width));

    if (_x < xToCheck && _x > x2ToCheck) { 
      return true;
    } else {
      return false;
    }
  }


  /////////////////////////////////////////////
  /////////////////////////////////////////////
}



