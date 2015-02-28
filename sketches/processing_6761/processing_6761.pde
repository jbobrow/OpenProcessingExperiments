
import fisica.*;
import krister.Ess.*;

FWorld world;

FBody grabbedBody;
FMouseJoint mouseJoint;
//Cub d'usuari
MyBox myBox, SegonCub;
//Superfície i Bordes
FBox myBox1, myBox2, BordeEsquerra, BordeDret, Sostre;
//Botons per augment de quantitat de material //per canvi de material dels cubs //per canvi de superficie //per canvi de gravetat
FBox Augment1, Numero, Reduccio1, Augment2, Augment3, Material, Material2, Reduccio2, Reduccio3, Superficie1, Superficie2, Caiguda1, Caiguda2, Ratoli, Teclat;

boolean[] keyIsPressed = new boolean[512];
boolean[] keyIsReleased = new boolean[512];
boolean exists = false;
boolean pressed = false;
boolean caigudalliure = false;
boolean fusta = true;
boolean fusta2 = false;
boolean platejat = false;
boolean friction = false;
boolean mouse = true;
boolean segoncub = false;
float forceY, forceY2, forceX, forceX2;

/////////cubs contra taula/////////
AudioChannel impacte10, impacte09, impacte08, impacte07, impacte06, impacte05, impacte04, impacte03, impacte02, impacte01;
AudioChannel canto10, canto09, canto08, canto07, canto06, canto05, canto04, canto03;
AudioChannel metall10, metall09, metall08, metall07, metall06, metall05, metall04, metall03, metall02, metall01;
AudioChannel cantometall10, cantometall09, cantometall08, cantometall07, cantometall06, cantometall05, cantometall04, cantometall03, cantometall02, cantometall01;
AudioChannel metallpla10, metallpla09, metallpla08, metallpla07, metallpla06, metallpla05, metallpla04, metallpla03, metallpla02, metallpla01;
AudioChannel metallcanto10, metallcanto09, metallcanto08, metallcanto07, metallcanto06, metallcanto05, metallcanto04, metallcanto03, metallcanto02, metallcanto01;
AudioChannel fustapla10, fustapla09, fustapla08, fustapla07, fustapla06, fustapla05, fustapla04, fustapla03, fustapla02, fustapla01;
AudioChannel fustacanto10, fustacanto09, fustacanto08, fustacanto07, fustacanto06, fustacanto05, fustacanto04, fustacanto03, fustacanto02, fustacanto01;
////////fregaments////////////
AudioChannel scratch, scratch2, scratchCanto, scratchCanto2, scratchmetall, scratchmetall2, scratchmetallCanto, scratchmetallCanto2; 
AudioChannel Mscratch, Mscratch2, MscratchCanto, MscratchCanto2, Mscratchfusta, Mscratchfusta2, MscratchfustaCanto, MscratchfustaCanto2;
/////////cub contra cub//////////
AudioChannel FustaFusta10, FustaFusta09, FustaFusta08, FustaFusta07, FustaFusta06, FustaFusta05, FustaFusta04, FustaFusta03, FustaFusta02, FustaFusta01;
AudioChannel MetallMetall10, MetallMetall09, MetallMetall08, MetallMetall07, MetallMetall06, MetallMetall05, MetallMetall04, MetallMetall03, MetallMetall02, MetallMetall01;
AudioChannel MetallFusta10, MetallFusta09, MetallFusta08, MetallFusta07, MetallFusta06, MetallFusta05, MetallFusta04, MetallFusta03, MetallFusta02, MetallFusta01;
AudioChannel fustascratchfusta, fustascratchmetall, metallscratchmetall;

PImage a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab;

void setup(){
  frameRate (30);
  size (900,620);

  Fisica.init(this);
  world = new FWorld ();
  world.setGravity (0,400);
  Ess.start(this);
  Load();
  Mundo();
  Butons();
}

void play(AudioChannel channel){
  channel.play();
}

void draw(){
  background (255,255,255);
  world.draw(this);
  world.step();
  Procediments();
  if (mouse==false){
    checkKey();
  }
}

void Procediments(){
  Impactes();
  ProButons();
}

void Impactes(){
  ImpactesCub1();
  ImpactesCub2();
  forceY = abs(myBox.getVelocityY());
  forceX = abs(myBox.getVelocityX());
  if (exists) {
    forceY2 = abs(SegonCub.getVelocityY());
    forceX2 = abs(SegonCub.getVelocityX());
  }
}

void ImpactesCub1(){

  if (myBox.startedTouching(myBox1)) {  
    /////////////////////////////TAULA////////////DE////////////FUSTA/////////////////////////////////
    //println(forceY);
    if (platejat==false){
      //////////////////////////////////////////////////////////////////////////////////////////////////
      ///////////////////////////////////////////FUSTA PLA//////////////////////////////////////////////////       
      if (forceY>=780 && myBox.getY() < 422 && myBox.getY() > 410&& fusta==true) {
        play(impacte10);
      }
      if ((forceY>=700)&&(forceY<780)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==true) {
        play(impacte09  );
      }
      if ((forceY>=620)&&(forceY<700)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==true) {
        play(impacte08  );
      }
      if ((forceY>=540)&&(forceY<620)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==true) {
        play(impacte07  );
      }
      if ((forceY>=410)&&(forceY<540)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==true ) {
        play(impacte06  );
      }
      if ((forceY>=330)&&(forceY<410)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==true ) {
        play(impacte05  );
      }
      if ((forceY>=200)&&(forceY<330)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==true ) {
        play(impacte04  );
      }
      if ((forceY>=100)&&(forceY<200)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==true ) {
        play(impacte03  );
      }
      if ((forceY>=50)&&(forceY<100)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==true ) {
        play(impacte02  );
      }
      if ((forceY>=5)&&(forceY<50) && myBox.getY() < 422 && myBox.getY() > 410&& fusta==true) {
        play(impacte01  );
      }
      //////////////////////////////////////////CANTO//FUSTA///////////////////////////////////////////////////
      if (forceY>=780 && myBox.getY() <=410&& fusta==true) {
        play(canto10  );
      }
      if ((forceY>=650)&&(forceY<780)&& myBox.getY() <=410&& fusta==true) {
        play(canto09  );
      }
      if ((forceY>=550)&&(forceY<650)&& myBox.getY() <=410&& fusta==true) {
        play(canto08  );
      }
      if ((forceY>=460)&&(forceY<550)&& myBox.getY() <=410&& fusta==true) {
        play(canto07  );
      }
      if ((forceY>=350)&&(forceY<460)&& myBox.getY() <=410&& fusta==true) {
        play(canto06  );
      }
      if ((forceY>=160)&&(forceY<350)&& myBox.getY() <=410&& fusta==true) {
        play(canto05  );
      }
      if ((forceY>=30)&&(forceY<160)&& myBox.getY() <=410&& fusta==true) {
        play(canto04  );
      }
      if ((forceY>=3)&&(forceY<30)&& myBox.getY() <=410&& fusta==true) {
        play(canto03  );
      }
      //////////////////////////////////////////////////////////////////////////////////////////////////
      ///////////////////////////////////////////METALL PLA//////////////////////////////////////////////////
      if (forceY>=780 && myBox.getY() < 422 && myBox.getY() > 410&& fusta==false) {
        play(metall08  );
      }
      if ((forceY>=650)&&(forceY<780)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==false) {
        play(metall07  );
      }
      if ((forceY>=570)&&(forceY<650)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==false) {
        play(metall06  );
      }
      if ((forceY>=420)&&(forceY<570)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==false) {
        play(metall05  );
      }
      if ((forceY>=300)&&(forceY<420)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==false) {
        play(metall04  );
      }
      if ((forceY>=180)&&(forceY<300)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==false) {
        play(metall03  );
      }
      if ((forceY>=50)&&(forceY<180)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==false) {
        play(metall02  );
      }
      if ((forceY>=0.5)&&(forceY<50)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==false) {
        play(metall01  );
      }
      /////////////////////////////////////////CANTO//METALL///////////////////////////////////////////////
      if (forceY>=780 && myBox.getY() <=410&& fusta==false) {
        play(cantometall10  );
      }
      if ((forceY>=700)&&(forceY<780)&& myBox.getY() <=410&& fusta==false) {
        play(cantometall09  );
      }
      if ((forceY>=620)&&(forceY<700)&& myBox.getY() <=410&& fusta==false) {
        play(cantometall08  );
      }
      if ((forceY>=540)&&(forceY<620)&& myBox.getY() <=410&& fusta==false) {
        play(cantometall07  );
      }
      if ((forceY>=410)&&(forceY<540)&& myBox.getY() <=410&& fusta==false) {
        play(cantometall06  );
      }
      if ((forceY>=330)&&(forceY<410)&& myBox.getY() <=410&& fusta==false) {
        play(cantometall05  );
      }
      if ((forceY>=200)&&(forceY<330)&& myBox.getY() <=410&& fusta==false) {
        play(cantometall04  );
      }
      if ((forceY>=100)&&(forceY<200)&& myBox.getY() <=410&& fusta==false) {
        play(cantometall03  );
      }
      if ((forceY>=50)&&(forceY<100)&& myBox.getY() <=410&& fusta==false) {
        play(cantometall02  );
      }
      if ((forceY>=0.5)&&(forceY<50) && myBox.getY() <=410 && fusta==false) {
        play(cantometall01  );
      }
    }
    /////////////////////////////TAULA////////////DE////////////METALL/////////////////////////////////
    if (platejat==true){
      //////////////////////////////////////////////////////////////////////////////////////////////////
      ///////////////////////////////////////////METALL PLA//////////////////////////////////////////////////
      if (forceY>=780 && myBox.getY() < 422 && myBox.getY() > 410&& fusta==false) {
        play(metallpla10  );
      }
      if ((forceY>=700)&&(forceY<780)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==false) {
        play(metallpla09  );
      }
      if ((forceY>=620)&&(forceY<700)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==false) {
        play(metallpla08  );
      }
      if ((forceY>=540)&&(forceY<620)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==false) {
        play(metallpla07  );
      }
      if ((forceY>=410)&&(forceY<540)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==false ) {
        play(metallpla06  );
      }
      if ((forceY>=330)&&(forceY<410)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==false ) {
        play(metallpla05  );
      }
      if ((forceY>=200)&&(forceY<330)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==false ) {
        play(metallpla04  );
      }
      if ((forceY>=100)&&(forceY<200)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==false ) {
        play(metallpla03  );
      }
      if ((forceY>=50)&&(forceY<100)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==false ) {
        play(metallpla02  );
      }
      if ((forceY>=1)&&(forceY<50) && myBox.getY() < 422 && myBox.getY() > 410&& fusta==false) {
        play(metallpla01  );
      } 
      ///////////////////////////////////////////METALL CANTO//////////////////////////////////////////////////
      if (forceY>=780&& myBox.getY() <=410&& fusta==false) {
        play(metallcanto10  );
      }
      if ((forceY>=700)&&(forceY<780)&& myBox.getY() <=410&& fusta==false) {
        play(metallcanto09  );
      }
      if ((forceY>=620)&&(forceY<700)&& myBox.getY() <=410&& fusta==false) {
        play(metallcanto08  );
      }
      if ((forceY>=540)&&(forceY<620)&& myBox.getY() <=410&& fusta==false) {
        play(metallcanto07  );
      }
      if ((forceY>=410)&&(forceY<540)&& myBox.getY() <=410&& fusta==false ) {
        play(metallcanto06  );
      }
      if ((forceY>=330)&&(forceY<410)&& myBox.getY() <=410&& fusta==false ) {
        play(metallcanto05  );
      }
      if ((forceY>=200)&&(forceY<330)&& myBox.getY() <=410&& fusta==false ) {
        play(metallcanto04  );
      }
      if ((forceY>=100)&&(forceY<200)&& myBox.getY() <=410&& fusta==false ) {
        play(metallcanto03  );
      }
      if ((forceY>=50)&&(forceY<100)&& myBox.getY() <=410&& fusta==false ) {
        play(metallcanto02  );
      }
      if ((forceY>=1)&&(forceY<50) && myBox.getY() <=410&& fusta==false) {
        play(metallcanto01  );
      }  
      //////////////////////////////////////////////////////////////////////////////////////////////////
      ///////////////////////////////////////////FUSTA PLA//////////////////////////////////////////////////
      if (forceY>=780 && myBox.getY() < 422 && myBox.getY() > 410&& fusta==true) {
        play(fustapla10  );
      }
      if ((forceY>=700)&&(forceY<780)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==true) {
        play(fustapla09  );
      }
      if ((forceY>=620)&&(forceY<700)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==true) {
        play(fustapla08  );
      }
      if ((forceY>=540)&&(forceY<620)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==true) {
        play(fustapla07  );
      }
      if ((forceY>=410)&&(forceY<540)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==true ) {
        play(fustapla06  );
      }
      if ((forceY>=330)&&(forceY<410)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==true ) {
        play(fustapla05  );
      }
      if ((forceY>=200)&&(forceY<330)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==true ) {
        play(fustapla04  );
      }
      if ((forceY>=100)&&(forceY<200)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==true ) {
        play(fustapla03  );
      }
      if ((forceY>=50)&&(forceY<100)&& myBox.getY() < 422 && myBox.getY() > 410&& fusta==true ) {
        play(fustapla02  );
      }
      if ((forceY>=1)&&(forceY<50) && myBox.getY() < 422 && myBox.getY() > 410&& fusta==true) {
        play(fustapla01  );
      }
      ///////////////////////////////////////////FUSTA CANTO//////////////////////////////////////////////////
      if (forceY>=780 && myBox.getY() <=410&& fusta==true) {
        play(fustacanto10  );
      }
      if ((forceY>=700)&&(forceY<780)&& myBox.getY() <=410&& fusta==true) {
        play(fustacanto09  );
      }
      if ((forceY>=620)&&(forceY<700)&& myBox.getY() <=410&& fusta==true) {
        play(fustacanto08  );
      }
      if ((forceY>=540)&&(forceY<620)&& myBox.getY() <=410&& fusta==true) {
        play(fustacanto07  );
      }
      if ((forceY>=410)&&(forceY<540)&& myBox.getY() <=410&& fusta==true ) {
        play(fustacanto06  );
      }
      if ((forceY>=330)&&(forceY<410)&& myBox.getY() <=410&& fusta==true ) {
        play(fustacanto05  );
      }
      if ((forceY>=200)&&(forceY<330)&& myBox.getY() <=410&& fusta==true ) {
        play(fustacanto04  );
      }
      if ((forceY>=100)&&(forceY<200)&& myBox.getY() <=410&& fusta==true ) {
        play(fustacanto03  );
      }
      if ((forceY>=50)&&(forceY<100)&& myBox.getY() <=410&& fusta==true ) {
        play(fustacanto02  );
      }
      if ((forceY>=1)&&(forceY<50) && myBox.getY() <=410&& fusta==true) {
        play(fustacanto01  );
      }
    }
  }
}

void ImpactesCub2(){
  if (exists) {
    if (SegonCub.startedTouching(myBox1)) {  
      /////////////////////////////TAULA////////////DE////////////FUSTA/////////////////////////////////
      if (platejat==false){
        //////////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////FUSTA PLA//////////////////////////////////////////////////
        if (forceY2>=780 && SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==true) {
          play(impacte10);
        }
        if ((forceY2>=700)&&(forceY2<780)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==true) {
          play(impacte09  );
        }
        if ((forceY2>=620)&&(forceY2<700)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==true) {
          play(impacte08  );
        }
        if ((forceY2>=540)&&(forceY2<620)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==true) {
          play(impacte07  );
        }
        if ((forceY2>=410)&&(forceY2<540)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==true) {
          play(impacte06  );
        }
        if ((forceY2>=330)&&(forceY2<410)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==true) {
          play(impacte05  );
        }
        if ((forceY2>=200)&&(forceY2<330)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==true) {
          play(impacte04  );
        }
        if ((forceY2>=100)&&(forceY2<200)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==true) {
          play(impacte03  );
        }
        if ((forceY2>=50)&&(forceY2<100)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==true) {
          play(impacte02  );
        }
        if ((forceY2>=0.5)&&(forceY2<50)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==true) {
          play(impacte01  );
        }
        //////////////////////////////////////////CANTO//FUSTA///////////////////////////////////////////////////
        if (forceY2>=780 && SegonCub.getY() <=410&& fusta2==true) {
          play (canto10  );
        }
        if ((forceY2>=650)&&(forceY2<780)&& SegonCub.getY() <=410&& fusta2==true) {
          play (canto09  );
        }
        if ((forceY2>=550)&&(forceY2<650)&& SegonCub.getY() <=410&& fusta2==true) {
          play (canto08  );
        }
        if ((forceY2>=460)&&(forceY2<550)&& SegonCub.getY() <=410&& fusta2==true) {
          play (canto07  );
        }
        if ((forceY2>=350)&&(forceY2<460)&& SegonCub.getY() <=410&& fusta2==true) {
          play (canto06  );
        }
        if ((forceY2>=160)&&(forceY2<350)&& SegonCub.getY() <=410&& fusta2==true) {
          play (canto05  );
        }
        if ((forceY2>=30)&&(forceY2<160)&& SegonCub.getY() <=410&& fusta2==true) {
          play (canto04  );
        }
        if ((forceY2>=0.5)&&(forceY2<30)&& SegonCub.getY() <=410&& fusta2==true) {
          play (canto03  );
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////METALL//////////////////////////////////////////////////
        if (forceY2>=780 && SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==false) {
          play (metall08  );
        }
        if ((forceY2>=650)&&(forceY2<780)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==false) {
          play (metall07  );
        }
        if ((forceY2>=570)&&(forceY2<650)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==false) {
          play (metall06  );
        }
        if ((forceY2>=420)&&(forceY2<570)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==false) {
          play (metall05  );
        }
        if ((forceY2>=300)&&(forceY2<420)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==false) {
          play (metall04  );
        }
        if ((forceY2>=180)&&(forceY2<300)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==false) {
          play (metall03  );
        }
        if ((forceY2>=50)&&(forceY2<180)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==false) {
          play (metall02  );
        }
        if ((forceY2>=0.5)&&(forceY2<50)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==false) {
          play (metall01  );
        }
        /////////////////////////////////////////CANTO//METALL///////////////////////////////////////////////
        if (forceY2>=780 && SegonCub.getY() <=410&& fusta2==false) {
          play (cantometall10  );
        }
        if ((forceY2>=700)&&(forceY2<780)&& SegonCub.getY() <=410&& fusta2==false) {
          play (cantometall09  );
        }
        if ((forceY2>=620)&&(forceY2<700)&& SegonCub.getY() <=410&& fusta2==false) {
          play (cantometall08  );
        }
        if ((forceY2>=540)&&(forceY2<620)&& SegonCub.getY() <=410&& fusta2==false) {
          play (cantometall07  );
        }
        if ((forceY2>=410)&&(forceY2<540)&& SegonCub.getY() <=410&& fusta2==false) {
          play (cantometall06  );
        }
        if ((forceY2>=330)&&(forceY2<410)&& SegonCub.getY() <=410&& fusta2==false) {
          play (cantometall05  );
        }
        if ((forceY2>=200)&&(forceY2<330)&& SegonCub.getY() <=410&& fusta2==false) {
          play (cantometall04  );
        }
        if ((forceY2>=100)&&(forceY2<200)&& SegonCub.getY() <=410&& fusta2==false) {
          play (cantometall03  );
        }
        if ((forceY2>=50)&&(forceY2<100)&& SegonCub.getY() <=410&& fusta2==false) {
          play (cantometall02  );
        }
        if ((forceY2>=0.5)&&(forceY2<50)&& SegonCub.getY() <=410&& fusta2==false) {
          play (cantometall01  );
        }
      }
      /////////////////////////////TAULA////////////DE////////////METALL/////////////////////////////////
      if (platejat==true){

        //////////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////METALL PLA//////////////////////////////////////////////////
        if (forceY2>=780 && SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta==false) {
          play (metallpla10  );
        }
        if ((forceY2>=700)&&(forceY2<780)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==false) {
          play (metallpla09  );
        }
        if ((forceY2>=620)&&(forceY2<700)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==false) {
          play (metallpla08  );
        }
        if ((forceY2>=540)&&(forceY2<620)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==false) {
          play (metallpla07  );
        }
        if ((forceY2>=410)&&(forceY2<540)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==false ) {
          play (metallpla06  );
        }
        if ((forceY2>=330)&&(forceY2<410)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==false ) {
          play (metallpla05  );
        }
        if ((forceY2>=200)&&(forceY2<330)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==false ) {
          play (metallpla04  );
        }
        if ((forceY2>=100)&&(forceY2<200)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==false ) {
          play (metallpla03  );
        }
        if ((forceY2>=50)&&(forceY2<100)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==false ) {
          play (metallpla02  );
        }
        if ((forceY2>=1)&&(forceY2<50) && SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==false) {
          play (metallpla01  );
        } 
        ///////////////////////////////////////////METALL CANTO//////////////////////////////////////////////////
        if (forceY2>=780&& SegonCub.getY() <=410&& fusta2==false) {
          play (metallcanto10  );
        }
        if ((forceY2>=700)&&(forceY2<780)&& SegonCub.getY() <=410&& fusta2==false) {
          play (metallcanto09  );
        }
        if ((forceY2>=620)&&(forceY2<700)&& SegonCub.getY() <=410&& fusta2==false) {
          play (metallcanto08  );
        }
        if ((forceY2>=540)&&(forceY2<620)&& SegonCub.getY() <=410&& fusta2==false) {
          play (metallcanto07  );
        }
        if ((forceY2>=410)&&(forceY2<540)&& SegonCub.getY() <=410&& fusta2==false ) {
          play (metallcanto06  );
        }
        if ((forceY2>=330)&&(forceY2<410)&& SegonCub.getY() <=410&& fusta2==false ) {
          play (metallcanto05  );
        }
        if ((forceY2>=200)&&(forceY2<330)&& SegonCub.getY() <=410&& fusta2==false ) {
          play (metallcanto04  );
        }
        if ((forceY2>=100)&&(forceY2<200)&& SegonCub.getY() <=410&& fusta2==false ) {
          play (metallcanto03  );
        }
        if ((forceY2>=50)&&(forceY2<100)&& SegonCub.getY() <=410&& fusta2==false ) {
          play (metallcanto02  );
        }
        if ((forceY2>=1)&&(forceY2<50) && SegonCub.getY() <=410&& fusta2==false) {
          play (metallcanto01  );
        }  
        //////////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////FUSTA PLA//////////////////////////////////////////////////
        if (forceY2>=780 && SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==true) {
          play (fustapla10  );
        }
        if ((forceY2>=700)&&(forceY2<780)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==true) {
          play (fustapla09  );
        }
        if ((forceY2>=620)&&(forceY2<700)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==true) {
          play (fustapla08  );
        }
        if ((forceY2>=540)&&(forceY2<620)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==true) {
          play (fustapla07  );
        }
        if ((forceY2>=410)&&(forceY2<540)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==true ) {
          play (fustapla06  );
        }
        if ((forceY2>=330)&&(forceY2<410)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==true ) {
          play (fustapla05  );
        }
        if ((forceY2>=200)&&(forceY2<330)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==true ) {
          play (fustapla04  );
        }
        if ((forceY2>=100)&&(forceY2<200)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==true ) {
          play (fustapla03  );
        }
        if ((forceY2>=50)&&(forceY2<100)&& SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==true ) {
          play (fustapla02  );
        }
        if ((forceY2>=1)&&(forceY2<50) && SegonCub.getY() < 422 && SegonCub.getY() > 410&& fusta2==true) {
          play (fustapla01  );
        } 
        ///////////////////////////////////////////FUSTA CANTO//////////////////////////////////////////////////
        if (forceY2>=780 && SegonCub.getY() <=410&& fusta2==true) {
          play (fustacanto10  );
        }
        if ((forceY2>=700)&&(forceY2<780)&& SegonCub.getY() <=410&& fusta2==true) {
          play (fustacanto09  );
        }
        if ((forceY2>=620)&&(forceY2<700)&& SegonCub.getY() <=410&& fusta2==true) {
          play (fustacanto08  );
        }
        if ((forceY2>=540)&&(forceY2<620)&& SegonCub.getY() <=410&& fusta2==true) {
          play (fustacanto07  );
        }
        if ((forceY2>=410)&&(forceY2<540)&& SegonCub.getY() <=410&& fusta2==true ) {
          play (fustacanto06  );
        }
        if ((forceY2>=330)&&(forceY2<410)&& SegonCub.getY() <=410&& fusta2==true ) {
          play (fustacanto05  );
        }
        if ((forceY2>=200)&&(forceY2<330)&& SegonCub.getY() <=410&& fusta2==true ) {
          play (fustacanto04  );
        }
        if ((forceY2>=100)&&(forceY2<200)&& SegonCub.getY() <=410&& fusta2==true ) {
          play (fustacanto03  );
        }
        if ((forceY2>=50)&&(forceY2<100)&& SegonCub.getY() <=410&& fusta2==true ) {
          play (fustacanto02  );
        }
        if ((forceY2>=1)&&(forceY2<50) && SegonCub.getY() <=410&& fusta2==true) {
          play (fustacanto01  );
        }  
      }
    }
  }
}

void contactStarted(FContact c){
  if (exists&&(((c.getBody1() == myBox) && (c.getBody2() == SegonCub))
    || ((c.getBody2() == myBox) && (c.getBody1() == SegonCub)))){

    float nx = 0;
    float ny = 0;
    float separation = 0;
    float friction = 0;
    float restitution = 0;
    float cx = 0;
    float cy = 0;


    ArrayList contactes = myBox.getContacts();
    for(int i=0; i<contactes.size(); i++){
      FContact c1 = (FContact)contactes.get(i);
      if(c1.getBody1() == SegonCub || c1.getBody2() == SegonCub) {
        cx = c1.getX();
        cy = c1.getY();
        nx = c1.getNormalX();
        ny = c1.getNormalY();

      }
    }       

    PVector n = new PVector(nx, ny); 
    PVector vel1 = new PVector(myBox.getVelocityX(), myBox.getVelocityY());

    PVector vel2 = new PVector(SegonCub.getVelocityX(), SegonCub.getVelocityY());

    vel1.mult(-1);
    vel1.add(vel2);

    float impacte = abs(vel1.dot(n));

    if (fusta==true&&fusta2==true){
      if (impacte>=35000) {
        play(FustaFusta10);
      }
      if ((impacte>=30000)&&(impacte<35000)) {
        play(FustaFusta09);
      }
      if ((impacte>=25000)&&(impacte<30000)) {
        play(FustaFusta08   );
      }
      if ((impacte>=20000)&&(impacte<25000)) {
        play(FustaFusta07   );
      }
      if ((impacte>=15000)&&(impacte<20000)) {
        play(FustaFusta06   );
      }
      if ((impacte>=10000)&&(impacte<15000)) {
        play(FustaFusta05   );
      }
      if ((impacte>=7500)&&(impacte<10000)) {
        play(FustaFusta04   );
      }
      if ((impacte>=5000)&&(impacte<7500)) {
        play(FustaFusta03   );
      }
      if ((impacte>=2500)&&(impacte<5000)) {
        play(FustaFusta02   );
      }
      if ((impacte>=600)&&(impacte<2500)) {
        play(FustaFusta01   );
      }
    }
    if (fusta==false&&fusta2==false){

      if (impacte>=35000) {
        play(MetallMetall10   );
      }
      if ((impacte>=30000)&&(impacte<35000)) {
        play(MetallMetall09   );
      }
      if ((impacte>=25000)&&(impacte<30000)) {
        play(MetallMetall08   );
      }
      if ((impacte>=20000)&&(impacte<25000)) {
        play(MetallMetall07   );
      }
      if ((impacte>=15000)&&(impacte<20000)) {
        play(MetallMetall06   );
      }
      if ((impacte>=10000)&&(impacte<15000)) {
        play(MetallMetall05   );
      }
      if ((impacte>=7500)&&(impacte<10000)) {
        play(MetallMetall04   );
      }
      if ((impacte>=5000)&&(impacte<7500)) {
        play(MetallMetall03   );
      }
      if ((impacte>=1500)&&(impacte<5000)) {
        play(MetallMetall02   );
      }
      if ((impacte>=400)&&(impacte<1500)) {
        play(MetallMetall01   );
      }
    }
    if ((fusta==false&&fusta2==true)||(fusta==true&&fusta2==false)){

      if (impacte>=35000) {
        play(MetallFusta10   );
      }
      if ((impacte>=30000)&&(impacte<35000)) {
        play(MetallFusta09   );
      }
      if ((impacte>=25000)&&(impacte<30000)) {
        play(MetallFusta08   );
      }
      if ((impacte>=20000)&&(impacte<25000)) {
        play(MetallFusta07   );
      }
      if ((impacte>=15000)&&(impacte<20000)) {
        play(MetallFusta06   );
      }
      if ((impacte>=10000)&&(impacte<15000)) {
        play(MetallFusta05   );
      }
      if ((impacte>=7500)&&(impacte<10000)) {
        play(MetallFusta04   );
      }
      if ((impacte>=5000)&&(impacte<7500)) {
        play(MetallFusta03   );
      }
      if ((impacte>=1500)&&(impacte<5000)) {
        play(MetallFusta02   );
      }
      if ((impacte>=400)&&(impacte<1500)) {
        play(MetallFusta01   );
      }
    }
  }
}


void contactEnded(FContact c){
  if (((c.getBody1() == myBox) && (c.getBody2() == myBox1))
    || ((c.getBody2() == myBox) && (c.getBody1() == myBox1))){
    scratch.volume(0);
    scratchCanto.volume(0);
    scratchmetall.volume(0);
    scratchmetallCanto.volume(0);
    Mscratch.volume(0);
    MscratchCanto.volume(0);
    Mscratchfusta.volume(0);
    MscratchfustaCanto.volume(0);    
  } 
  else if (exists && (((c.getBody1() == SegonCub) && (c.getBody2() == myBox1))
    || ((c.getBody2() == SegonCub) && (c.getBody1() == myBox1)))){
    scratch2.volume(0);
    scratchCanto2.volume(0);
    scratchmetall2.volume(0);
    scratchmetallCanto2.volume(0); 
    Mscratch2.volume(0);
    MscratchCanto2.volume(0);
    Mscratchfusta2.volume(0);
    MscratchfustaCanto2.volume(0);   
  }
  if (exists&&(((c.getBody1() == myBox) && (c.getBody2() == SegonCub))
    || ((c.getBody2() == myBox) && (c.getBody1() == SegonCub)))){
    fustascratchfusta.volume(0);
    fustascratchmetall.volume(0);
    metallscratchmetall.volume(0);  
  }
}



void contactPersisted(FContact c){

  if (((c.getBody1() == myBox) && (c.getBody2() == myBox1))
    || ((c.getBody2() == myBox) && (c.getBody1() == myBox1))){
    if (myBox.getY()<422 && myBox.getY()>410){
      if (fusta==true&&platejat==false){
        scratch.play(Ess.FOREVER);
        scratch.smoothPan=true;
        scratch.volume(abs(forceX)/150);
      }
      if (fusta==false&&platejat==false){
        scratchmetall.play(Ess.FOREVER);
        scratchmetall.smoothPan=true;
        scratchmetall.volume(abs(forceX)/150);
      }
      if (fusta==false&&platejat==true){        
        Mscratch.play(Ess.FOREVER);
        Mscratch.smoothPan=true;
        Mscratch.volume(abs(forceX)/150);
      }
      if (fusta==true&&platejat==true){
        Mscratchfusta.play(Ess.FOREVER);
        Mscratchfusta.smoothPan=true;
        Mscratchfusta.volume(abs(forceX)/150);
      }
    }
    if (myBox.getY()<=410){
      if (fusta==true&&platejat==false){        
        scratchCanto.play(Ess.FOREVER);
        scratchCanto.smoothPan=true;
        scratchCanto.volume(abs(forceX)/150);
      }
      if (fusta==false&&platejat==false){        
        scratchmetallCanto.play(Ess.FOREVER);
        scratchmetallCanto.smoothPan=true;
        scratchmetallCanto.volume(abs(forceX)/150);
      }
      if (fusta==false&&platejat==true){        
        MscratchCanto.play(Ess.FOREVER);
        MscratchCanto.smoothPan=true;
        MscratchCanto.volume(abs(forceX)/150);
      }
      if (fusta==true&&platejat==true){       
        MscratchfustaCanto.play(Ess.FOREVER);       
        MscratchfustaCanto.smoothPan=true;
        MscratchfustaCanto.volume(abs(forceX)/150);
      }  
    }
  } 


  if (exists && (((c.getBody1() == SegonCub) && (c.getBody2() == myBox1))
    || ((c.getBody2() == SegonCub) && (c.getBody1() == myBox1)))){ 
    float tx2=SegonCub.getX();
    float newPan2=((tx2-(width/2))/(width/2));

    if (SegonCub.getY()<422 && SegonCub.getY()>410){
      if (fusta2==true&&platejat==false){       
        scratch2.play(Ess.FOREVER);
        scratch2.smoothPan=true;
        scratch2.volume(abs(forceX2)/150);
      }
      if (fusta2==false&&platejat==false){        
        scratchmetall2.play(Ess.FOREVER);
        scratchmetall2.smoothPan=true;
        scratchmetall2.volume(abs(forceX2)/150);
      }
      if (fusta2==false&&platejat==true){        
        Mscratch2.play(Ess.FOREVER);
        Mscratch2.smoothPan=true;
        Mscratch2.volume(abs(forceX2)/150);
      }
      if (fusta2==true&&platejat==true){        
        Mscratchfusta2.play(Ess.FOREVER);
        Mscratchfusta2.smoothPan=true;
        Mscratchfusta2.volume(abs(forceX2)/150);
      }  
    }

    if (SegonCub.getY()<=410){
      if (fusta2==true&&platejat==false){   
        scratchCanto2.play(Ess.FOREVER);
        scratchCanto2.smoothPan=true;
        scratchCanto2.volume(abs(forceX2)/150); 
      }
      if (fusta2==false&&platejat==false){
        scratchmetallCanto2.play(Ess.FOREVER);
        scratchmetallCanto2.smoothPan=true;
        scratchmetallCanto2.volume(abs(forceX2)/150);
      } 
      if (fusta2==false&&platejat==false){
        MscratchCanto2.play(Ess.FOREVER);
        MscratchCanto2.smoothPan=true;
        MscratchCanto2.volume(abs(forceX2)/150); 
      }
      if (fusta2==true&&platejat==false){
        MscratchfustaCanto2.play(Ess.FOREVER);
        MscratchfustaCanto2.smoothPan=true;
        MscratchfustaCanto2.volume(abs(forceX2)/150);
      }   
    }
  }
  if (((c.getBody1() == myBox) && (c.getBody2() == SegonCub))
    || ((c.getBody2() == myBox) && (c.getBody1() == SegonCub))){
    if (fusta==true&&fusta2==true){
      fustascratchfusta.play(Ess.FOREVER);
      fustascratchfusta.smoothPan=true;
      fustascratchfusta.volume(abs(forceX2-forceX)/150);
    }

    if (fusta==true&&fusta2==true){
      fustascratchfusta.play(Ess.FOREVER);
      fustascratchfusta.smoothPan=true;
      fustascratchfusta.volume(abs(forceY2-forceY)/150);
    }

    if (fusta==false&&fusta2==false){
      metallscratchmetall.play(Ess.FOREVER);
      metallscratchmetall.smoothPan=true;
      metallscratchmetall.volume(abs(forceX2-forceX)/150);
    }

    if (fusta==false&&fusta2==false){
      metallscratchmetall.play(Ess.FOREVER);
      metallscratchmetall.smoothPan=true;
      metallscratchmetall.volume(abs(forceY2-forceY)/150);
    }

    if ((fusta2==false&&fusta==true)||(fusta2==true&&fusta==false)){
      fustascratchmetall.play(Ess.FOREVER);
      fustascratchmetall.smoothPan=true;
      fustascratchmetall.volume(abs(forceX2-forceX)/150);
    }
    if ((fusta2==false&&fusta==true)||(fusta2==true&&fusta==false)){
      fustascratchmetall.play(Ess.FOREVER);
      fustascratchmetall.smoothPan=true;
      fustascratchmetall.volume(abs(forceY2-forceY)/150);
    }
  }
}

public void stop() {
  Ess.stop();
  super.stop();
}



























































































































