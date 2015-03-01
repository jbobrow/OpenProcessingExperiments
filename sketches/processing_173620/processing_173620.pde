
// Einfuehrung in Processing
// 1-2 Farben

size(28, 5);
background(0,154,188);

stroke (255,255,255);          // 255,255,255 ist weiss
strokeWeight (3);
   
noFill();
ellipse (90,100, 100,100);
   
fill (255,255,255);
ellipse (160,100, 100,100);
   
fill (0,0,0);                  // 0,0,0 ist schwarz  
ellipse (230,100, 100,100);
   
fill (255,0,0);                // rot
ellipse (300,100, 100,100);
   
fill (0,255,0);                //gruen
ellipse (370,100, 100,100);
   
fill (0,0,255);                //blau
ellipse (440,100, 100,100);
   
fill (255,206,0,230);           // 255,206,0 ist Orange die vierte Zahl gibt die Deckung an (auch sie geht von 0 bis 255)
ellipse (510,100, 100,100);

