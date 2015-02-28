
// Esercizio Kanizsa
// Mannarelli - NTA1


// Setup
size(600, 600);
background(255);
stroke(0);
    

// Testo
fill (0);
textAlign(RIGHT);
textSize(26); 
text ("Kanizsa", 580, 580);
    
// Triangolo vero
strokeWeight(10);
fill(255);
triangle(300, 40, 500, 400, 100, 400);
    
// Cerchi
fill(0);
ellipse(100, 150, 100, 100);
ellipse(500, 150, 100, 100);
ellipse(300, 511, 100, 100);
    
// Triangolo finto (bianco)
noStroke();
fill(255);
translate(1200/2, 1100/2);
rotate(PI);
triangle(300, 40, 500, 400, 100, 400);
