
// Esercizio Square
// Mannarelli NTA1


// Setup
size(600, 600);
background(255);

// Testo
fill (0);
textAlign(RIGHT);
textSize(26); 
text ("Square", 580, 580);
    
// Cerchi
fill(255);
strokeWeight(1);
for (int k=30 ; k>0 ; k--) {    
  ellipse(300, 300, 15*k, 15*k);
}
    
// Quadrato
noFill();
strokeWeight(3);
rect (150, 150, 300, 300);
