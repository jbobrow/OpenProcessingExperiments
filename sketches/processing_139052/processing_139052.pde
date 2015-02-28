
// creHACKtivity workshop
// incontro 04 - esercizio 02

// dichiaro un 'oggetto' della classe 'Rectangle' e gli do come nome 'pippo'
Rectangle pippo;

/////////////////////////////////////////////////////////////////// SETUP
void setup() {
  size(240, 240);
  smooth();
  rectMode(CENTER);
  
  // chiamo il 'costruttore' dell'oggetto 'pippo'
  // passandogli i 5 parametri per l'inizializzazione
  // 1) posizione iniziale x;
  // 2) posizione iniziale y;
  // 3) velocitÃ  di movimento;
  // 4) larghezza;
  // 5) altezza.
  pippo = new Rectangle(width/2, height/2, 10, 20, 80);
}

//////////////////////////////////////////////////////////////////// DRAW
void draw() {
  background(0);

  // chiamo i metodi checkBounds() e display() dell'oggetto 'pippo'
  // nell'ordine:
  // 1) il metodo 'checkBounds' per il controllo dei bordi
  // 2) per la resa visiva del rettangolo a schermo
  pippo.checkBounds();
  pippo.display();
}


///////////////////////////////////////////////////////////// KEY PRESSED 
void keyPressed() {
  // chiamo il metodo move() dell'oggetto 'pippo' per provvedere al suo movimento
  pippo.move();
  
}
// la classe 'Rectangle' e' stata creata per raccogliere tutte 
// le variabili e le funzioni legate al setup e alla gestione 
// del rettangolo in un unico luogo.
// Una volta creata la classe e' possibile ottenerne delle 'istanze' o 'oggetti'

class Rectangle {
  // i DATI
  int x;
  int y;
  int vel;
  int w;
  int h;
  
  // il COSTRUTTORE
  // questo cotruttore deve essere chiamato nel momento in cui
  // si crei uno o piu' oggetti di tipo'Rectangle'. Il costruttore ,
  // in questo esempio, prende 5 argomenti di tipo intero, che vengono usati per
  // inizializzare le variabili 'x', 'y', 'vel', 'w' e 'h' interne.
  Rectangle(int a, int b, int c, int d, int e) {
    x = a;
    y = b;
    vel = c;
    w = d;
    h = e;    
  }
  
  // le FUNZIONALITA' (METODI)
  // i metodi sono delle funzioni proprie della classe 
  // nel nostro esempio abbiamo bisogno di 3 metodi principali 
  // per assolvere a tutte le necessita' :
  // 1) 'DISPLAY' per mostrare a schermo il rettangolo;
  // 2) 'MOVE' per creare il movimento del rettangolo 
  // 3) 'CHECKBOUNDS' per effettuare il controllo sulla posizione 
  //    e su contorni del riquadro.
  
  // metodo DISPLAY
  void display() { 
    stroke(255);
    fill(255);
    rect(x, y, w, h);    
  }
  
  // metodo MOVE
  void move() {
    if (key == CODED) {
      switch(keyCode) {
        
        case UP:
        //println("SU");
        y = y - vel;
        break;
        
        case DOWN:
        //println("GIU'");
        y = y + vel;
        
        break;
        
        case LEFT:
        //println("SINISTRA");
        x = x - vel;
  
        break;
        
        case RIGHT:
        //println("DESTRA");
        x = x + vel;
  
        break;
        
        default:
        //println("DEFAULT");     
        break;
      }  
    }  
  }
  
  // 3) motodo CHECK BOUNDS
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
  
}


