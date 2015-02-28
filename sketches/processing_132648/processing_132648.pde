
// creHACKtivity workshop
// incontro 02 - esercizio 04
// ARRAYS and FOR loops

// creiamo 4 ARRAY
//dichiarazione dell'array + allocazione della memoria necessaria
int[] rs = new int[4];
//dichiarazione dell'array + allocazione della memoria e 
//inizializzazione degli elementi dell'array
int[] gs = {255, 100, 29, 186};
int[] bs = new int[4];


int L = 100;

// SETUP //////////////////////////////////////////////////
void setup() {
    size(400, 400);
    smooth();
    frameRate(24);
    
    // stampiamo i 4 elementi contenuti nel primo array
    // da notare che gli elementi di questo array sono
    // stati automaticamente inizializzati a 0 nel momento della 
    // allocazione della memoria
    for(int i=0; i < 4; i++) {
        println("elemento " + i + "-esimo dell'array 'rs' = " + rs[i]);
    }
    
    println();
    
    // stampiamo i 4 elementi contenuti nel secondo array
    for(int i=0; i < 4; i++) {
        println("elemento " + i + "-esimo dell'array 'gs' = " + gs[i]);
    }
    
    println();
    
    // inizializziamo i 4 elementi dell'array uno ad uno tramite il ciclo for
    // inoltre stampiamone il contenuto
    for(int i=0; i < 4; i++) {
        bs[i] = i*60;
        println("elemento " + i + "-esimo dell'array 'bs' = " + bs[i]);
    }
   
}


// DRAW ///////////////////////////////////////////////////
void draw() {
    
    background(255);
   
    stroke(0);
    
    // utilizziamo i 3 array per definire il colore di 4 rettangoli
    for(int i = 0; i < 4; i++) {
      fill(rs[i], gs[i], bs[i]);
      rect(i*L, 0, L, L);
    }
    
    
}


