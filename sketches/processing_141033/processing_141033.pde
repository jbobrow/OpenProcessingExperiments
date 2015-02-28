
// Esercizio Bezold
// Mannarelli - NTA1


// Setup
size(600, 600);
background(128);
noStroke();


// Draw
int x1 = 125;
int y1 = 200;
int lato = 175;
    
// Testo
fill (0);
textAlign(RIGHT);
textSize(26); 
text ("Bezold", 580, 580);

// Quadrato 1
fill (255, 255, 255);
rect (x1, y1, lato, lato);
    
// Quadrato 2
fill (0, 0, 0);
rect (x1+lato, y1+0, lato, lato);
    
// Linee
fill (255, 0, 0);
for (int k=1 ; k<18 ; k++) {
  rect (x1, (y1-5)+(10*k), lato*2, 5);
}
