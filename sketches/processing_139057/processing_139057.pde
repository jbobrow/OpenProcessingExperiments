
// creHACKtivity workshop
// incontro 04 - esercizio 04

// dichiaro due 'oggetti' della classe 'Rectangle'
Rectangle r1, r2;

// il font 'f' ci servirà per mostrare a schermo le istruzioni
PFont f;

/////////////////////////////////////////////////////////////////// SETUP
void setup() {
  size(240, 240);
  smooth();
  rectMode(CENTER);
  
  // chiamo il 'costruttore' deper i 2 oggett i di tipo 'Rectangle'
  // passandogli i 6 parametri per l'inizializzazione
  // 1) posizione iniziale x;
  // 2) posizione iniziale y;
  // 3) velocità di movimento;
  // 4) larghezza;
  // 5) altezza;
  // 6) numero del giocatore.
  r1 = new Rectangle(width - 20, height/2, 10, 20, 40, 1);
  r2 = new Rectangle(        20, height/2, 10, 20, 40, 2);
  
  f = createFont("Courier", 72, true);
}

//////////////////////////////////////////////////////////////////// DRAW
void draw() {
  background(0);

  // chiamo i metodi checkBounds() e display() degli oggetti 'r1' e 'r2'
  // nell'ordine:
  // 1) il metodo 'checkBounds' per il controllo dei bordi
  // 2) per la resa visiva del rettangolo a schermo
  r1.checkBounds();
  r2.checkBounds();
  r1.display();
  r2.display();
  
  // uso il font 'f' per mostrare a schermo le istruzioni del gioco
  textFont(f);
  textSize(12);
  textAlign(LEFT);
  fill(255);
  text("giocatore 1: premi i pulsanti \nFRECCIA SU e FRECCIA GIU' per \nmuovere il rettangolo 'rosso'", 10, 10);
  text("giocatore 2: premi i pulsanti \n'w' e 's' per muovere il \nrettangolo 'verde'", 10, height-35);
}


///////////////////////////////////////////////////////////// KEY PRESSED 
void keyPressed() {
  // chiamo il metodo move() degli oggetti per provvedere al loro movimento
  r1.move();
  r2.move();
}
class Rectangle {
  // le VARIABILI
  int x;
  int y;
  int vel;
  int w;
  int h;
  int playerNumber;
  
  // il COSTRUTTORE
  Rectangle(int a, int b, int c, int d, int e, int f) {
    x = a;
    y = b;
    vel = c;
    w = d;
    h = e;  
    playerNumber = f;  
  }
  
  // i METODI  
  // metodo DISPLAY
  void display() { 
    // introduco un controllo sul numero del giocatore per 
    // disegnare il rettangol di due diversi colori
    if (playerNumber == 1) {
      // rosso
      stroke(255, 0, 0);
      fill(255, 0, 0);
    } else if (playerNumber == 2) {
      // verde
      stroke(0, 255, 0);
      fill(0, 255, 0);
    }
    rect(x, y, w, h);    
  }
  
  // metodo MOVE
  void move() {
    // escludo alcune parti di codice per costringere il movimento 
    // al solo asse verticale.
    
    if(playerNumber == 1) {
      switch(keyCode) {
        case UP:
        y = y - vel;
        break;
        case DOWN:
        y = y + vel;
        break;
        /*
        case LEFT:
        x = x - vel;
        break;
        case RIGHT:
        x = x + vel;
        break;
        */
        default:
        break;
       }
     } else if (playerNumber == 2) {
       switch(key) {
         case 'w':
         y = y - vel;
         break;
         case 's':
         y = y + vel;
         break;
         /*
         case 'a':
         x = x - vel;
         break;
         case 'd':
         x = x + vel;
         break;
         */
         default:
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


