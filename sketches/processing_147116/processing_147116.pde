
 
boolean[][] celle;         // matrice bidimensionale con i valori delle celle correnti (da visualizzare)
boolean[][] nuoveCelle;    // matrice bidimensionale con i valori delle nuove celle (da elaborare)
 
void setup()
{
  size(400,400);
  noStroke();
  fill(0);
  
  celle = new boolean[100][100];       // crea una matrice di 100x100 valori booleani
  for (int n=0;  n < 2000;  n++) {     // imposta 2000 celle vive in posizioni casuali 
     int x = floor( random(100) );
     int y = floor( random(100) );
     celle[x][y] = true;
  } 
  nuoveCelle = new boolean[100][100]; 

  frameRate(30);
}
 
void draw()
{
  background(255);
  
  for (int x=0;  x<100;  x++) {     // per ogni cella ...
    for (int y=0;  y<100;  y++) {
      
      if (celle[x][y] == true) {    // se la cella nella posizione corrente e' viva ...
        rect( x*4,y*4, 4,4 );       // disegna un quadrato di 4 pixel di lato
      }

      int quanteVive = 0;                   // ricava il numero di celle vive intorno a quella corrente
      for (int dx=-1;  dx <= 1;  dx++) {    // dalla colonna precedente a quella successiva ...
        for (int dy=-1;  dy <= 1;  dy++) {    // dalla riga superiore a quella inferiore ...
          if (dx != 0 || dy != 0) {             // se il riferimento non e' alla cella corrente ... 
            if (celle[ (x+dx+100)%100 ][ (y+dy+100)%100 ] == true) {   // se la cella analizzata(*) e' viva ...
              quanteVive++;                                            // incrementa il valore di quanteVive  
            }
          }
        }
      }
                                                 // APPLICA LE REGOLE   
      if (quanteVive < 2 || quanteVive > 3) {    // se le celle vive sono meno di 2 o piu' di 3 ...
        nuoveCelle[x][y] = false;                //   la cella corrente muore (o rimane morta)
      } else if (quanteVive == 3) {              // altrimenti, se le celle vive sono esattamente 3 ...
        nuoveCelle[x][y] = true;                 //   la cella nasce (o rimane viva)
      } else {                                   // altrimenti, in tutti gli altri casi ... 
        nuoveCelle[x][y] = celle[x][y];          //   la cella mantiene il proprio stato
      }
    }
  } 

  for (int x=0;  x<100;  x++) {              // copia i valori delle celle elaborate nelle celle correnti
    arrayCopy( nuoveCelle[x], celle[x] );    // ... colonna per colonna
  }
}

void mousePressed()            // alla pressione del tasto del mouse ...
{
  cambiaStato();
}
void mouseDragged()           // allo spostamento del mouse con il tasto premuto ...
{
  cambiaStato();
}

void cambiaStato()            // cambia stato della cella sotto il cursore del mouse
{
  int x = int(mouseX / 4);    // ricava la posizione della cella sotto il cursore del mouse (mouseX,mouseY)
  int y = int(mouseY / 4);
  celle[x][y] = !celle[x][y]; // inverti (!) il valore booleano corrente (se la cella era viva diventa morta e viceversa)
}

//////////////////////////////////////////////////////////////////
// (*)     [ (x+dx+100)%100 ]
//
// x+dx -> per ottenere il riferimento alla cella da 
//         analizzare rispetto a quella corrente
// +100 -> per evitare indici di array con valori
//         negativi (se x==0 e dx==-1)
// %100 -> uso del resto della divisione per 100 
//         per evitare indici di array con valori
//         superiori al massimo (nel caso specifico 99)
//
//////////////////////////////////////////////////////////////////
