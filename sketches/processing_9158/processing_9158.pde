
class Alwache {

  PImage bg;
  PImage al1;
  PImage al2;

  float x;
  float a;
  float b;
  float y;
  float yy;



  int posxa, posya;      

  int speedw; 
  int richtung =1;  // Diameter of rect
  color c,hoch,runter,rechts,links;//Wegkontrolle
  float r;

  float geschwindigkeit = -1;
  float geschwindigkeit2 = 1;

  Alwache(int x1,int y2,int speedy)
  {

    posxa = x1;
    posya = y2;

    y=0;
    yy=5;
    x = 0;

    speedw=speedy;

    bg = loadImage("lvl1.jpg");//laden des levels(bildes)
    //jeweils um zu sehen ob der nächste Schritt ins weiße geht oder nicht

    al1 = loadImage("al1.png");
    al2 = loadImage("al2.png");
    noStroke();
  }

  void move()
  {
    a=posxa;
    b=posya-30;
    image(al1,posxa+x-15, posya+y-27); 
    if (y==-4) {

      geschwindigkeit = geschwindigkeit * -1;

    }

    if (y==+4) {

      geschwindigkeit = geschwindigkeit * -1;

    }
    image(al2,posxa+x-15, posya+yy);
    if (yy==-20) {

      geschwindigkeit2 = geschwindigkeit2 * -1;

    }

    if (yy==10) {

      geschwindigkeit2 = geschwindigkeit2 * -1;

    }

    color hoch = bg.get (posxa, posya-1*speedw);
    color runter = bg.get (posxa, posya +1*speedw);
    color rechts = bg.get (posxa+1*speedw, posya);
    color links = bg.get (posxa-1*speedw, posya);
    //println("hoch: " + hoch +"runter: " + runter +"links: " + links +"rechts: " + rechts ); 
    //println(richtung);

 
    if( hoch>=-460000.0 && richtung==1){       //Bewegung nur wenn Ziel weiße farbe ist (-10 ist mit toleranz -1 würde eigtl auch reichen aber sicher ist sicher
      posya-=1 *speedw;    

    }
    else if(runter>=-460000.0&& richtung==2){
      posya+=1 *speedw;

    }
    else if (links>=-460000.0 && richtung==3){
      posxa-=1 *speedw;

    }
    else if (rechts>=-460000.0 && richtung==4){
      posxa+=1 *speedw;

    }   
    else { 
      r = random(1,4);
      richtung = round(r);

    }
    y = y+ geschwindigkeit;
    yy=yy+ -geschwindigkeit;

  }
}




