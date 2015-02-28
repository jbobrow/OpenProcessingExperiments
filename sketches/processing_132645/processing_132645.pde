
// creHACKtivity workshop
// incontro 02 - esercizio 02
// single FOR loop

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
    
    int c = 255; // diamo a 'c' un valore iniziale
    
    // ciclo FOR
    for(int i = 0; i < 4; i++) {
        c -= 60;
        fill(c);
        rect(i*L, 0, L, L);
    }
    
}

