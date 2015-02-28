
// creHACKtivity workshop
// incontro 02 - esercizio 03
// double FOR loop

int L = 100;

// SETUP //////////////////////////////////////////////////
void setup() {
    size(400, 400);
    smooth();
    frameRate(24);
}


// DRAW ///////////////////////////////////////////////////
void draw() {
    
    background(255);
   
    stroke(0);

    int c = 255; // diamo al colore un valore iniziale
    
    // doppio ciclo FOR
    for(int i = 0; i < 4; i++) {
        for(int j=0; j < 4; j++) {
            c -= 15;
            fill(c);
            rect(i*L, j*L, L, L);
        }
    }
}

