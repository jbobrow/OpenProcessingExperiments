
// creHACKtivity workshop
// incontro 02 - esercizio 04
// ARRAYS and FOR loops
// http://www.processing.org/reference/Array.html

int[] colors = new int[16];

int L = 45;
int margin = 30;

// SETUP //////////////////////////////////////////////////
void setup() {
    size(240, 240);
    smooth();
    frameRate(24);
    
    //inizializzazione degli elementi dell'array
    for(int i=0; i < 16; i++) {
        colors[i] = 0;
        //println("elemento " + i + "-esimo dell'array 'colors' = " + colors[i]);
    }
}


// DRAW ///////////////////////////////////////////////////
void draw() {
    background(255);  
    
    /*
          tabella dei due cicli for:
          i = indice della riga
          j = indice della colonna
          valori delle  'ascisse di guardia' = j*L & (j+1)*L
          valori delle 'ordinate di guardia' = i*L & (i+1)*L
          
          | i | j | i*L | (i+1)*L | j*L | (j+1)*L |
          +---+---+-----+---------+-----+---------+
          | 0 | 0 |  0  |    L    |  0  |   1*L   |
          | 0 | 1 |  0  |    L    |  L  |   2*L   |
          | 0 | 2 |  0  |    L    | 2*L |   3*L   |
          | 0 | 3 |  0  |    L    | 3*L |   4*L   |
          +---+---+-----+---------+-----+---------+
          | 1 | 0 |  L  |   2*L   |  0  |   1*L   |
          | 1 | 1 |  L  |   2*L   |  L  |   2*L   |
          | 1 | 2 |  L  |   2*L   | 2*L |   3*L   |
          | 1 | 3 |  L  |   2*L   | 3*L |   4*L   |
          +---+---+-----+---------+-----+---------+
          | 2 | 0 | 2*L |   3*L   |  0  |   1*L   |
          | 2 | 1 | 2*L |   3*L   |  L  |   2*L   |
          | 2 | 2 | 2*L |   3*L   | 2*L |   3*L   |
          | 2 | 3 | 2*L |   3*L   | 3*L |   4*L   |
          +---+---+-----+---------+-----+---------+
          | 3 | 0 | 3*L |   4*L   |  0  |   1*L   |
          | 3 | 1 | 3*L |   4*L   |  L  |   2*L   |
          | 3 | 2 | 3*L |   4*L   | 2*L |   3*L   |
          | 3 | 3 | 3*L |   4*L   | 3*L |   4*L   |
          
    */
    
    strokeWeight(3);
    stroke(0);
    
    // doppio ciclo FOR
    /* ciclo attraverso le 4 righe */
    for(int i = 0; i < 4; i++) { 
        /* ciclo attraverso le 4 colonne */
        for(int j=0; j < 4; j++) { 
          
          // definisco 'cl' una variabile di appoggio
          // rtasferisco il valore contenuto nell'array all'interno di 'cl'
          int cl = colors[ i*4 + j];
          
          // controllo se il mouse si trova tra i valori di guardia
          if( (mouseY > (margin+i*L)) && (mouseY < (margin+(i+1)*L)) && (mouseX > (margin+j*L)) && (mouseX < (margin+(j+1)*L)) ) {
            // se il puntatore del mouse si trova tra i valori di guardia
            // reimposto il calore 'cl' a 255
            cl = 255;
          } else {
            // se il mouse si trova al di fuori dei valori di guardia
            // provvedo a decrementare progressivamente la variabile 'cl'
            // ad ogni ciclo di draw
            if (cl > 0)
              cl -= 15;
          }
          
          // terminati i controlli, imposto il colore di riempimento
          fill( 255, 255-cl, 255-cl );
          // e disegno il rettangolo
          rect(margin+j*L, margin+i*L, L, L);
          
          // come ultima cosa, aggiorno il valore dell'array con
          // quello calcolato su base della posizione del mouse 'cl' 
          colors[ i*4 + j] = cl;
        }
    }
    
    /*
    // stampa per debug
    for(int i=0; i < 16; i++) {
        print(colors[i] + " ");
    }
    println();
    */    
}


