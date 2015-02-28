
/*
primo esperimento Psicologia della Percezione
docente psicologia: Emanuele Arielli
docente programmazione: Davide Rocchesso

studente: Giuseppe Burdo

abstract: considerando la teoria dell'opponenza cromatica di Hering e le sperimentazioni sugli effetti postumi di colore, 
verificare sperimentalmente se prevale percettivamente uno dei colori tra il blu e giallo, a parità di condizioni fisiche.

*/

Blue myBlue;      // insieme di rettangoli blu
Yellow myYellow;  // insieme di rettangoli gialli
Croce myCroce;    // croce centrale da fissare costantemente
int time;         // temporizzazione per far comparire il quadrato centrale


void setup() {
  size(600,600);
  frameRate (50);

  // Inizializzazione delle classi
  myBlue = new Blue();  // richiama il costruttore del blu
  myYellow = new Yellow (); // richiama il costruttore del giallo
  myCroce = new Croce ();
  time = millis() + 15000;  //determina la temporizzazione

}

void draw() {

  background(255);
  myBlue.move();    // richiama i blocchi blu e giallo in movimento 
  myBlue.display();
  myYellow.move ();
  myYellow.display ();
  myCroce.display ();

  int g = millis();
  
  println("millis = " + millis());  // non indispensabile, ma possibilmente utile allo sperimentatore per verificare il tempo costantemente e poi come strumento di debug
  println("time = " + time);
  
  if (millis() > time) {      // dopo 15 secondi fai comparire il quadrato con la croce al centro
    background (255);
    fill (255);
    rect ((width/2-100),(height/2-100),200,200);
    fill (0);
    rect (width/2-10,height/2-3,20,6);
    rect (width/2-3,height/2-10,6,20);
  }

}

class Yellow { // definisce la classe del giallo

  float xpos, ypos, xspeed;

  Yellow() {   // costruttore del giallo, determina posizione di partenza e direzione

    xpos = width/2;
    ypos = height;
    xspeed = -1;
  }
  void display() {

    noStroke ();  // disegna i rettangoli 

    if (ypos > -4000) {
      for (int y=40; y < 5000; y += 40) {
        stroke (0);
        fill (150+y/20,150+y/20,0,122);
        rect(xpos-100,ypos+y,200,30);
      }
    }
  }

  void move() {     //   direzione e velocità del giallo
    ypos = ypos + xspeed*5;
    if (ypos > height) {
      ypos = 0;
    }
  }
}


class Blue {   // definisce la classe del blu

  float xpos, ypos, xspeed;

  Blue() { // costruttore del blu, determina posizione di partenza e direzione


    xpos = width;
    ypos = height/2;
    xspeed = -1;
  }
  
  void display() {

    noStroke ();  // disegna i rettangoli

    if (xpos < 2000) {
      for (int y=40; y < 4200; y += 40) {
        fill (0,0,150+y/20,122);
        stroke (0);
        rect(xpos+y,ypos-100,30,200); 
      }
      if (xpos < -3400) {
        fill (255);
        rect (width,height,0,0);
      }
    }

  }

  void move() {          //   direzione e velocità del blu
    xpos = xpos + xspeed*5;
    if (xpos > width) {
      xpos = 0;
    }
  }
}


class Croce {          //   disegna la croce al centro fin dall'inizio

  void display () {
    fill (0);
    rect (width/2-10,height/2-3,20,6);
    rect (width/2-3,height/2-10,6,20);
  }
}











