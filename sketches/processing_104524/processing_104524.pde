
size(230, 250);
background(255);


fill(255,0,0);
rect(30,30, 120, 120); //quadrato rosso


fill(255,255,0);
rect (150, 30, 60, 60); //quadrato giallo alla destra del quadrato rosso

noStroke ();
rect (150, 0, 60, 30); // quadrato giallo sopra a quadrato giallo attaccat0

fill(255);
rect (150,90, 30, 60); //rett verticale bianco attaccato a quadeìrato rosso

rect (180,90, 30, 60); //rett verticale bianco attaccato all'altro bianco



stroke(1);
fill (0);
rect(30,150, 60, 60); //rett nero grande

stroke(1);
stroke(0);

fill(255);
rect(90,150, 60,30); //1 rett verticale bianco attaccato a quello nero

fill(255);
rect(90,180, 60,30); // rett verticale bianco attaccato a quello bianco

rect(150,150, 60,30); // rett bianco orizz, sotto ai due verticali

fill(0,0,153);
rect(150,180, 60,50); //rettangolo blu

noStroke ();
fill(255,0,0); //rett rosso verticale
rect(210,180, 20,80);

fill(0);
rect(90, 210, 60, 21);

noStroke ();
fill(255, 255, 0);
rect (0,180, 33 , 70); //rettangoletto giallo in basso a sinistra

stroke(0);
strokeCap(SQUARE);
strokeWeight(7);
line( 30, 30, 30, 240); // linea 1 verticale

stroke(0);
strokeCap(SQUARE);
strokeWeight(7);
line( 5, 30, 210, 30); // linea 2 orizzontale

stroke(0);
strokeCap(SQUARE);
strokeWeight(7);
line( 60, 5, 60, 30); // linea piccola 1

stroke(0);
strokeCap(SQUARE);
strokeWeight(7);
line( 150, 5, 150, 230); // linea 2 orizzontale

stroke(0);
strokeCap(SQUARE);
strokeWeight(7);
line( 210, 9, 210, 239); // ultima a destra

stroke(0);
strokeCap(SQUARE);
strokeWeight(7);
line( 90, 210, 90 , 245); // ultima a destra

stroke(0);
strokeCap(SQUARE);
strokeWeight(7);
line( 5, 180, 230, 180); // linea 2 orizzontale

stroke(0);
strokeCap(SQUARE);
strokeWeight(7);
line( 30, 150, 210, 150); // linea 2 orizzontale

stroke(0);
strokeCap(SQUARE);
strokeWeight(7);
line( 150, 90, 210, 90); // linea 2 orizzontale

stroke(0);
strokeCap(SQUARE);
strokeWeight(7);
line( 180, 90, 180, 150); // linea 2 orizzontale
