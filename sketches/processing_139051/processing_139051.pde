
// creHACKtivity workshop
// incontro 04 - esercizio 01

// le variabili che ci servono per ricreare il rettangolo a schermo
// e il suo movimento tramite l'uso della tastiera sono:
int x;        // posizione orizzontale
int y;        // posizione verticale
int w = 20;   // largehzza del rettangolo
int h = 80;   // altezza del rettangolo

int vel = 8;  // offset di movimento (velocità)


/////////////////////////////////////////////////////////////////// SETUP
void setup() {
  size(240, 240);
  smooth();
  
  // inizializzo la posizione in modo tale che il rettngolo,
  // all'avvio del programma, si trovi al centro dello schermo
  rectMode(CENTER);
  x = width/2;
  y = height/2;
  
}


//////////////////////////////////////////////////////////////////// DRAW
void draw() {
  background(0);
  
  checkBounds();
  
  stroke(255);
  fill(255);
  rect(x, y, w, h);
}



//////////////////////////////////////////////////////////// CHECK BOUNDS 
// la funzione check bounds si occupa di verificare la posizione del 
// rettangolo e assicurarsi che questo non finisca fuori dai bordi del
// canvas
void checkBounds() {
  if (y - h/2< 0) 
    y = 0 + h/2;
        
   if (y + h/2> height) 
     y = height - h/2;
  
  if (x - w/2< 0)
    x = 0 + w/2;
         
  if ( x + w/2> width)
    x = width - w/2;
}


///////////////////////////////////////////////////////////// KEY PRESSED 
// la pressione dei pulsanti direzionali fa si' che il rettangolo si 
// sposti nello spazio
void keyPressed() {
  if (key == CODED) {
    switch(keyCode) {
      
      case UP:
      println("freccia SU");
      y = y - vel;
      break;
      
      case DOWN:
      println("freccia GIU'");
      y = y + vel;
      break;
      
      case LEFT:
      println("freccia SINISTRA");
      x = x - vel;
      break;
      
      case RIGHT:
      println("freccia DESTRA");
      x = x + vel;
      break;
      
      default:
      println("non hai premuto un tasto di direzione! riprova.");     
      break;
    }  
  }  
}


